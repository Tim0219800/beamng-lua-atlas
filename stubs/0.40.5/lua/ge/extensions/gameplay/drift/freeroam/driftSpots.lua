---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_freeroam_driftSpots` : `extensions.load("gameplay_drift_freeroam_driftSpots")`, puis la globale `gameplay_drift_freeroam_driftSpots`
---@class gameplay_drift_freeroam_driftSpots
---@field dependencies table
gameplay_drift_freeroam_driftSpots = {}

--- "Proper" end means going through the finish line, not out of bounds or wrong way
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:244
---@param lineId any
function gameplay_drift_freeroam_driftSpots.detectStart(lineId) end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:379
function gameplay_drift_freeroam_driftSpots.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:387
function gameplay_drift_freeroam_driftSpots.getGC() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:391
function gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:383
function gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:482
function gameplay_drift_freeroam_driftSpots.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:491
function gameplay_drift_freeroam_driftSpots.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:497
---@param data any
function gameplay_drift_freeroam_driftSpots.onDeserialized(data) end

--- when whole drift chain done
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:446
function gameplay_drift_freeroam_driftSpots.onDriftCompletedScored() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:409
---@param levelIdentifier any
---@param elements any
function gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:468
function gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStarted() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:477
function gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStopped() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:504
function gameplay_drift_freeroam_driftSpots.onSerialize() end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:358
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:395
---@param id any
function gameplay_drift_freeroam_driftSpots.onVehicleResetted(id) end

