# `editor_raceEditor_startPositions`

*Fichier : `lua/ge/extensions/editor/raceEditor/startPositions.lua` · VM : Game Engine (GE) · 354 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/startPositions")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_startPositions")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addHistory(name, old)` |  | 144 |
| `C:beginDrag()` |  | 102 |
| `C:createStartPosition()` |  | 151 |
| `C:dragging()` |  | 109 |
| `C:draw(mouseInfo)` |  | 211 |
| `C:drawStartPositions()` |  | 223 |
| `C:endDragging()` |  | 126 |
| `C:hoveringStartPosition()` |  | 69 |
| `C:init(raceEditor)` |  | 13 |
| `C:input()` |  | 86 |
| `C:onEditModeActivate()` |  | 205 |
| `C:selectStartPosition(id)` |  | 39 |
| `C:selected()` |  | 22 |
| `C:setPath(path)` |  | 18 |
| `C:unselect()` |  | 31 |
| `C:updateTransform(index)` |  | 52 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/startPositions.lua`.*
