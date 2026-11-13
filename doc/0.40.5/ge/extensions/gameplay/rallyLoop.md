# `gameplay_rallyLoop`

*Fichier : `lua/ge/extensions/gameplay/rallyLoop.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rallyLoop` : `extensions.load("gameplay_rallyLoop")`, puis la globale `gameplay_rallyLoop`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rallyLoop.addTestPenalty(amount)` |  | 324 |
| `gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels)` |  | 205 |
| `gameplay_rallyLoop.getDebugLogging()` |  | 278 |
| `gameplay_rallyLoop.getDrawFlag(flagName)` |  | 374 |
| `gameplay_rallyLoop.getLoopToolbox()` |  | 201 |
| `gameplay_rallyLoop.getManager()` |  | 368 |
| `gameplay_rallyLoop.getMissionExecutionTransferFlag()` |  | 296 |
| `gameplay_rallyLoop.getNextMissionId()` |  | 303 |
| `gameplay_rallyLoop.getRuntimeMode()` |  | 83 |
| `gameplay_rallyLoop.getSSRescheduleCount()` |  | 387 |
| `gameplay_rallyLoop.handleGOTO(gotoRallyLoop)` |  | 331 |
| `gameplay_rallyLoop.isLoopToolboxVisible()` |  | 283 |
| `gameplay_rallyLoop.isReady()` | gameplay_rallyLoop API | 75 |
| `gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned)` | *(hook)* | 351 |
| `gameplay_rallyLoop.onCreatedRallyGroundMarkerRoute()` | *(hook)* | 239 |
| `gameplay_rallyLoop.onExtensionLoaded()` | M.onVehicleResetted = onVehicleResetted<br> M.onVehicleSpawned = onVehicleSpawned<br> M.onVehicleSwitched = onVehicleSwitched<br> M.onVehicleActiveChanged = onVehicleActiveChanged *(hook)* | 161 |
| `gameplay_rallyLoop.onExtensionUnloaded()` | *(hook)* | 169 |
| `gameplay_rallyLoop.onGameplayInteract()` | *(hook)* | 219 |
| `gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 136 |
| `gameplay_rallyLoop.onRallyDataUpdated(data)` | *(hook)* | 211 |
| `gameplay_rallyLoop.onRallyRouteRecoveryComplete(data)` | *(hook)* | 251 |
| `gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType)` | *(hook)* | 245 |
| `gameplay_rallyLoop.onRecalculatedRoute()` | *(hook)* | 233 |
| `gameplay_rallyLoop.onSettingsChanged()` | *(hook)* | 185 |
| `gameplay_rallyLoop.onUIStartButtonClicked()` | *(hook)* | 227 |
| `gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw)` | extension hooks API *(hook)* | 101 |
| `gameplay_rallyLoop.setDebugLogging(val)` |  | 279 |
| `gameplay_rallyLoop.setDrawFlag(flagName, value)` |  | 381 |
| `gameplay_rallyLoop.setMissionExecutionTransferFlag(val)` |  | 291 |
| `gameplay_rallyLoop.setup(missionId, missionDir)` |  | 64 |
| `gameplay_rallyLoop.setupForNewMission()` |  | 285 |
| `gameplay_rallyLoop.skipLiaisonForTesting(options)` |  | 317 |
| `gameplay_rallyLoop.startNextMission()` |  | 310 |
| `gameplay_rallyLoop.toggleDebug()` |  | 193 |
| `gameplay_rallyLoop.unload()` |  | 69 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rallyLoop.lua`.*
