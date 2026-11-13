# `gameplay_freeformDelivery_routes`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/routes.lua` · VM : Game Engine (GE) · 1189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_routes` : `extensions.load("gameplay_freeformDelivery_routes")`, puis la globale `gameplay_freeformDelivery_routes`

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_goals`, `gameplay_freeformDelivery_markers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_routes.cleanup()` |  | 587 |
| `gameplay_freeformDelivery_routes.clearRoute()` | Clear current route | 487 |
| `gameplay_freeformDelivery_routes.getCurrentRoute()` | Get current active route | 453 |
| `gameplay_freeformDelivery_routes.getRoute(index)` | Get route by index | 440 |
| `gameplay_freeformDelivery_routes.getRouteCount()` | Get route count | 458 |
| `gameplay_freeformDelivery_routes.getRouteName(route)` | Get route display name | 422 |
| `gameplay_freeformDelivery_routes.getRoutes()` | Get all available routes | 448 |
| `gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId)` | Get target area position (public API) | 475 |
| `gameplay_freeformDelivery_routes.getTargetAreas()` | Get all target areas (for POI generation) | 463 |
| `gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId)` | Get vehicle position (public API) | 481 |
| `gameplay_freeformDelivery_routes.getVehicles()` | Get all vehicles (for POI generation) | 469 |
| `gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures)` | *(hook)* | 1134 |
| `gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData)` | Bigmap handlers *(hook)* | 1116 |
| `gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | *(hook)* | 1151 |
| `gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | *(hook)* | 1165 |
| `gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 1147 |
| `gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route)` | Set route to a target area | 366 |
| `gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route)` | Set route to a vehicle | 404 |
| `gameplay_freeformDelivery_routes.setup(delivery)` |  | 505 |
| `gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler)` |  | 582 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/routes.lua`.*
