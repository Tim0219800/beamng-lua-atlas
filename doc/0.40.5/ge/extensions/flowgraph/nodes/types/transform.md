# `flowgraph_nodes_types_transform`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/transform.lua` · VM : Game Engine (GE) · 483 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/transform")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 317 |
| `C:_executionStopped()` |  | 341 |
| `C:_onDeserialized(nodeData)` |  | 459 |
| `C:_onSerialize(res)` |  | 448 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 392 |
| `C:drawCustom()` |  | 166 |
| `C:drawCustomProperties()` |  | 123 |
| `C:drawMiddle(builder, style)` |  | 346 |
| `C:gizmoBeginDrag()` |  | 42 |
| `C:gizmoDragging()` |  | 48 |
| `C:gizmoEndDrag()` |  | 79 |
| `C:hideProperties()` | called when the properties are no longer shown<br> "destroying" the gizmo | 113 |
| `C:init()` |  | 24 |
| `C:showProperties()` | called when the properties are shown<br> setting up the gizmo here | 85 |
| `C:updateTransform()` |  | 153 |
| `C:work()` |  | 321 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`
- `obj:` `getPosition`, `getRotation`, `getScale`
- `scenetree.` `findClassObjects`, `findObjectById`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/transform.lua`.*
