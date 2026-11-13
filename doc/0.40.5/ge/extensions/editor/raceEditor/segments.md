# `editor_raceEditor_segments`

*Fichier : `lua/ge/extensions/editor/raceEditor/segments.lua` · VM : Game Engine (GE) · 443 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/segments")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_segments")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addHistory(name, old)` |  | 135 |
| `C:beginDrag()` |  | 81 |
| `C:dragging()` |  | 88 |
| `C:draw(mouseInfo)` |  | 142 |
| `C:drawSegmentList()` |  | 239 |
| `C:endDragging()` |  | 112 |
| `C:init(raceEditor)` |  | 12 |
| `C:input()` |  | 151 |
| `C:mouseDistanceTo(point, mouseInfo)` |  | 222 |
| `C:selectCapsule(index)` |  | 63 |
| `C:selectSegment(index)` |  | 39 |
| `C:selected()` |  | 22 |
| `C:setPath(path)` |  | 18 |
| `C:unselect()` |  | 30 |
| `C:updateTransform()` |  | 68 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/segments.lua`.*
