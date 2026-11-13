# `flowgraph_nodes_scene_raceLineParking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua` · VM : Game Engine (GE) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/raceLineParking")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 44 |
| `C:_executionStopped()` |  | 48 |
| `C:_onDeserialized(res)` |  | 268 |
| `C:_onSerialize(res)` |  | 264 |
| `C:checkParking()` |  | 151 |
| `C:drawDebug()` |  | 272 |
| `C:drawImgui()` |  | 110 |
| `C:drawLine(line, color, thickness)` |  | 90 |
| `C:drawMiddle(builder, style)` |  | 260 |
| `C:getVehicleFrontwheelsCenterPosition(vehicle, pos)` |  | 236 |
| `C:init(mgr, ...)` |  | 40 |
| `C:onClientEndMission()` |  | 52 |
| `C:toInternal2d(pos)` |  | 77 |
| `C:work(args)` |  | 58 |
| `C:worldLineToMapLine(line)` |  | 101 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTriSolid`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua`.*
