# `ui_multiseat_multiseatVehicles`

*Fichier : `lua/ge/extensions/ui/multiseat/multiseatVehicles.lua` · VM : Game Engine (GE) · 2166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_multiseatVehicles` : `extensions.load("ui_multiseat_multiseatVehicles")`, puis la globale `ui_multiseat_multiseatVehicles`

**Dépendances (chargées avant) :** `core_locales`, `core_playerPersonas`, `core_vehicle_configTarget`, `ui_gridSelectorRouteLifecycleCallbacks`, `ui_vehicleSelector_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player)` | stop tracking a player's vehicle without deleting it, so it survives the multiseat teardown. | 1943 |
| `ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh)` |  | 1596 |
| `ui_multiseat_multiseatVehicles.applyStagedChanges()` |  | 1834 |
| `ui_multiseat_multiseatVehicles.areVehiclesReady(spawned)` |  | 1986 |
| `ui_multiseat_multiseatVehicles.cancelPreparedChanges()` |  | 1853 |
| `ui_multiseat_multiseatVehicles.clearCustomSplitPlayers()` |  | 683 |
| `ui_multiseat_multiseatVehicles.clearSession()` |  | 1928 |
| `ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId)` |  | 1062 |
| `ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId)` |  | 1108 |
| `ui_multiseat_multiseatVehicles.discardStagedChanges()` |  | 1857 |
| `ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload)` |  | 1057 |
| `ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig)` |  | 1793 |
| `ui_multiseat_multiseatVehicles.gatherVehicles(target)` |  | 1370 |
| `ui_multiseat_multiseatVehicles.getAutomaticColorEnabled()` |  | 128 |
| `ui_multiseat_multiseatVehicles.getDigestData()` |  | 983 |
| `ui_multiseat_multiseatVehicles.getGatherVehicleOptions()` |  | 1308 |
| `ui_multiseat_multiseatVehicles.getOwnedVehicles()` |  | 1951 |
| `ui_multiseat_multiseatVehicles.getPersonaSelectorData()` |  | 905 |
| `ui_multiseat_multiseatVehicles.getSettingsData()` |  | 924 |
| `ui_multiseat_multiseatVehicles.getSharedVehicleOptions()` |  | 1222 |
| `ui_multiseat_multiseatVehicles.getStagedChanges()` |  | 833 |
| `ui_multiseat_multiseatVehicles.getStagedPlayers()` |  | 896 |
| `ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount)` |  | 70 |
| `ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount)` |  | 61 |
| `ui_multiseat_multiseatVehicles.getVehicleForPlayer(player)` |  | 1874 |
| `ui_multiseat_multiseatVehicles.hasUserChanges()` |  | 891 |
| `ui_multiseat_multiseatVehicles.isSynchronizing()` |  | 1996 |
| `ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId)` |  | 1138 |
| `ui_multiseat_multiseatVehicles.leaveDeviceGroup(player)` |  | 1144 |
| `ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction)` |  | 1120 |
| `ui_multiseat_multiseatVehicles.onClientEndMission()` | the level teardown takes the vehicles with it, so only the bookkeeping has to go *(hook)* | 2107 |
| `ui_multiseat_multiseatVehicles.onDeserialized(data)` | *(hook)* | 2038 |
| `ui_multiseat_multiseatVehicles.onExtensionUnloaded()` | *(hook)* | 2131 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data)` | *(hook)* | 1581 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data)` | *(hook)* | 1589 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data)` | *(hook)* | 1585 |
| `ui_multiseat_multiseatVehicles.onSerialize(reason)` | *(hook)* | 2000 |
| `ui_multiseat_multiseatVehicles.onUiWaitingState()` | *(hook)* | 2098 |
| `ui_multiseat_multiseatVehicles.onUpdate()` | *(hook)* | 2068 |
| `ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute)` | *(hook)* | 1466 |
| `ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player)` |  | 1557 |
| `ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers()` |  | 1440 |
| `ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player)` |  | 1415 |
| `ui_multiseat_multiseatVehicles.prepareStagedChanges()` |  | 1711 |
| `ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options)` |  | 1635 |
| `ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options)` |  | 1893 |
| `ui_multiseat_multiseatVehicles.removeAll()` |  | 1922 |
| `ui_multiseat_multiseatVehicles.removeDevice(deviceId)` |  | 1132 |
| `ui_multiseat_multiseatVehicles.repaintOwnedVehicles()` |  | 1973 |
| `ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData)` |  | 1509 |
| `ui_multiseat_multiseatVehicles.reseatAllPlayers()` |  | 1403 |
| `ui_multiseat_multiseatVehicles.resetSettingsSnapshots()` |  | 1866 |
| `ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players)` |  | 678 |
| `ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber)` |  | 1126 |
| `ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen)` |  | 1962 |
| `ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle)` |  | 1614 |
| `ui_multiseat_multiseatVehicles.spawnAll(spawnPlan)` |  | 1880 |
| `ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor)` |  | 1204 |
| `ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon)` |  | 1189 |
| `ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn)` |  | 1101 |
| `ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences)` |  | 1167 |
| `ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source)` |  | 1296 |
| `ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId)` |  | 1114 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `app:waiting`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `exitVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/multiseatVehicles.lua`.*
