# `gameplay_seatOccupants`

*Fichier : `lua/ge/extensions/gameplay/seatOccupants.lua` · VM : Game Engine (GE) · 2030 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_seatOccupants` : `extensions.load("gameplay_seatOccupants")`, puis la globale `gameplay_seatOccupants`

**Dépendances (chargées avant) :** `core_camera`, `core_vehicle_manager`, `core_input_actionFilter`, `core_gamestate`, `core_multiseat`, `ui_vehicleSelector_vehicleSpecifications`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_seatOccupants.canEnterVehicle(vehId, player)` |  | 365 |
| `gameplay_seatOccupants.cheeseburger(vehId)` |  | 1497 |
| `gameplay_seatOccupants.clearDummyOccupant(vehId, seatId)` |  | 1422 |
| `gameplay_seatOccupants.clearDummyOccupants(vehId)` |  | 1434 |
| `gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer)` |  | 875 |
| `gameplay_seatOccupants.enterSeat(vehId, triggerId, player)` |  | 1597 |
| `gameplay_seatOccupants.getDriverPlayer(vehId)` | lowest player index allowed to drive the vehicle, or nil if only passengers are present | 1388 |
| `gameplay_seatOccupants.getOccupantSystemVersion(vehId)` |  | 80 |
| `gameplay_seatOccupants.getPlayerPresence(player)` |  | 287 |
| `gameplay_seatOccupants.getSeatExitData(player, vehId)` |  | 1520 |
| `gameplay_seatOccupants.getSeats(vehId)` |  | 1322 |
| `gameplay_seatOccupants.getVehiclePresences(vehId)` |  | 1371 |
| `gameplay_seatOccupants.onBeforeVehicleReplaced(vehId)` | *(hook)* | 1809 |
| `gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player)` | *(hook)* | 1878 |
| `gameplay_seatOccupants.onCameraChanged(player, camName, vid)` | *(hook)* | 1756 |
| `gameplay_seatOccupants.onClientStartMission()` | *(hook)* | 1865 |
| `gameplay_seatOccupants.onDeserialized(data)` | *(hook)* | 1971 |
| `gameplay_seatOccupants.onExtensionLoaded(data)` | *(hook)* | 1939 |
| `gameplay_seatOccupants.onExtensionUnloaded()` | *(hook)* | 1952 |
| `gameplay_seatOccupants.onLocalParticipantsChanged()` | *(hook)* | 1870 |
| `gameplay_seatOccupants.onSerialize()` | *(hook)* | 1962 |
| `gameplay_seatOccupants.onSettingsChanged()` | *(hook)* | 1746 |
| `gameplay_seatOccupants.onSplitScreenChanged()` | *(hook)* | 1750 |
| `gameplay_seatOccupants.onVehicleDestroyed(vehId)` | *(hook)* | 1833 |
| `gameplay_seatOccupants.onVehicleReplaced(vehId)` | *(hook)* | 1813 |
| `gameplay_seatOccupants.onVehicleResetted(vehId)` | *(hook)* | 1826 |
| `gameplay_seatOccupants.onVehicleSpawned(vehId)` | *(hook)* | 1793 |
| `gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 1612 |
| `gameplay_seatOccupants.onVehicleTriggerActionLabel(data)` | *(hook)* | 1067 |
| `gameplay_seatOccupants.refreshOccupantMeshes(vehId)` | Re-assert occupant mesh visibility after a path modified it without using the sync hooks | 646 |
| `gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos)` |  | 1202 |
| `gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride)` |  | 1138 |
| `gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode)` |  | 1217 |
| `gameplay_seatOccupants.salad(vehId)` |  | 1501 |
| `gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight)` |  | 1400 |
| `gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride)` |  | 842 |
| `gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode)` |  | 478 |
| `gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled)` |  | 1718 |
| `gameplay_seatOccupants.showVehicleFullMessage(player)` |  | 379 |
| `gameplay_seatOccupants.switchSeat(player, direction)` |  | 1254 |
| `gameplay_seatOccupants.toggleUnseated(player)` |  | 1300 |
| `gameplay_seatOccupants.usesSeatSystem(vehId)` |  | 85 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugDisableOccupantSystem` | boolean |  |
| `debugDisableOccupantWeight` | boolean |  |
| `dependencies` | table |  |
| `enablePresenceDebugMessages` | boolean |  |
| `enableSeatEjection` | boolean |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPlayerVehiclePresenceChanged` — écouté par 2 module(s)
- `onResolveVehiclePresenceMode`
- `onSeatOccupantEnter` — écouté par 2 module(s)
- `onSeatOccupantExit` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`, `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/seatOccupants.lua`.*
