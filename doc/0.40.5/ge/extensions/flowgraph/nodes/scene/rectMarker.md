# `flowgraph_nodes_scene_rectMarker`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/rectMarker")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 91 |
| `C:_executionStopped()` |  | 96 |
| `C:_onDeserialized(res)` |  | 404 |
| `C:_onSerialize(res)` |  | 400 |
| `C:checkParking()` |  | 132 |
| `C:clear()` |  | 66 |
| `C:createCornerMarker(markerName)` |  | 240 |
| `C:createMarkers()` |  | 266 |
| `C:drawCustomProperties()` |  | 227 |
| `C:drawMiddle(builder, style)` |  | 232 |
| `C:init(mgr, ...)` |  | 56 |
| `C:manageTrigger()` |  | 331 |
| `C:onClientEndMission()` |  | 100 |
| `C:updateMarkerPositions()` |  | 273 |
| `C:work(args)` |  | 105 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `Sim.` `upcast`
- `debugDrawer:` `drawTriSolid`
- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua`.*
