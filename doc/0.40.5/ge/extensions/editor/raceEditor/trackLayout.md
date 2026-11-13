# `editor_raceEditor_trackLayout`

*Fichier : `lua/ge/extensions/editor/raceEditor/trackLayout.lua` · VM : Game Engine (GE) · 155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/trackLayout")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_trackLayout")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeField(field, new)` |  | 27 |
| `C:displayClassification(classification, name, field, tt)` |  | 78 |
| `C:draw()` |  | 20 |
| `C:drawGeneralInfo()` |  | 35 |
| `C:drawSplits()` |  | 107 |
| `C:drawStopZone()` |  | 89 |
| `C:init(raceEditor)` |  | 10 |
| `C:selected()` |  | 17 |
| `C:selector(name, objects, fieldName, clrI, tt)` |  | 120 |
| `C:setPath(path)` |  | 14 |
| `C:unselect()` |  | 18 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/trackLayout.lua`.*
