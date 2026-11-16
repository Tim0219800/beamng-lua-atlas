# `libs_LuaJIT_vmdef`

*Fichier : `lua/common/libs/LuaJIT/vmdef.lua` · VM : Commun (GE + véhicule) · 365 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuaJIT/vmdef")`

Fichier généré de LuaJIT (jit.vmdef, « DO NOT EDIT ») : tables de noms utilisées par les outils jit.* (dump, bc, v, profileur) pour afficher les bytecodes, instructions IR, fonctions rapides, appels C de l'IR et raisons d'échec de trace. Il renvoie une table de données ; utile seulement pour déboguer ou analyser le JIT.

## Champs

| Champ | Type | Description |
|---|---|---|
| `bcnames` | string | Noms des opcodes de bytecode LuaJIT concaténés, 6 caractères par opcode (complétés d'espaces). |
| `ffnames` | table<integer, string> | Noms des fonctions rapides (fast functions) de LuaJIT, indexés à partir de 0 ("Lua", "C", "assert"…). |
| `ircall` | table<integer, string> | Noms des fonctions C appelées par l'IR (lj_str_cmp, lj_tab_new1, sqrt…), indexés à partir de 0. |
| `irfield` | table<integer, string> | Noms des champs d'objets accessibles par l'IR (str.len, func.env, tab.meta, tab.array…), indexés à partir de 0. |
| `irfpm` | table<integer, string> | Noms des fonctions mathématiques FPMATH de l'IR (floor, ceil, trunc, sqrt, exp, exp2, log, log2, log10, sin, cos, tan, other), indexées à partir de 0. |
| `irnames` | string | Noms des opérations IR du compilateur de traces, concaténés par blocs de 6 caractères. |
| `traceerr` | table<integer, string> | Messages d'erreur d'enregistrement de trace (ex. "trace too short", "trace too long"), indexés à partir de 0. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaJIT/vmdef.lua`.*
