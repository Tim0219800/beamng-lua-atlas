# `gameplay_rally`

*Fichier : `lua/ge/extensions/gameplay/rally.lua` · VM : Game Engine (GE) · 538 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally` : `extensions.load("gameplay_rally")`, puis la globale `gameplay_rally`

**Dépendances (chargées avant) :** `gameplay_seatOccupants`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally.actionCodriverCallsEarlier()` |  | 307 |
| `gameplay_rally.actionCodriverCallsLater()` |  | 311 |
| `gameplay_rally.actionRecceMoveVehicleBackward()` |  | 266 |
| `gameplay_rally.actionRecceMoveVehicleForward()` |  | 261 |
| `gameplay_rally.actionToggleMouseLikeVehicle()` |  | 252 |
| `gameplay_rally.actionTranscribeRecordingCut()` |  | 257 |
| `gameplay_rally.canManageMission(owner)` |  | 79 |
| `gameplay_rally.enableRecceApp(val)` | rally API | 179 |
| `gameplay_rally.getDebugLogging()` |  | 457 |
| `gameplay_rally.getErrorMsgForUser()` |  | 432 |
| `gameplay_rally.getRace()` |  | 498 |
| `gameplay_rally.getRallyManager()` |  | 430 |
| `gameplay_rally.getRallyManagerOwner()` |  | 431 |
| `gameplay_rally.getRallyToolbox()` |  | 303 |
| `gameplay_rally.getRecoveryRepairVehicle()` |  | 433 |
| `gameplay_rally.getStageObserverState()` |  | 452 |
| `gameplay_rally.getStageRuntimeAuthorityMode()` |  | 449 |
| `gameplay_rally.getUiColor()` |  | 487 |
| `gameplay_rally.getUiColorOverride()` |  | 490 |
| `gameplay_rally.isRallyToolboxVisible()` |  | 496 |
| `gameplay_rally.isReady()` |  | 171 |
| `gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options)` |  | 130 |
| `gameplay_rally.onExtensionLoaded()` | M.onVehicleActiveChanged = onVehicleActiveChanged *(hook)* | 233 |
| `gameplay_rally.onExtensionUnloaded()` | *(hook)* | 240 |
| `gameplay_rally.onRacePathnodeReached(event)` | *(hook)* | 320 |
| `gameplay_rally.onRallyRegisterRace(raceData)` | *(hook)* | 380 |
| `gameplay_rally.onRallyVehicleRecovery(recoveryType)` | *(hook)* | 388 |
| `gameplay_rally.onSeatOccupantEnter()` | M.onVehicleSpawned = onVehicleSpawned<br> M.onVehicleSwitched = onVehicleSwitched *(hook)* | 111 |
| `gameplay_rally.onSeatOccupantExit()` | *(hook)* | 111 |
| `gameplay_rally.onSettingsChanged()` | *(hook)* | 417 |
| `gameplay_rally.onUpdate(dtReal, dtSim, dtRaw)` | extension hooks *(hook)* | 183 |
| `gameplay_rally.onVehicleResetted(vehicleID)` | M.onGuiUpdate = onGuiUpdate *(hook)* | 210 |
| `gameplay_rally.setDebugLogging(val)` |  | 458 |
| `gameplay_rally.setStageRuntimeAuthorityMode(mode)` |  | 444 |
| `gameplay_rally.setUiColor(hex)` |  | 484 |
| `gameplay_rally.toggleDebug()` |  | 291 |
| `gameplay_rally.unloadMission(options)` |  | 156 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `recceApp` | any |  |

**Évènements UI (guihooks.trigger) :** `Message`, `rally.onExtensionLoaded`, `rallyInputActionCutRecording`, `rallyInputActionRecceMoveVehicleBackward`, `rallyInputActionRecceMoveVehicleForward`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally.lua`.*
