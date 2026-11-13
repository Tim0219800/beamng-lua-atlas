# `profiling_vmdef`

*Fichier : `lua/vehicle/extensions/profiling/vmdef.lua` · VM : Véhicule · 363 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `profiling_vmdef` : `extensions.load (VM véhicule)("profiling_vmdef")`, puis la globale `profiling_vmdef`

Bibliothèque tierce : jit.vmdef de LuaJIT (Mike Pall), fichier généré (« DO NOT EDIT ») qui contient les tables de noms de la VM LuaJIT : noms des bytecodes, des instructions IR du compilateur de traces, des fonctions rapides intégrées, des erreurs de trace, etc. Il est utilisé par les outils de LuaJIT (profileur, dump de traces). Aucune fonction : uniquement des données en lecture seule.

## Remarques

- Les noms de bytecodes (bcnames) et d'IR (irnames) sont des chaînes à colonnes de largeur fixe de 6 caractères, pas des tables.
- Fichier généré par LuaJIT : ne pas le modifier ; il doit correspondre à la version de LuaJIT embarquée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `bcnames` | string | Noms des opcodes de bytecode LuaJIT concaténés, 6 caractères par nom. |
| `ffnames` | table | Noms des fonctions rapides intégrées (fast functions) de LuaJIT. |
| `ircall` | table | Noms des fonctions C appelées depuis l'IR (CALL), indexés à partir de 0. |
| `irfield` | table<integer, string> | Noms des champs d'objets internes lus par l'IR (str.len, func.env, tab.meta, tab.array, cdata.ptr…), indexés à partir de 0. |
| `irfpm` | table<integer, string> | Fonctions mathématiques de l'opération IR FPMATH (floor, ceil, trunc, sqrt, exp, exp2, log, log2, log10, sin, cos, tan, other), indexées à partir de 0. |
| `irnames` | string | Noms des instructions IR du compilateur de traces concaténés, 6 caractères par nom. |
| `traceerr` | table | Messages d'erreur d'abandon de trace du compilateur JIT, indexés à partir de 0. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/profiling/vmdef.lua`.*
