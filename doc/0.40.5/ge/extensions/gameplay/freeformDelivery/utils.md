# `gameplay_freeformDelivery_utils`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/utils.lua` · VM : Game Engine (GE) · 245 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_utils` : `extensions.load("gameplay_freeformDelivery_utils")`, puis la globale `gameplay_freeformDelivery_utils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType)` | Check if vehicle is in area (unified function for location, zone, parkingSpot) | 114 |
| `gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot)` | Check if vehicle is in parking spot (uses parkingSpot:checkParking) | 101 |
| `gameplay_freeformDelivery_utils.clearVehicleCache()` | Clear vehicle cache | 63 |
| `gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId)` | Find site object by type and ID | 81 |
| `gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId)` | Find target area by ID in delivery data | 152 |
| `gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId)` | Find vehicle by ID in delivery data | 163 |
| `gameplay_freeformDelivery_utils.formatTime(seconds)` | Format time in seconds to HH:MM:SS or MM:SS | 68 |
| `gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh)` | Get cached vehicle position (returns cached vec3, don't modify!) | 46 |
| `gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot)` | Get parking information for a vehicle in a parking spot (uses parkingSpot:checkParking only) | 214 |
| `gameplay_freeformDelivery_utils.getPlayerPosition()` | Get player position (handles both vehicle and walking) | 199 |
| `gameplay_freeformDelivery_utils.getPlayerVehicle()` | Get player vehicle (upcasted) | 192 |
| `gameplay_freeformDelivery_utils.getVehicleIds(goal)` | Get vehicle IDs from goal (normalize vehicleId to vehicleIds array) | 96 |
| `gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId)` | Get vehicle object by delivery vehicle ID (returns upcasted vehicle) | 174 |
| `gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId)` | Get vehicle position by delivery vehicle ID (uses cached position) | 185 |
| `gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath)` | Resolve relative path to absolute path based on base path | 132 |
| `gameplay_freeformDelivery_utils.updateVehicleCache(veh)` | Update vehicle cache for a specific vehicle | 22 |
| `gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles)` | Update cache for all vehicles in a list | 37 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/utils.lua`.*
