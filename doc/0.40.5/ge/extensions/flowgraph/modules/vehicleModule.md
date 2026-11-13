# `flowgraph_modules_vehicleModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/vehicleModule.lua` · VM : Game Engine (GE) · 295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/vehicleModule")` (fichier sous extensions/ mais pas une extension classique)

**Dépendances (chargées avant) :** `gameplay_walk`, `core_vehicleBridge`

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addCouplerOffset(id, off, tag)` |  | 135 |
| `C:addForeignVehicle(veh, moreData)` | call this to add a vehicle that is not spawned by FG, but should still be tracked | 27 |
| `C:addVehicle(veh, moreData)` |  | 33 |
| `C:clear()` |  | 16 |
| `C:executionStarted()` |  | 150 |
| `C:executionStopped()` | this function will remove all vehicles, except if marked to not delete. | 195 |
| `C:getSpawnedVehicles()` |  | 22 |
| `C:getVehicle(id)` |  | 58 |
| `C:getVehicleIdByInternalName(name)` |  | 62 |
| `C:getVehiclesIdByInternalNameMatch(name)` |  | 71 |
| `C:init()` |  | 8 |
| `C:isBus(id)` |  | 281 |
| `C:isBusDoorOpen(id)` |  | 272 |
| `C:isBusKneel(id)` |  | 271 |
| `C:isCoupled(id)` |  | 243 |
| `C:isCoupledTo(id, other)` |  | 244 |
| `C:onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` |  | 234 |
| `C:onCouplerDetached(objId1, objId2, nodeId, obj2nodeId)` |  | 238 |
| `C:onUpdate()` |  | 81 |
| `C:onVehicleResetted(id)` |  | 289 |
| `C:readyUpVehicle(id)` |  | 105 |
| `C:registerBusChangeNotification(id)` |  | 263 |
| `C:requestBusData(id)` |  | 247 |
| `C:requestBusStop(id, data)` |  | 274 |
| `C:setKeepVehicle(id, keep)` |  | 170 |
| `C:storeFuelAmount(id)` |  | 155 |
| `C:updateBusDisplayData(id, data)` |  | 255 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/vehicleModule.lua`.*
