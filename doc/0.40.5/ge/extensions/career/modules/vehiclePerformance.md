# `career_modules_vehiclePerformance`

*Fichier : `lua/ge/extensions/career/modules/vehiclePerformance.lua` · VM : Game Engine (GE) · 654 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehiclePerformance` : `extensions.load("career_modules_vehiclePerformance")`, puis la globale `career_modules_vehiclePerformance`

**Dépendances (chargées avant) :** `ui_vehicleSelector_vehicleSpecifications`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData)` |  | 537 |
| `career_modules_vehiclePerformance.cancelTest(delay, userAborted)` |  | 546 |
| `career_modules_vehiclePerformance.getActiveVehicleUiData()` |  | 616 |
| `career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId)` |  | 509 |
| `career_modules_vehiclePerformance.getVehicleClass(inventoryId)` |  | 516 |
| `career_modules_vehiclePerformance.invalidateCertification(inventoryId)` |  | 56 |
| `career_modules_vehiclePerformance.isTestInProgress()` |  | 637 |
| `career_modules_vehiclePerformance.onBeamNGTrigger(data)` | *(hook)* | 555 |
| `career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 588 |
| `career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial)` | *(hook)* | 580 |
| `career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data)` | Router lifecycle: attach the active vehicle data into routeData so the UI<br> reads it from the routeData store instead of fetching it on mount. *(hook)* | 623 |
| `career_modules_vehiclePerformance.onUpdate(dtReal)` | *(hook)* | 75 |
| `career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta)` | *(hook)* | 627 |
| `career_modules_vehiclePerformance.openMenu(options)` |  | 611 |
| `career_modules_vehiclePerformance.startDragTest()` |  | 116 |
| `career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData)` |  | 523 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBHalfAxisXYZ`
- `scenetree.` `findObject`

**Charge les extensions :** `gameplay_drag_dragTypes_headsUpRace`, `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehiclePerformance.lua`.*
