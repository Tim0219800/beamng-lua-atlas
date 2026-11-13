# `editor_crawlEditor_boundaries`

*Fichier : `lua/ge/extensions/editor/crawlEditor/boundaries.lua` · VM : Game Engine (GE) · 751 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/boundaries")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_boundaries")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 506 |
| `C:clearSelection()` |  | 113 |
| `C:dragging()` |  | 519 |
| `C:draw(mouseInfo)` |  | 625 |
| `C:drawBoundariesList(allBoundaries, selection)` |  | 118 |
| `C:drawBoundaryDetail(boundary)` |  | 158 |
| `C:drawBoundaryEditor()` |  | 640 |
| `C:drawCustomFields(fields)` |  | 649 |
| `C:dropToTerrain(pos)` |  | 586 |
| `C:endDragging()` |  | 595 |
| `C:findVert(mouseInfo, objects)` |  | 378 |
| `C:getNewBoundary()` |  | 374 |
| `C:init(crawlEditorParam)` |  | 88 |
| `C:input(mouseInfo)` |  | 436 |
| `C:setBoundary(boundaryParam)` |  | 109 |
| `C:setFields(boundary)` |  | 102 |
| `C:tryInsert(mouseInfo)` |  | 413 |
| `C:updateTransform()` |  | 478 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/boundaries.lua`.*
