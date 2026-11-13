# `gameplay_rally_recceApp`

*Fichier : `lua/ge/extensions/gameplay/rally/recceApp.lua` · VM : Game Engine (GE) · 775 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_recceApp` : `extensions.load("gameplay_rally_recceApp")`, puis la globale `gameplay_rally_recceApp`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_recceApp.closeWindow()` |  | 522 |
| `gameplay_rally_recceApp.isEnabled()` |  | 80 |
| `gameplay_rally_recceApp.isRecording()` |  | 764 |
| `gameplay_rally_recceApp.isWindowVisible()` |  | 770 |
| `gameplay_rally_recceApp.loadMission(missionId, missionDir)` |  | 113 |
| `gameplay_rally_recceApp.moveVehicleBackward()` |  | 301 |
| `gameplay_rally_recceApp.moveVehicleForward()` |  | 297 |
| `gameplay_rally_recceApp.moveVehicleToMission()` |  | 305 |
| `gameplay_rally_recceApp.moveVehicleToStart()` |  | 212 |
| `gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 329 |
| `gameplay_rally_recceApp.openWindow()` |  | 516 |
| `gameplay_rally_recceApp.recordDrivelineClearAll()` |  | 397 |
| `gameplay_rally_recceApp.recordDrivelineCut()` |  | 354 |
| `gameplay_rally_recceApp.recordDrivelineStart(recordVoice)` |  | 372 |
| `gameplay_rally_recceApp.recordDrivelineStop()` |  | 382 |
| `gameplay_rally_recceApp.release()` |  | 178 |
| `gameplay_rally_recceApp.reload(rallyExt)` |  | 492 |
| `gameplay_rally_recceApp.setEnabled(val)` |  | 76 |
| `gameplay_rally_recceApp.setLastLoadState(state)` |  | 107 |
| `gameplay_rally_recceApp.setLastMissionId(mid)` |  | 101 |
| `gameplay_rally_recceApp.setShowNotes(val)` |  | 342 |
| `gameplay_rally_recceApp.toggleDebug()` |  | 416 |
| `gameplay_rally_recceApp.toggleMouseLikeVehicle()` |  | 633 |
| `gameplay_rally_recceApp.toggleWindow()` |  | 526 |
| `gameplay_rally_recceApp.unloadMission()` |  | 167 |

**Évènements UI (guihooks.trigger) :** `rally.recceApp.missionLoaded`, `rally.recceApp.refreshed`, `rallyInputActionDesktopCallNotOk`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recceApp.lua`.*
