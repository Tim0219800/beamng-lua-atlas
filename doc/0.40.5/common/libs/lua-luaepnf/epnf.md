# `epnf`

*Fichier : `lua/common/libs/lua-luaepnf/epnf.lua` · VM : Commun (GE + véhicule) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `epnf`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `epnf.define(func, g, e)` | setup an environment where you can easily define lpeg grammars<br> with lots of syntax sugar | 108 |
| `epnf.dumpast(node)` | write a string representation of the given ast to stderr for<br> debugging | 208 |
| `epnf.parse(g, name, input, ...)` | apply a given grammar to a string and return the ast. also allows<br> to set the name of the string for error messages | 158 |
| `epnf.parsefile(g, fname, ...)` | apply a given grammar to the contents of a file and return the ast | 164 |
| `epnf.parsestring(g, str, ...)` | apply a given grammar to a string and return the ast. automatically<br> picks a sensible name for error messages | 174 |
| `epnf.raise(n, msg, s, p)` | raise an error during semantic validation of the ast | 51 |

## Classe `env_index`

Objet `env_index` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `env_index.E(msg)` |  | 91 |
| `env_index.EOF(msg)` |  | 94 |
| `env_index.W(s)` |  | 100 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-luaepnf/epnf.lua`.*
