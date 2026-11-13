# `utils_torqueScriptParser`

*Fichier : `lua/common/utils/torqueScriptParser.lua` · VM : Commun (GE + véhicule) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/torqueScriptParser")`

Preuve de concept d'analyseur (parser PEG, via libs/lua-luaepnf/epnf) de fichiers TorqueScript : déclarations 'new/singleton/datablock', propriétés, fonctions (corps ignoré). Le fichier lui-même annonce 'pas complètement fonctionnel, loin d'être prêt'. Se charge avec require('utils/torqueScriptParser').

## Exemple

```lua
local ts = require('utils/torqueScriptParser')
local ok, ast = ts.parse(readFile('/levels/xxx/main.cs'))
```

## Remarques

- Le JIT est coupé (jit.off) pendant le chargement d'epnf car lulpeg tenterait d'utiliser l'indexation VLA non supportée.
- parse renvoie directement le résultat de pcall : (true, ast) ou (false, message d'erreur).
- Le corps des fonctions TorqueScript n'est pas analysé (accolades équilibrées uniquement).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_torqueScriptParser.parse(s)` | Analyse un texte TorqueScript avec la grammaire interne (epnf.parsestring) dans un pcall. | 95 |

### Détail des paramètres

#### `utils_torqueScriptParser.parse(s)`

Analyse un texte TorqueScript avec la grammaire interne (epnf.parsestring) dans un pcall.

- `s` (*string*) : Texte TorqueScript
- **renvoie** : boolean true si l'analyse a réussi
- **renvoie** : table|string Arbre syntaxique si succès, message d'erreur sinon

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/torqueScriptParser.lua`.*
