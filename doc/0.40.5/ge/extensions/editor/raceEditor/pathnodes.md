# `editor_raceEditor_pathnodes`

*Fichier : `lua/ge/extensions/editor/raceEditor/pathnodes.lua` · VM : Game Engine (GE) · 793 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/pathnodes")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_pathnodes")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:autoRecoverPos(reverse)` |  | 725 |
| `C:beginDrag()` |  | 80 |
| `C:createManualPathnode()` |  | 271 |
| `C:dragging()` |  | 94 |
| `C:draw(mouseInfo)` |  | 262 |
| `C:drawCustomFields(fields)` |  | 705 |
| `C:drawPathnodeList()` |  | 461 |
| `C:endDragging()` |  | 147 |
| `C:handleMouseDown(hovered)` |  | 173 |
| `C:handleMouseHold()` |  | 224 |
| `C:handleMouseUp()` |  | 234 |
| `C:init(raceEditor)` |  | 18 |
| `C:input()` |  | 416 |
| `C:mouseOverPathnodes()` |  | 399 |
| `C:onEditModeActivate()` |  | 256 |
| `C:selectNavgraphNode()` |  | 331 |
| `C:selectPathnode(id)` |  | 47 |
| `C:selected()` |  | 29 |
| `C:selectedPathnode()` |  | 166 |
| `C:selector(name, fieldName, clrI, tt)` |  | 747 |
| `C:setPath(path)` |  | 25 |
| `C:unselect()` |  | 39 |
| `C:updateTransform(index)` |  | 60 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/pathnodes.lua`.*
