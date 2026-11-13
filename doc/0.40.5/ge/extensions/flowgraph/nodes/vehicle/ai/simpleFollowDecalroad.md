# `flowgraph_nodes_vehicle_ai_simpleFollowDecalroad`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` |  | 129 |
| `C:getVeh()` |  | 61 |
| `C:init()` |  | 33 |
| `C:loadRecording()` |  | 98 |
| `C:onVehicleSubmitInfo(id, info)` |  | 47 |
| `C:play()` |  | 71 |
| `C:stop()` |  | 87 |
| `C:work()` |  | 121 |

## Appels vers le moteur (C++)

- `be:` `queueAllObjectLua`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua`.*
