# `flowgraph_nodes_gameplay_traffic_trafficSpawnGroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua` · VM : Game Engine (GE) · 136 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` |  | 44 |
| `C:init()` |  | 40 |
| `C:onNodeReset()` |  | 48 |
| `C:onVehicleGroupSpawned(vehIds, groupId)` |  | 77 |
| `C:postInit()` |  | 69 |
| `C:resetState()` |  | 62 |
| `C:work()` |  | 90 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua`.*
