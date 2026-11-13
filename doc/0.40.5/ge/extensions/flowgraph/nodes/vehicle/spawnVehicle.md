# `flowgraph_nodes_vehicle_spawnVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua` · VM : Game Engine (GE) · 244 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/spawnVehicle")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 93 |
| `C:_executionStopped()` |  | 85 |
| `C:drawMiddle(builder, style)` |  | 237 |
| `C:getCmd(action)` |  | 233 |
| `C:init()` |  | 55 |
| `C:onSpawnFailed()` | spawning can fail (e.g. low memory on PS5), so retry for a while and then abandon the mission | 62 |
| `C:postInit()` |  | 79 |
| `C:resetSpawnRetry()` |  | 50 |
| `C:work()` |  | 103 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua`.*
