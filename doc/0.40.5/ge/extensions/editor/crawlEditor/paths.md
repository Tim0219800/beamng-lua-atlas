# `editor_crawlEditor_paths`

*Fichier : `lua/ge/extensions/editor/crawlEditor/paths.lua` · VM : Game Engine (GE) · 833 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/paths")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_paths")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addNodeAtCamera()` | Adds a node in front of the camera, dropped onto the terrain, so new nodes don't spawn at the origin. | 588 |
| `C:autoOrientNodes()` | Sets each node's rotation to face the next node, fixing gate orientations in one click. | 614 |
| `C:beginDrag()` |  | 545 |
| `C:dragging()` |  | 554 |
| `C:draw(mouseInfo)` |  | 720 |
| `C:drawPathDetail(path)` |  | 140 |
| `C:drawPathnodeSelectionIndicators(mouseInfo)` |  | 740 |
| `C:drawPathsList(allPaths, selection)` |  | 101 |
| `C:dropToTerrain(pos)` |  | 578 |
| `C:endDragging()` |  | 698 |
| `C:findPathnode(mouseInfo, objects)` |  | 427 |
| `C:getNewPath()` |  | 401 |
| `C:getNewPathnode()` |  | 410 |
| `C:getSelectedPathnodeIndex()` |  | 93 |
| `C:init(crawlEditorParam)` |  | 60 |
| `C:input(mouseInfo)` |  | 492 |
| `C:renumberNodes()` | Renames every node to a clean sequential "Node N". | 645 |
| `C:reversePathOrder()` | Reverses node order (so the trail can be authored in either direction). | 603 |
| `C:selectPathnode(index)` |  | 84 |
| `C:setAllRadii(radius)` | Applies a single radius to every node. | 636 |
| `C:setFields(path)` |  | 73 |
| `C:setPath(pathParam)` |  | 80 |
| `C:setSelectedPathnodeIndex(index)` |  | 97 |
| `C:snapAllToTerrain()` | Drops every node onto the terrain. | 654 |
| `C:tryInsert(mouseInfo)` |  | 459 |
| `C:updateTransform()` |  | 535 |
| `C:validatePath()` | Returns a list of human-readable problems found in the current path. | 665 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/paths.lua`.*
