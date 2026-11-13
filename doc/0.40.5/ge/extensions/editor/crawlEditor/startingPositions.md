# `editor_crawlEditor_startingPositions`

*Fichier : `lua/ge/extensions/editor/crawlEditor/startingPositions.lua` · VM : Game Engine (GE) · 581 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/startingPositions")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_startingPositions")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 381 |
| `C:clearSelection()` |  | 253 |
| `C:dragging()` |  | 394 |
| `C:draw(mouseInfo)` |  | 460 |
| `C:drawStartingPositionDetail(startingPosition)` |  | 108 |
| `C:drawStartingPositionIndicators(mouseInfo)` |  | 520 |
| `C:drawStartingPositionsList(allStartingPositions, selection)` |  | 72 |
| `C:dropToTerrain(pos)` |  | 429 |
| `C:endDragging()` |  | 438 |
| `C:getNewStartingPosition()` |  | 232 |
| `C:init()` |  | 55 |
| `C:input(mouseInfo)` |  | 257 |
| `C:setFields(startingPosition)` |  | 65 |
| `C:setStartingPosition(startingPositionParam)` |  | 249 |
| `C:updateTransform()` |  | 365 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/startingPositions.lua`.*
