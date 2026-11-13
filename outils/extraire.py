# -*- coding: utf-8 -*-
"""Atlas de l'API Lua BeamNG : extraction statique.

Lit le dossier lua/ du jeu (lecture seule) et produit un JSON décrivant
chaque module : nom d'accès, VM, fonctions exportées (paramètres, commentaires,
ligne), champs, hooks implémentés, hooks émis, dépendances, appels vers le C++.

Usage : python -I extraire.py <dossier_jeu> <sortie.json>
"""
import json, os, re, sys
from collections import defaultdict, Counter

KW_OPEN = {"function", "if", "do", "repeat"}
KW_CLOSE = {"end", "until"}
NAME = r"[A-Za-z_][A-Za-z0-9_]*"

# Objets C++ dont on relève les appels de méthodes dans le Lua du jeu
CPP_RECEIVERS = ["be", "obj", "scenetree", "Engine", "Sim", "Lua", "Steam", "FS",
                 "core_environment", "Settings", "TorqueScriptLua", "worldEditorCppApi",
                 "ui_imgui", "BeamEngine", "Physics", "Render", "ResearchVerifier",
                 "Platform", "Point3F", "ColorF", "debugDrawer", "simTime", "WinInput"]


# ---------------------------------------------------------------- tokenizer
TOK_RE = re.compile(r"""
  (?P<nl>\n)
 |(?P<ws>[ \t\r\f]+)
 |(?P<lcom>--\[(?P<leq>=*)\[)
 |(?P<com>--[^\n]*)
 |(?P<lstr>\[(?P<seq>=*)\[)
 |(?P<str>"(?:\\.|[^"\\\n])*"|'(?:\\.|[^'\\\n])*')
 |(?P<num>0[xX][0-9a-fA-F.]+(?:[pP][+-]?\d+)?(?:ULL|LL|ull|ll|i)?|\d+\.?\d*(?:[eE][+-]?\d+)?(?:ULL|LL|ull|ll|i)?|\.\d+(?:[eE][+-]?\d+)?)
 |(?P<name>[A-Za-z_][A-Za-z0-9_]*)
 |(?P<op>\.\.\.|\.\.|==|~=|<=|>=|::|[-+*/%^\#<>=(){}\[\];:,.])
 |(?P<other>.)
""", re.X | re.S)


def tokenize(src):
    """Renvoie [(type, valeur, ligne)] ; les commentaires sont gardés (type 'com')."""
    toks = []
    i, line, n = 0, 1, len(src)
    while i < n:
        m = TOK_RE.match(src, i)
        kind = m.lastgroup
        if kind in ("leq", "seq"):
            kind = "lcom" if m.group("lcom") else "lstr"
        if kind == "nl":
            line += 1
            i = m.end()
            continue
        if kind == "ws" or kind == "other":
            i = m.end()
            continue
        if kind in ("lcom", "lstr"):
            eq = m.group("leq") if kind == "lcom" else m.group("seq")
            close = "]" + (eq or "") + "]"
            j = src.find(close, m.end())
            if j < 0:
                j = n
            text = src[m.end():j]
            toks.append(("com" if kind == "lcom" else "str", text, line))
            line += text.count("\n")
            i = j + len(close)
            continue
        val = m.group(kind)
        if kind == "com":
            val = val[2:]
        elif kind == "str":
            val = val[1:-1]
        toks.append((kind, val, line))
        i = m.end()
    return toks


# ---------------------------------------------------------------- helpers
def clean_comment(lines):
    out = []
    for l in lines:
        l = l.rstrip()
        l = re.sub(r"^-+\s?", "", l)          # ---- separators, ---@
        if re.fullmatch(r"[-=*#_ ]*", l):
            continue
        out.append(l)
    txt = "\n".join(out).strip()
    if re.search(r"This Source Code Form is subject|bCDDL", txt):
        return ""
    return txt


def literal_type(tok, nxt):
    k, v = tok[0], tok[1]
    if k == "str":
        return "string"
    if k == "num":
        return "number"
    if k == "name":
        if v in ("true", "false"):
            return "boolean"
        if v == "nil":
            return "nil"
        if v == "function":
            return "function"
        if v in ("vec3", "quat", "vec3f"):
            return v
    if k == "op" and v == "{":
        return "table"
    return "any"


def module_identity(rel):
    """rel = chemin relatif à lua/ en '/'. Renvoie (vm, kind, nom_accès)."""
    parts = rel[:-4].split("/")
    top = parts[0]
    vm = {"ge": "ge", "vehicle": "vehicle", "common": "common", "console": "console",
          "objectpool": "common"}.get(top, top)
    if len(parts) >= 3 and parts[1] == "extensions":
        name = "_".join(parts[2:])
        return vm, "extension", name
    if vm == "vehicle" and len(parts) >= 3 and parts[1] == "controller":
        return vm, "controller", "/".join(parts[2:])
    if vm == "vehicle" and len(parts) >= 3 and parts[1] == "powertrain":
        return vm, "powertrain", "/".join(parts[2:])
    if vm == "vehicle" and len(parts) >= 3 and parts[1] == "energyStorage":
        return vm, "energyStorage", "/".join(parts[2:])
    return vm, "module", "/".join(parts[1:])


# ---------------------------------------------------------------- analyse d'un fichier
def analyse(src, rel):
    toks = tokenize(src)
    code = []          # tokens sans commentaires, avec index des commentaires précédents
    pending = []       # commentaires accumulés
    last_line = -10
    for t in toks:
        if t[0] == "com":
            if t[2] > last_line + 1 and pending and pending[-1][1] < t[2] - 1:
                pending = []
            pending.append((t[1], t[2] + t[1].count("\n")))
            continue
        # commentaire juste au-dessus (pas de ligne vide) ou en fin de ligne précédente
        com = ""
        if pending and pending[-1][1] >= t[2] - 1:
            com = clean_comment([c for c, _ in pending])
        code.append((t[0], t[1], t[2], com))
        pending = []
        last_line = t[2]

    funcs = {}         # nom local -> info
    defs = []          # définitions top-level (nom qualifié, info)
    assigns = []       # (cible, valeur) top-level : M.x = y
    globals_set = {}
    returns = None
    hooks_fired = Counter()
    gui_events = Counter()
    cpp_calls = defaultdict(Counter)
    requires = []
    ext_loads = Counter()
    deps = []
    depth = 0
    n = len(code)
    i = 0
    local_names = set()

    def params_at(j):
        """code[j] == '(' ; renvoie (liste params, index après ')')."""
        ps = []
        j += 1
        while j < n and code[j][1] != ")":
            if code[j][0] == "name" or code[j][1] == "...":
                ps.append(code[j][1])
            j += 1
        return ps, j + 1

    def qualified(j):
        """lit A.B.C ou A:B à partir de j ; renvoie (nom, index suivant, methode)."""
        nm = code[j][1]
        j += 1
        method = False
        while j + 1 < n and code[j][1] in (".", ":") and code[j + 1][0] == "name":
            if code[j][1] == ":":
                method = True
            nm += code[j][1] + code[j + 1][1]
            j += 2
        return nm, j, method

    nest = 0
    return_style = None
    inst_assign = []
    while i < n:
        k, v, line, com = code[i]
        prev = code[i - 1][1] if i else ""
        if k == "op" and v in ("{", "(", "["):
            nest += 1
        elif k == "op" and v in ("}", ")", "]"):
            nest = max(0, nest - 1)
        # --- références globales intéressantes (toute profondeur)
        if k == "name":
            if v == "extensions" and i + 3 < n and code[i + 1][1] == "." and code[i + 2][1] in ("hook", "hookNotify", "hookExcept", "hookUpdate") and code[i + 3][1] == "(":
                if i + 4 < n and code[i + 4][0] == "str":
                    hooks_fired[code[i + 4][1]] += 1
            if v == "extensions" and i + 4 < n and code[i + 1][1] == "." and code[i + 2][1] == "load" and code[i + 4][0] == "str":
                ext_loads[code[i + 4][1]] += 1
            if v == "guihooks" and i + 4 < n and code[i + 2][1] in ("trigger", "triggerStream") and code[i + 4][0] == "str":
                gui_events[code[i + 4][1]] += 1
            if v == "require" and prev != "." and i + 1 < n:
                j = i + 1
                if code[j][1] == "(":
                    j += 1
                if j < n and code[j][0] == "str":
                    tgt = None
                    if i >= 2 and code[i - 1][1] == "=" and code[i - 2][0] == "name":
                        tgt = code[i - 2][1]
                        is_local = i >= 3 and code[i - 3][1] == "local"
                    else:
                        is_local = False
                    requires.append({"module": code[j][1], "as": tgt, "local": is_local, "depth": depth})
            if v in CPP_RECEIVERS and prev not in (".", ":") and i + 3 < n and code[i + 1][1] in (":", ".") and code[i + 2][0] == "name" and code[i + 3][1] in ("(", "{") :
                cpp_calls[v + code[i + 1][1]][code[i + 2][1]] += 1

        # --- méthodes d'instance (dans les fonctions) : obj.name = fonctionLocale / local obj = { name = fonctionLocale }
        if depth > 0 and k == "name" and prev not in (".", ":") and i + 5 < n and code[i + 1][1] == "." and code[i + 2][0] == "name"                 and code[i + 3][1] == "=" and code[i + 4][0] == "name" and code[i + 5][1] not in (".", ":", "(", "[", "=") and code[i + 4][1] not in ("function", "nil", "true", "false"):
            inst_assign.append((v, code[i + 2][1], code[i + 4][1]))
        if depth > 0 and k == "name" and v == "local" and i + 3 < n and code[i + 1][0] == "name" and code[i + 2][1] == "=" and code[i + 3][1] == "{":
            lvl, jj, var = 0, i + 3, code[i + 1][1]
            while jj < n:
                t = code[jj]
                if t[1] in ("{", "(", "["):
                    lvl += 1
                elif t[1] in ("}", ")", "]"):
                    lvl -= 1
                    if lvl == 0:
                        break
                elif lvl == 1 and t[0] == "name" and code[jj + 1][1] == "=" and code[jj - 1][1] in ("{", ",", ";")                         and code[jj + 2][0] == "name" and code[jj + 3][1] in (",", "}", ";"):
                    inst_assign.append((var, t[1], code[jj + 2][1]))
                jj += 1

        # --- profondeur des blocs
        if k == "name" and v in KW_OPEN:
            # top-level definitions
            if v == "function" and depth == 0:
                is_local = prev == "local"
                if i + 1 < n and code[i + 1][0] == "name":
                    nm, j, method = qualified(i + 1)
                    if j < n and code[j][1] == "(":
                        ps, _ = params_at(j)
                        if method:
                            ps = ["self"] + ps
                        doc = com or (code[i - 1][3] if is_local else "")
                        info = {"name": nm, "params": ps, "line": line, "doc": doc,
                                "local": is_local, "method": method}
                        if is_local or "." not in nm and ":" not in nm:
                            funcs[nm] = info
                        if is_local:
                            local_names.add(nm)
                        else:
                            defs.append(info)
                elif i >= 2 and prev == "=":
                    pass  # géré par l'affectation
            depth += 1
            i += 1
            continue
        if k == "name" and v in KW_CLOSE:
            depth = max(0, depth - 1)
            i += 1
            continue

        if depth == 0 and nest == 0 and k == "name":
            # local NAME = ...
            if v == "local" and i + 1 < n and code[i + 1][0] == "name" and code[i + 1][1] != "function":
                j = i + 1
                names = []
                while j < n and code[j][0] == "name":
                    names.append(code[j][1]); local_names.add(code[j][1])
                    if j + 1 < n and code[j + 1][1] == ",":
                        j += 2
                    else:
                        j += 1
                        break
                if j < n and code[j][1] == "=" and len(names) == 1 and j + 1 < n:
                    if code[j + 1][1] == "function" and j + 2 < n and code[j + 2][1] == "(":
                        ps, _ = params_at(j + 2)
                        funcs[names[0]] = {"name": names[0], "params": ps, "line": line, "doc": com, "local": True, "method": False}
                    else:
                        funcs.setdefault("__localvalue__" + names[0], {"type": literal_type(code[j + 1], None), "line": line, "doc": com})
                i = j
                continue
            # return X  (fin du module)
            if v == "return" and i + 1 < n and code[i + 1][0] == "name" and code[i + 1][1] != "function" and (i + 2 >= n or code[i + 2][1] not in (".", ":", "(", "[")):
                returns = code[i + 1][1]
            if v == "return" and i + 1 < n and code[i + 1][1] == "function":
                return_style = "constructor"
            if v == "return" and i + 1 < n and code[i + 1][1] == "{":
                # return { a = b, c = function(...) ... end }
                returns = "<table>"
                lvl, jj = 0, i + 1
                while jj < n:
                    t = code[jj]
                    if t[1] in ("{", "(", "["):
                        lvl += 1
                    elif t[1] in ("}", ")", "]"):
                        lvl -= 1
                        if lvl == 0:
                            break
                    elif lvl == 1 and t[0] == "name" and jj + 1 < n and code[jj + 1][1] == "=" and code[jj - 1][1] in ("{", ",", ";"):
                        val = code[jj + 2]
                        if val[1] == "function" and code[jj + 3][1] == "(":
                            ps, _ = params_at(jj + 3)
                            defs.append({"name": "<table>." + t[1], "params": ps, "line": t[2], "doc": t[3], "local": False, "method": False})
                        else:
                            ref = val[1] if val[0] == "name" and code[jj + 3][1] in (",", "}", ";") else None
                            assigns.append({"target": "<table>." + t[1], "type": literal_type(val, None), "ref": ref, "line": t[2], "doc": t[3]})
                    jj += 1
            # NAME / A.B = ...
            if prev not in (".", ":", "local", "function", ",") and v not in ("return", "local", "if", "for", "while", "else", "elseif", "then"):
                nm, j, method = qualified(i)
                if j < n and code[j][1] == "=" and not (j + 1 < n and code[j + 1][1] == "="):
                    if j + 1 < n:
                        val = code[j + 1]
                        if val[1] == "function" and j + 2 < n and code[j + 2][1] == "(":
                            ps, _ = params_at(j + 2)
                            if "." not in nm and ":" not in nm:
                                funcs[nm] = {"name": nm, "params": ps, "line": line, "doc": com, "local": nm in local_names, "method": False}
                            defs.append({"name": nm, "params": ps, "line": line, "doc": com, "local": False, "method": False})
                        else:
                            ref = None
                            if val[0] == "name" and j + 2 < n and code[j + 2][1] not in (".", ":", "(", "["):
                                ref = val[1]
                            assigns.append({"target": nm, "type": literal_type(val, None), "ref": ref, "line": line, "doc": com})
                            if nm.endswith(".dependencies") and val[1] == "{":
                                jj = j + 2
                                while jj < n and code[jj][1] != "}":
                                    if code[jj][0] == "str":
                                        deps.append(code[jj][1])
                                    jj += 1
                    i = j + 1
                    continue
        i += 1

    # ---- assemblage du module
    mod_var = returns
    exports = {}
    fields = {}
    globals_fn = {}
    for d in defs:
        nm = d["name"]
        sep = ":" if ":" in nm else "."
        head, _, tail = nm.partition(sep)
        if mod_var and head == mod_var and tail and "." not in tail and ":" not in tail:
            exports[tail] = dict(d, name=tail)
        elif "." not in nm and ":" not in nm:
            if nm not in local_names:
                globals_fn[nm] = d
        else:
            # sous-table : M.sub.fn ou Classe.methode
            exports.setdefault("__other__", []).append(d) if False else None
            globals_fn.setdefault("__qualified__" + nm, d)
    for a in assigns:
        nm = a["target"]
        if "." not in nm:
            if nm not in local_names and a["type"] != "nil":
                globals_set[nm] = {"type": a["type"], "line": a["line"], "ref": a["ref"]}
            continue
        head, _, tail = nm.partition(".")
        if mod_var and head == mod_var and "." not in tail:
            ref = a["ref"]
            if ref and ref in funcs and "params" in funcs[ref]:
                f = funcs[ref]
                exports[tail] = {"name": tail, "params": f["params"], "line": f["line"],
                                 "doc": f["doc"] or a["doc"], "local": False, "method": False, "impl": ref}
            elif tail not in exports:
                t = a["type"]
                if ref and ("__localvalue__" + ref) in funcs:
                    t = funcs["__localvalue__" + ref]["type"]
                fields[tail] = {"type": t, "line": a["line"], "doc": a["doc"], "ref": ref,
                                "refKnown": bool(ref) and (ref in local_names or ref in funcs or ref in globals_set)}
    # globals définis par fonction locale exportée ? (ex: rawset) : ignoré
    qualified_fns = {k[len("__qualified__"):]: v for k, v in globals_fn.items() if k.startswith("__qualified__")}
    plain_globals = {k: v for k, v in globals_fn.items() if not k.startswith("__qualified__")}
    instances = {}
    for var, name, ref in inst_assign:
        f = funcs.get(ref)
        if f and "params" in f:
            instances.setdefault(var, {})[name] = {"name": name, "params": f["params"], "line": f["line"], "doc": f["doc"], "impl": ref,
                                                   "local": False, "method": bool(f["params"] and f["params"][0] in ("self", var))}
    instances = {k: v for k, v in instances.items() if len(v) >= 2 and k != mod_var}
    classes = {}
    for qn, d in qualified_fns.items():
        sep = ":" if ":" in qn else "."
        head, _, tail = qn.partition(sep)
        if head in local_names and "." not in tail and ":" not in tail and head != mod_var:
            classes.setdefault(head, {})[tail] = dict(d, name=tail)
    # garder les sous-tables qui ne sont pas des appels sur des locaux arbitraires
    head_comment = ""
    if toks and toks[0][0] == "com":
        cs = []
        for t in toks:
            if t[0] != "com":
                break
            cs.append(t[1])
        head_comment = clean_comment(cs)
    return {
        "moduleVar": mod_var,
        "returnStyle": return_style or ("table" if mod_var else None),
        "classes": classes,
        "instances": instances,
        "exports": exports,
        "fields": fields,
        "globalFunctions": plain_globals,
        "qualifiedFunctions": {k: v for k, v in qualified_fns.items() if not (mod_var and k.startswith(mod_var + "."))},
        "globalVariables": globals_set,
        "hooksFired": dict(hooks_fired),
        "guiEvents": dict(gui_events),
        "cppCalls": {k: dict(v) for k, v in cpp_calls.items()},
        "requires": requires,
        "extensionLoads": dict(ext_loads),
        "dependencies": deps,
        "headComment": head_comment,
        "lines": src.count("\n") + 1,
    }


def main():
    game, out = sys.argv[1], sys.argv[2]
    root = os.path.join(game, "lua")
    modules = {}
    errors = []
    for dp, dn, fn in os.walk(root):
        dn.sort()
        for f in sorted(fn):
            if not f.endswith(".lua"):
                continue
            p = os.path.join(dp, f)
            rel = os.path.relpath(p, root).replace("\\", "/")
            try:
                with open(p, encoding="utf-8", errors="replace") as fh:
                    src = fh.read()
                info = analyse(src, rel)
            except Exception as e:  # noqa
                errors.append((rel, repr(e)))
                continue
            vm, kind, name = module_identity(rel)
            info.update({"path": "lua/" + rel, "vm": vm, "kind": kind, "access": name})
            modules[rel] = info

    # noms globaux donnés par require (X = require("y"))
    global_alias = defaultdict(set)
    for rel, m in modules.items():
        for r in m["requires"]:
            if r["as"] and not r["local"]:
                global_alias[r["module"].replace(".", "/")].add(r["as"])
    for rel, m in modules.items():
        base = rel[:-4]
        cands = set()
        for mod, names in global_alias.items():
            # require("wheels") depuis vehicle/main.lua -> vehicle/wheels.lua ; "common/..." -> common
            if base.endswith("/" + mod) or base == mod:
                cands |= names
        m["globalNames"] = sorted(cands)

    # qui implémente quel hook (fonctions exportées on*)
    hook_impl = defaultdict(list)
    hook_fire = defaultdict(list)
    for rel, m in modules.items():
        for e in m["exports"]:
            if re.match(r"on[A-Z]", e):
                hook_impl[(m["vm"], e)].append(m["access"])
        for h in m["hooksFired"]:
            hook_fire[(m["vm"], h)].append(m["access"])
    hooks = {}
    for (vm, h) in set(hook_impl) | set(hook_fire):
        hooks.setdefault(vm, {})[h] = {"firedBy": sorted(hook_fire.get((vm, h), [])),
                                       "implementedBy": sorted(hook_impl.get((vm, h), []))}

    import hashlib
    meta = {"game": "<BeamNG.drive>"}  # chemin local volontairement non enregistré
    try:
        with open(os.path.join(game, "integrity.json"), encoding="utf-8") as fh:
            meta["build"] = json.load(fh).get("buildinfo")
    except Exception:
        pass
    data = {"meta": meta, "modules": modules, "hooks": hooks, "errors": errors}
    with open(out, "w", encoding="utf-8") as fh:
        json.dump(data, fh, ensure_ascii=False, indent=1, sort_keys=True)
    nfn = sum(len(m["exports"]) for m in modules.values())
    print(f"{len(modules)} modules, {nfn} fonctions exportées, {sum(len(v) for v in hooks.values())} hooks, {len(errors)} erreurs")
    for e in errors[:10]:
        print("ERR", e)


if __name__ == "__main__":
    main()
