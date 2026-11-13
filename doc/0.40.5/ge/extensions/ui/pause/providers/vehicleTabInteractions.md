# `ui_pause_providers_vehicleTabInteractions`

*Fichier : `lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua` · VM : Game Engine (GE) · 1775 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_vehicleTabInteractions` : `extensions.load("ui_pause_providers_vehicleTabInteractions")`, puis la globale `ui_pause_providers_vehicleTabInteractions`

**Dépendances (chargées avant) :** `core_vehicleBridge`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload)` |  | 1607 |
| `ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay()` |  | 1650 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context)` |  | 1662 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context)` |  | 1629 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context)` |  | 1612 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context)` |  | 1616 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context)` |  | 1654 |
| `ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName)` | *(hook)* | 1666 |
| `ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 1697 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleDestroyed()` | *(hook)* | 1685 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId)` | *(hook)* | 1693 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId)` | *(hook)* | 1689 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSpawned()` | *(hook)* | 1680 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSwitchPerformendByUser()` | *(hook)* | 1675 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSwitched()` | *(hook)* | 1670 |
| `ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload)` |  | 1633 |
| `ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload)` |  | 1620 |
| `ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec)` |  | 1642 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSwitchPerformendByUser` — écouté par 1 module(s)
- `onVehicleTabInteractionRemoveAll`
- `onVehicleTabInteractionRemoveVehicle`
- `trackNewVeh`

**Évènements UI (guihooks.trigger) :** `VehicleTabSpawnFinished`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua`.*
