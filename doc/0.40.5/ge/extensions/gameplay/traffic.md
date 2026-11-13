# `gameplay_traffic`

*Fichier : `lua/ge/extensions/gameplay/traffic.lua` · VM : Game Engine (GE) · 1761 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_traffic` : `extensions.load("gameplay_traffic")`, puis la globale `gameplay_traffic`

**Dépendances (chargées avant) :** `gameplay_parking`, `gameplay_police`, `gameplay_taxi`, `gameplay_traffic_trafficUtils`, `core_vehicleActivePooling`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_traffic.activate(vehList)` |  | 966 |
| `gameplay_traffic.deactivate(stopAi)` |  | 992 |
| `gameplay_traffic.deleteVehicles()` |  | 956 |
| `gameplay_traffic.ensureReservedVehicles(providerName, count)` |  | 99 |
| `gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist)` |  | 508 |
| `gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist)` |  | 540 |
| `gameplay_traffic.freezeState(options)` |  | 1219 |
| `gameplay_traffic.getFocus()` |  | 383 |
| `gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit)` |  | 276 |
| `gameplay_traffic.getNumOfTraffic(activeOnly)` |  | 301 |
| `gameplay_traffic.getState()` |  | 297 |
| `gameplay_traffic.getTraffic()` |  | 309 |
| `gameplay_traffic.getTrafficAiVehIds()` |  | 305 |
| `gameplay_traffic.getTrafficAmount(activeOnly)` |  | 301 |
| `gameplay_traffic.getTrafficData()` |  | 309 |
| `gameplay_traffic.getTrafficList()` |  | 305 |
| `gameplay_traffic.getTrafficVars()` |  | 347 |
| `gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool)` |  | 778 |
| `gameplay_traffic.onClientEndMission()` | *(hook)* | 1566 |
| `gameplay_traffic.onClientStartMission()` | *(hook)* | 1554 |
| `gameplay_traffic.onDeserialized(data, options)` | *(hook)* | 1639 |
| `gameplay_traffic.onExtensionLoaded()` | *(hook)* | 1558 |
| `gameplay_traffic.onPreRender(dt)` | *(hook)* | 1493 |
| `gameplay_traffic.onSerialize(options)` | *(hook)* | 1591 |
| `gameplay_traffic.onSettingsChanged()` | *(hook)* | 1562 |
| `gameplay_traffic.onTrafficStarted()` | *(hook)* | 1516 |
| `gameplay_traffic.onTrafficStopped()` | *(hook)* | 1547 |
| `gameplay_traffic.onUiWaitingState()` | *(hook)* | 1574 |
| `gameplay_traffic.onUpdate(dtReal, dtSim)` | *(hook)* | 1417 |
| `gameplay_traffic.onVehicleActiveChanged(vehId, active)` | *(hook)* | 936 |
| `gameplay_traffic.onVehicleDestroyed(id)` | *(hook)* | 923 |
| `gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName)` | *(hook)* | 1346 |
| `gameplay_traffic.onVehicleMapmgrUpdate(id)` | *(hook)* | 1335 |
| `gameplay_traffic.onVehicleResetted(id)` | *(hook)* | 905 |
| `gameplay_traffic.onVehicleSpawned(id)` | *(hook)* | 890 |
| `gameplay_traffic.onVehicleSwitched(oldId, newId)` | *(hook)* | 901 |
| `gameplay_traffic.protectNonReservedVehicle(id, providerName)` | protects a non-reserved vehicle while a provider uses it (same protections as a claimed reserve) | 259 |
| `gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData)` |  | 226 |
| `gameplay_traffic.refreshVehicles()` |  | 688 |
| `gameplay_traffic.registerSpecialVehicleProvider(provider)` |  | 76 |
| `gameplay_traffic.removeReservedVehicles(providerName)` |  | 147 |
| `gameplay_traffic.removeTraffic(id, stopAi)` |  | 840 |
| `gameplay_traffic.respawnVehicle(id, pos, rot, strict)` |  | 488 |
| `gameplay_traffic.returnReservedVehicle(ids, immediate)` | returns in-service reserves to the dormant pool. They keep driving normally until traffic next<br> teleports/pools them out of sight, where they deactivate instead of respawning (setVehToDormant). | 215 |
| `gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist)` |  | 540 |
| `gameplay_traffic.setActiveAmount(amount)` |  | 773 |
| `gameplay_traffic.setDebugMode(value)` |  | 768 |
| `gameplay_traffic.setFocus(mode, data)` |  | 351 |
| `gameplay_traffic.setTrafficVars(data, reset)` |  | 713 |
| `gameplay_traffic.setupCustomTraffic(amount, params)` |  | 1184 |
| `gameplay_traffic.setupTraffic(amount, options)` |  | 1008 |
| `gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions)` |  | 1150 |
| `gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options)` |  | 1168 |
| `gameplay_traffic.spawnTraffic(amount, groupData, options)` | public interface | 998 |
| `gameplay_traffic.toggle(keepInMemory)` | spawns and de-spawns traffic vehicles in freeroam<br> keepInMemory allows instantenous reactivation at the expense of RAM consumption when traffic is disabled | 1193 |
| `gameplay_traffic.trackAIAllVeh(mode)` |  | 1330 |
| `gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options)` |  | 1226 |
| `gameplay_traffic.unprotectNonReservedVehicle(id)` | removes protection from a non-reserved vehicle, returning it to normal traffic | 264 |
| `gameplay_traffic.unregisterSpecialVehicleProvider(name)` |  | 90 |
| `gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter)` | puts up to `count` dormant reserves of a provider into service and activates them. Returns the ids. | 195 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | boolean |  |
| `dependencies` | table |  |
| `showMessages` | boolean | visual and logging debug mode |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficAmountChanged` — écouté par 2 module(s)
- `onTrafficOrParkingReady` — écouté par 2 module(s)
- `onTrafficReservedVehiclesReady`
- `onTrafficSpecialVehiclesProviders` — écouté par 2 module(s)
- `onTrafficStarted` — écouté par 7 module(s)
- `onTrafficStopped` — écouté par 6 module(s)
- `onTrafficVehicleAdded` — écouté par 2 module(s)
- `onTrafficVehicleRemoved` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `QuickAccessMenu`, `app:waiting`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getEnabled`, `getObjectActive`, `getObjectPositionXYZ`, `getObjectVelocityXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `obj:` `autoplace`, `delete`, `getDirectionVector`, `getDirectionVectorUp`, `getDynDataFieldbyName`, `getField`, `getMetallicPaintData`, `getPosition`, `isPlayerControlled`, `queueLuaCommand`, `resetBrokenFlexMesh`, `setDynDataFieldbyName`, `setMeshAlpha`, `setPositionRotation`

**Charge les extensions :** `core_multiSpawn`, `core_vehicleActivePooling`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic.lua`.*
