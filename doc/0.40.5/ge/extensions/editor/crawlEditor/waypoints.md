# `editor_crawlEditor_waypoints`

*Fichier : `lua/ge/extensions/editor/crawlEditor/waypoints.lua` · VM : Game Engine (GE) · 636 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/waypoints")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_waypoints")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 86 |
| `C:createManualPathnode()` |  | 179 |
| `C:dragging()` |  | 97 |
| `C:draw(mouseInfo)` |  | 328 |
| `C:drawCustomFields(fields)` |  | 546 |
| `C:drawPathnodeDetail(pathnode, index)` |  | 461 |
| `C:drawPathnodeList(trail)` |  | 366 |
| `C:drawPathnodeSegments()` |  | 278 |
| `C:drawPathnodeSelectionIndicators()` |  | 247 |
| `C:endDragging()` |  | 139 |
| `C:getSelectedPathnodeIndex()` |  | 538 |
| `C:handleMouseDown(hovered)` |  | 167 |
| `C:init(crawlEditorParam)` |  | 33 |
| `C:input()` |  | 336 |
| `C:mouseOverPathnodes()` |  | 222 |
| `C:selectPathnode(id)` |  | 48 |
| `C:selectedPathnode()` |  | 159 |
| `C:setPath(pathParam)` |  | 44 |
| `C:setSelectedPathnodeIndex(indexParam)` |  | 542 |
| `C:updateTransform(index)` |  | 65 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/waypoints.lua`.*
