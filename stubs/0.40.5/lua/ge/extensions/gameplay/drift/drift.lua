---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/drift.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_drift` : `extensions.load("gameplay_drift_drift")`, puis la globale `gameplay_drift_drift`
---@class gameplay_drift_drift
---@field dependencies table
gameplay_drift_drift = {}

---Source : lua/ge/extensions/gameplay/drift/drift.lua:873
---@param vehId any
---@param opts any
function gameplay_drift_drift.addTrackedVehicle(vehId, opts) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1000
---@param vehId any
function gameplay_drift_drift.doesPlHaveVeh(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:920
---@param vehId any
function gameplay_drift_drift.getAirSpeed(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:962
---@param vehId any
function gameplay_drift_drift.getAngleDiff(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:950
---@param vehId any
function gameplay_drift_drift.getCurrDegAngleSigned(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:956
---@param vehId any
function gameplay_drift_drift.getCurrDriftCompletedTime(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:972
---@param vehId any
function gameplay_drift_drift.getCurrentDriftDuration(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:967
---@param vehId any
function gameplay_drift_drift.getDistSinceLastFrame(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:900
---@param vehId any
function gameplay_drift_drift.getDriftActiveData(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:905
---@param vehId any
function gameplay_drift_drift.getDriftChainActiveData(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:910
---@param vehId any
function gameplay_drift_drift.getDriftChainChainedDrifts(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1017
function gameplay_drift_drift.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1005
function gameplay_drift_drift.getDriftOptions() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1013
function gameplay_drift_drift.getGC() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:995
---@param vehId any
function gameplay_drift_drift.getIsCrashing(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:915
---@param vehId any
function gameplay_drift_drift.getIsDrifting(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:990
---@param vehId any
function gameplay_drift_drift.getIsInTheAir(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:985
---@param vehId any
function gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:980
---@param vehId any
function gameplay_drift_drift.getIsOverSteering(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:935
function gameplay_drift_drift.getPlVeh() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:859
---@param vehId any
function gameplay_drift_drift.getPlayerIdForVehicle(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:896
function gameplay_drift_drift.getTrackedVehicles() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1009
function gameplay_drift_drift.getVehCorners() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:940
---@param vehId any
function gameplay_drift_drift.getVehData(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:930
function gameplay_drift_drift.getVehId() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:925
---@param vehId any
function gameplay_drift_drift.getVehPos(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:945
---@param vehId any
function gameplay_drift_drift.getVehVel(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1080
function gameplay_drift_drift.onAnyStuntZoneAccomplished() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1076
function gameplay_drift_drift.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1151
---@param data any
function gameplay_drift_drift.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1103
function gameplay_drift_drift.onDriftChallengeFinished() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1087
---@param context any
---@param oldContext any
function gameplay_drift_drift.onDriftContextChanged(context, oldContext) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1130
---@param vehId any
function gameplay_drift_drift.onDriftPlVehReset(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1145
function gameplay_drift_drift.onSerialize() end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:807
---@param dtReal any
---@param _dtSim any
---@param dtRaw any
function gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1117
---@param crashStartData any
function gameplay_drift_drift.onVehicleCrashStarted(crashStartData) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1072
---@param vehId any
function gameplay_drift_drift.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1056
---@param oldId any
---@param newVehId any
---@param player any
function gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:864
---@param vehId any
function gameplay_drift_drift.removeTrackedVehicle(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1045
---@param vehId any
function gameplay_drift_drift.reset(vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1021
---@param value any
function gameplay_drift_drift.setAllowDonut(value) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1025
---@param value any
function gameplay_drift_drift.setAllowTightDrift(value) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1038
---@param _balanceMode any
---@param vehId any
function gameplay_drift_drift.setBalanceMode(_balanceMode, vehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:1029
---@param newVehId any
function gameplay_drift_drift.setVehId(newVehId) end

---Source : lua/ge/extensions/gameplay/drift/drift.lua:855
---@param data any
function gameplay_drift_drift.simulateADrift(data) end

