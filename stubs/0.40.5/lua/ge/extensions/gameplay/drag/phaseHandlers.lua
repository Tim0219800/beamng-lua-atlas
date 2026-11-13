---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/phaseHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_phaseHandlers` : `extensions.load("gameplay_drag_phaseHandlers")`, puis la globale `gameplay_drag_phaseHandlers`
---@class gameplay_drag_phaseHandlers
---@field dependencies table
---@field redLightReason string
gameplay_drag_phaseHandlers = {}

--- Checks if all racers are properly staged (ready for countdown).
---   A racer is considered staged if:
---   - They are in phase 1 (stage phase)
---   - Their phase 1 is completed (they've reached the staging beam)
---
---   @param dragData - The drag race data (optional, will fetch if not provided)
---   @return true if all racers are staged, false otherwise
---   @return number of staged racers
---   @return total number of racers
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:433
---@param dragData any
function gameplay_drag_phaseHandlers.areAllRacersStaged(dragData) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:58
---@param racer any
function gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:381
function gameplay_drag_phaseHandlers.changeAllPhases() end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:313
---@param racer any
---@param expectedCurrentPhase any
function gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase) end

--- Per-vehicle re-stage timer/notification, so multiseat racers who false-start independently don't
--- interfere with each other. Returns "leftArea" only when the lone racer (singleplayer/legacy freeroam)
--- reverses far enough to abandon the strip entirely; with several racers, that one is simply re-staged
--- instead of tearing down the whole activity for everyone else.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:637
---@param dtSim any
function gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:629
function gameplay_drag_phaseHandlers.clearDqRestageState() end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:299
---@param vehId any
function gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:625
function gameplay_drag_phaseHandlers.clearRemoteStagingHoldTimers() end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:715
---@param phase any
---@param racer any
---@param dtSim any
function gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:236
---@param racer any
---@param reason any
function gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1052
---@param phase any
---@param racer any
---@param dtSim any
function gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:280
function gameplay_drag_phaseHandlers.generateWinData() end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:50
---@param racer any
function gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:174
---@param racer any
---@param data any
function gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:93
---@param racer any
function gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1227
function gameplay_drag_phaseHandlers.onDragClear() end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:43
function gameplay_drag_phaseHandlers.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:838
---@param phase any
---@param racer any
---@param dtSim any
function gameplay_drag_phaseHandlers.race(phase, racer, dtSim) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1178
---@param data any
function gameplay_drag_phaseHandlers.setDialsData(data) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:309
---@param vehId any
function gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:592
---@param data any
---@param lane any
---@param staged any
function gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:471
---@param phase any
---@param racer any
---@param dtSim any
function gameplay_drag_phaseHandlers.stage(phase, racer, dtSim) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:393
---@param vehId any
function gameplay_drag_phaseHandlers.startRaceFromTree(vehId) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:992
---@param phase any
---@param racer any
---@param dtSim any
function gameplay_drag_phaseHandlers.stop(phase, racer, dtSim) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1099
---@param racer any
function gameplay_drag_phaseHandlers.updateRacer(racer) end

---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:608
function gameplay_drag_phaseHandlers.updateRemoteStagingHoldTimers() end

