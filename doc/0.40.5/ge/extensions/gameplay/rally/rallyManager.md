# `gameplay_rally_rallyManager`

*Fichier : `lua/ge/extensions/gameplay/rally/rallyManager.lua` · VM : Game Engine (GE) · 1290 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/rallyManager")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_rallyManager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_playbackAllowed(pacenote)` |  | 647 |
| `C:_refreshNotebookForVoicepackPick()` |  | 87 |
| `C:addRecoveryRaceTime(recoveryType)` |  | 1096 |
| `C:clearQueueHold()` |  | 743 |
| `C:clearResolvedAudioObjs()` |  | 609 |
| `C:clearSplitTimes()` |  | 1259 |
| `C:closestPacenoteToVehicle()` |  | 788 |
| `C:codriver()` |  | 328 |
| `C:drawPacenotesForDriving()` |  | 702 |
| `C:enqueueHold()` |  | 756 |
| `C:enqueuePacenote(pacenote)` |  | 751 |
| `C:enqueuePauseSecs(secs)` |  | 842 |
| `C:enqueueRandomSystemPacenote(name, audioLenOffset)` |  | 802 |
| `C:getActiveStageData()` |  | 1167 |
| `C:getAudioManager()` |  | 140 |
| `C:getDrivelineRoute()` |  | 870 |
| `C:getErrorMsgForUser()` |  | 108 |
| `C:getLastPlayedPacenote()` |  | 892 |
| `C:getLastPlayedPacenoteRecoveryPose(distanceBefore)` |  | 900 |
| `C:getLiaisonAllocatedTimeSecs()` |  | 1021 |
| `C:getLoopPrefabPath()` |  | 1279 |
| `C:getMissionDir()` |  | 132 |
| `C:getMissionId()` |  | 128 |
| `C:getMissionName()` |  | 185 |
| `C:getMissionStartTrigger()` |  | 194 |
| `C:getNextPacenotes()` |  | 797 |
| `C:getNotebookPath()` |  | 136 |
| `C:getPacenoteProcessingEnabled()` |  | 112 |
| `C:getPathnodeObservationList()` |  | 422 |
| `C:getPointDistanceFromStartKm(point)` |  | 363 |
| `C:getPointDistanceFromStartMeters(point)` |  | 359 |
| `C:getRaceCompletionData()` | returns a table with the following fields:<br> distM: distance in meters<br> distPct: percentage of the race completed from 0 to 1 | 1061 |
| `C:getRaceData()` |  | 148 |
| `C:getRaceDistanceMeters()` |  | 1049 |
| `C:getRacePath()` |  | 144 |
| `C:getRecoveryDestinationPos()` |  | 998 |
| `C:getRouteDepartureRecoveryPose(options)` |  | 939 |
| `C:getSSStartLinePos()` |  | 177 |
| `C:getSSStopControlPos()` |  | 181 |
| `C:getSpeedLimitKph()` |  | 1014 |
| `C:getSplitDataIndex()` |  | 415 |
| `C:getSplitDataList()` |  | 408 |
| `C:getStageObserverState()` |  | 1077 |
| `C:getStageRuntimeAuthorityMode()` |  | 1073 |
| `C:getStageRuntimeTime()` |  | 1087 |
| `C:getStageTimingState()` |  | 1092 |
| `C:getStartAndFinishStartPositions()` |  | 1033 |
| `C:getStartPositionByName(name)` |  | 156 |
| `C:getTCInPos()` |  | 169 |
| `C:getTCOutPos()` |  | 173 |
| `C:getTimeAllocationSecs()` |  | 367 |
| `C:getTimeAllocationString()` |  | 387 |
| `C:getTrackerStageTime()` |  | 1122 |
| `C:getVoicepackPick()` |  | 79 |
| `C:getVoicepackPickWritesSettings()` |  | 83 |
| `C:hasAnyPacenotes()` |  | 1028 |
| `C:init(missionDir, missionId)` |  | 36 |
| `C:onSettingsChanged()` |  | 626 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 717 |
| `C:onVehicleResetted()` |  | 637 |
| `C:playFirstPacenote()` |  | 853 |
| `C:processPacenoteQueue()` |  | 763 |
| `C:rebuildAssets(options)` |  | 447 |
| `C:recordSplit(pathnodeId, time)` |  | 1246 |
| `C:recoverVehicleToLastPlayedPacenote(veh, options)` |  | 918 |
| `C:recoverVehicleToRouteDeparture(veh, options)` |  | 960 |
| `C:reloadVoicepackAssets(pick, opts)` | Voicepack changes rebuild all compositor-derived state, including distance calls. | 552 |
| `C:resetAudioQueue()` |  | 1009 |
| `C:resetPacenoteRuntime()` |  | 575 |
| `C:resetStageRuntime()` |  | 561 |
| `C:resolveAndLoadNotebook()` | Picks the active voicepack via an exact toolbox/mission pick or the preference/MRU resolver,<br> then finds the matching notebook in this mission. If none exists, returns an in-memory<br> empty notebook so geometry-only rally routes can still be previewed. | 432 |
| `C:resyncAfterTeleport(options)` |  | 581 |
| `C:runtimeResync(options)` |  | 615 |
| `C:sampleRaceStageTime(vehId)` |  | 1110 |
| `C:sendPacenoteToAudioManager(pacenote)` |  | 847 |
| `C:setLastPlayedPacenote(pacenote)` |  | 874 |
| `C:setPacenoteProcessingEnabled(enabled)` |  | 116 |
| `C:setPreserveRecoveryTrackerOnNextVehicleReset(val)` |  | 633 |
| `C:setRaceData(raceData)` |  | 152 |
| `C:setStageRuntimeActive(active)` |  | 1081 |
| `C:setStageRuntimeAuthorityMode(mode)` |  | 1066 |
| `C:setVoicepackPick(pick, opts)` |  | 96 |
| `C:setupDrivelineRouteHooks()` |  | 230 |
| `C:triggerClearAllVisualPacenotes()` |  | 695 |
| `C:triggerClearVisualPacenote(pacenote)` |  | 687 |
| `C:triggerPacenote(pacenote)` |  | 203 |
| `C:triggerShowVisualPacenote(pacenote)` |  | 661 |
| `C:updateTrackerSplitObservations()` |  | 1133 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyRouteRecoveryComplete` — écouté par 1 module(s)
- `onVehicleTeleportedToLastRoad`

**Évènements UI (guihooks.trigger) :** `clearAllVisualPacenotes`, `clearOneVisualPacenote`, `showVisualPacenote2`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/rallyManager.lua`.*
