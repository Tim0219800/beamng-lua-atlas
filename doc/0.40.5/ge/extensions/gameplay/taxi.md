# `gameplay_taxi`

*Fichier : `lua/ge/extensions/gameplay/taxi.lua` · VM : Game Engine (GE) · 2061 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_taxi` : `extensions.load("gameplay_taxi")`, puis la globale `gameplay_taxi`

**Dépendances (chargées avant) :** `gameplay_util_vehicleSighting`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_taxi.callForTaxi()` |  | 1160 |
| `gameplay_taxi.cancelTaxiCall()` |  | 1092 |
| `gameplay_taxi.confirmTaxiDestination()` |  | 1765 |
| `gameplay_taxi.getTaxiState(vehId)` |  | 498 |
| `gameplay_taxi.getTaxiViewData()` |  | 356 |
| `gameplay_taxi.isTaxiRideActive()` |  | 1869 |
| `gameplay_taxi.isTaxiViewActive()` |  | 1870 |
| `gameplay_taxi.onAiRouteDone(vehId)` | *(hook)* | 1698 |
| `gameplay_taxi.onAnyMissionChanged()` | *(hook)* | 841 |
| `gameplay_taxi.onChangeDestinationCalled()` | *(hook)* | 1588 |
| `gameplay_taxi.onClientEndMission()` | *(hook)* | 866 |
| `gameplay_taxi.onDeactivateBigMapCallback()` | *(hook)* | 1771 |
| `gameplay_taxi.onExtensionUnloaded()` | *(hook)* | 2048 |
| `gameplay_taxi.onGameplayInteract()` | *(hook)* | 1705 |
| `gameplay_taxi.onHurryUpCalled()` | *(hook)* | 1624 |
| `gameplay_taxi.onRegisterQuickAccessMenus()` | *(hook)* | 1824 |
| `gameplay_taxi.onSetBigmapNavFocus(pos)` | *(hook)* | 1752 |
| `gameplay_taxi.onSkipCalled()` | *(hook)* | 1627 |
| `gameplay_taxi.onSlowDownCalled()` | *(hook)* | 1625 |
| `gameplay_taxi.onStopTaxiCalled()` | *(hook)* | 1677 |
| `gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data)` | *(hook)* | 1799 |
| `gameplay_taxi.onTrafficSpecialVehiclesProviders()` | *(hook)* | 250 |
| `gameplay_taxi.onTrafficStarted()` | *(hook)* | 837 |
| `gameplay_taxi.onTrafficStopped()` | *(hook)* | 866 |
| `gameplay_taxi.onTrafficVehicleAdded(id)` | *(hook)* | 845 |
| `gameplay_taxi.onTrafficVehicleCrashed(vehId)` | *(hook)* | 1804 |
| `gameplay_taxi.onTrafficVehicleRemoved(id)` | *(hook)* | 854 |
| `gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 1470 |
| `gameplay_taxi.onVehicleResetted(id)` | *(hook)* | 1791 |
| `gameplay_taxi.onVehicleSwitched(oldId, newId)` | *(hook)* | 1519 |
| `gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId)` | *(hook)* | 1713 |
| `gameplay_taxi.setIdleCameraEnabled(enabled)` |  | 1665 |
| `gameplay_taxi.setUseBillboards(enabled)` |  | 1907 |
| `gameplay_taxi.startTaxiWithCurrentRoute(skipWait)` |  | 764 |
| `gameplay_taxi.taxiSettingChanged()` |  | 833 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTaxiCalled` — écouté par 1 module(s)
- `onTaxiRideEnded` — écouté par 1 module(s)
- `onTaxiRideStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `TaxiDestinationPreviewed`

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectActive`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`, `setPhysicsSpeedFactor`
- `core_environment.` `getLightState`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/taxi.lua`.*
