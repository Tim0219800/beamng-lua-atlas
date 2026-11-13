# `gameplay_parking`

*Fichier : `lua/ge/extensions/gameplay/parking.lua` · VM : Game Engine (GE) · 1126 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_parking` : `extensions.load("gameplay_parking")`, puis la globale `gameplay_parking`

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_parking.activate(vehIds)` |  | 660 |
| `gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist)` |  | 155 |
| `gameplay_parking.deactivate()` |  | 682 |
| `gameplay_parking.deleteVehicles(amount)` |  | 647 |
| `gameplay_parking.disableTracking(vehId)` |  | 394 |
| `gameplay_parking.enableTracking(vehId, autoDisable)` |  | 374 |
| `gameplay_parking.filterParkingSpots(psList, filters)` |  | 226 |
| `gameplay_parking.findParkingSpots(pos, minRadius, maxRadius)` |  | 197 |
| `gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist)` |  | 335 |
| `gameplay_parking.getCurrentParkingSpot(vehId)` |  | 403 |
| `gameplay_parking.getParkedCarsAmount(activeOnly)` |  | 462 |
| `gameplay_parking.getParkedCarsData()` |  | 470 |
| `gameplay_parking.getParkedCarsList()` |  | 466 |
| `gameplay_parking.getParkingAmount(activeOnly)` |  | 462 |
| `gameplay_parking.getParkingSpots()` |  | 74 |
| `gameplay_parking.getParkingVars()` |  | 458 |
| `gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters)` |  | 295 |
| `gameplay_parking.getState()` |  | 70 |
| `gameplay_parking.getTrackingData()` |  | 399 |
| `gameplay_parking.insertVehicle(vehId)` |  | 604 |
| `gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision)` |  | 95 |
| `gameplay_parking.onClientEndMission()` | *(hook)* | 1004 |
| `gameplay_parking.onClientStartMission()` | *(hook)* | 1001 |
| `gameplay_parking.onDeserialized(data, options)` | *(hook)* | 1049 |
| `gameplay_parking.onSerialize(options)` | *(hook)* | 1008 |
| `gameplay_parking.onUpdate(dt, dtSim)` | *(hook)* | 822 |
| `gameplay_parking.onVehicleActiveChanged(vehId, active)` | *(hook)* | 800 |
| `gameplay_parking.onVehicleDestroyed(vehId)` | *(hook)* | 787 |
| `gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName)` | *(hook)* | 772 |
| `gameplay_parking.onVehicleResetted(vehId)` | *(hook)* | 778 |
| `gameplay_parking.processVehicles(vehIds)` |  | 660 |
| `gameplay_parking.removeVehicle(vehId)` |  | 640 |
| `gameplay_parking.resetAll()` |  | 758 |
| `gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist)` |  | 362 |
| `gameplay_parking.setActiveAmount(amount)` |  | 453 |
| `gameplay_parking.setParkingVars(data, reset)` |  | 434 |
| `gameplay_parking.setSites(data)` | public interface | 45 |
| `gameplay_parking.setState(val)` |  | 58 |
| `gameplay_parking.setupVehicles(amount, options)` |  | 693 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugLevel` | number |  |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onParkingVehiclesActivated` — écouté par 1 module(s)
- `onParkingVehiclesDeactivated`
- `onVehicleParkingStatus` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `getEnabled`, `getObjectActive`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectPositionXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawSquarePrism`
- `obj:` `delete`, `getDirectionVector`, `getDirectionVectorUp`, `getDirectionVectorXYZ`, `getDynDataFieldbyName`, `getField`, `getMetallicPaintData`, `getPosition`, `setDynDataFieldbyName`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/parking.lua`.*
