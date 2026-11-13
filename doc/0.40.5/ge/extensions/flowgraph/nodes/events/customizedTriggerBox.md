# `flowgraph_nodes_events_customizedTriggerBox`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua` · VM : Game Engine (GE) · 270 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/customizedTriggerBox")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 51 |
| `C:_executionStopped()` |  | 59 |
| `C:_onDeserialized(res)` |  | 263 |
| `C:_onSerialize(res)` |  | 259 |
| `C:checkIntersections()` |  | 66 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 178 |
| `C:drawCustomProperties()` |  | 235 |
| `C:drawMiddle(builder, style)` |  | 255 |
| `C:init(mgr, ...)` |  | 40 |
| `C:work(args)` |  | 93 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua`.*
