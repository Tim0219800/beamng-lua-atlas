# `ui_vehicleSelector_vehicleOperations`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua` · VM : Game Engine (GE) · 542 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_vehicleOperations` : `extensions.load("ui_vehicleSelector_vehicleOperations")`, puis la globale `ui_vehicleSelector_vehicleOperations`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_vehicleOperations.addButton(...)` | Expose button instance methods for external use | 537 |
| `ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...)` |  | 538 |
| `ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData)` | Execute button callback by ID with additional logic | 40 |
| `ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails)` |  | 497 |
| `ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh)` | Get current vehicle thumbnail similar to inventory.lua | 316 |
| `ui_vehicleSelector_vehicleOperations.getFreeButtonId(...)` |  | 539 |
| `ui_vehicleSelector_vehicleOperations.getManagementDetails()` | Get management details for vehicle operations | 332 |
| `ui_vehicleSelector_vehicleOperations.getVehicleName(veh)` | Get vehicle name similar to quickAccess.lua | 289 |
| `ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly)` |  | 225 |
| `ui_vehicleSelector_vehicleOperations.onScreenFadeState(state)` | Handle fade screen state changes *(hook)* | 52 |
| `ui_vehicleSelector_vehicleOperations.onUiWaitingState(state)` | *(hook)* | 59 |
| `ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons)` | Set custom details buttons for challenge mode | 520 |
| `ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled)` | Set details button for freeroam mode | 515 |
| `ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled)` | Set management buttons enabled/disabled state | 510 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `managementButtonsEnabled` | boolean |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorCloneCurrent`
- `onVehicleSelectorLoadDefault`
- `onVehicleSelectorRemoveAll`
- `onVehicleSelectorRemoveCurrent`
- `onVehicleSelectorRemoveOthers`
- `onVehicleSelectorReplaceCurrent` — écouté par 1 module(s)
- `onVehicleSelectorReplaceCurrentRequested`
- `onVehicleSelectorResetAll`
- `onVehicleSelectorSelectRandom`
- `onVehicleSelectorSetAsDefault`
- `onVehicleSelectorSpawnNew` — écouté par 1 module(s)
- `onVehicleSelectorSpawnNewRequested`
- `trackNewVeh`
- `trackVehReset`

**Évènements UI (guihooks.trigger) :** `app:waiting`

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua`.*
