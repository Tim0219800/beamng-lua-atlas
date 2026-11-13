# `career_modules_inspectVehicle`

*Fichier : `lua/ge/extensions/career/modules/inspectVehicle.lua` · VM : Game Engine (GE) · 539 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_inspectVehicle` : `extensions.load("career_modules_inspectVehicle")`, puis la globale `career_modules_inspectVehicle`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions)` |  | 293 |
| `career_modules_inspectVehicle.getDidTestDrive()` |  | 471 |
| `career_modules_inspectVehicle.getInspectVehiclePoi()` |  | 403 |
| `career_modules_inspectVehicle.getSpawnedVehicleInfo()` |  | 388 |
| `career_modules_inspectVehicle.isTestDriveDamageDetected()` |  | 368 |
| `career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage)` | internal only | 157 |
| `career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData)` | *(hook)* | 443 |
| `career_modules_inspectVehicle.onAnyMissionChanged(status, id)` | *(hook)* | 372 |
| `career_modules_inspectVehicle.onDeliveryModeStarted()` | *(hook)* | 379 |
| `career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 436 |
| `career_modules_inspectVehicle.onPurchaseMenuClosed()` | *(hook)* | 475 |
| `career_modules_inspectVehicle.onTestDriveAbandoned()` | *(hook)* | 482 |
| `career_modules_inspectVehicle.onTestDriveDamageDetected()` | *(hook)* | 364 |
| `career_modules_inspectVehicle.onTestDriveEndedAfterFade()` | *(hook)* | 486 |
| `career_modules_inspectVehicle.onTestDriveStarted()` | *(hook)* | 356 |
| `career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 333 |
| `career_modules_inspectVehicle.onVehicleDestroyed(vehId)` | *(hook)* | 349 |
| `career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 502 |
| `career_modules_inspectVehicle.repairVehicle()` | this function is only used during tutorial | 393 |
| `career_modules_inspectVehicle.showVehicle(vehicleInfo)` |  | 98 |
| `career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job)` |  | 222 |
| `career_modules_inspectVehicle.startTestDrive()` |  | 383 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/inspectVehicle.lua`.*
