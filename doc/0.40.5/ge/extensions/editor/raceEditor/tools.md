# `editor_raceEditor_tools`

*Fichier : `lua/ge/extensions/editor/raceEditor/tools.lua` · VM : Game Engine (GE) · 346 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/tools")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_tools")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeFieldMulti(field, newDataMap)` |  | 113 |
| `C:createDecoration(transforms)` |  | 42 |
| `C:displayClassification(classification, name, field, tt)` |  | 298 |
| `C:draw()` |  | 38 |
| `C:drawGeneralInfo()` |  | 129 |
| `C:existsIcon(f)` |  | 92 |
| `C:getSideTransformParameters()` |  | 123 |
| `C:init(raceEditor)` |  | 19 |
| `C:selected()` |  | 35 |
| `C:selector(name, objects, fieldName, clrI, tt)` |  | 311 |
| `C:setPath(path)` |  | 32 |
| `C:unselect()` |  | 36 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/tools.lua`.*
