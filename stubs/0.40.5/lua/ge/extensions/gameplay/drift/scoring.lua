---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/scoring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_scoring` : `extensions.load("gameplay_drift_scoring")`, puis la globale `gameplay_drift_scoring`
---@class gameplay_drift_scoring
gameplay_drift_scoring = {}

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:280
---@param valueToAdd any
---@param useStallingSystem any
---@param vehId any
function gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:740
---@param vehId any
function gameplay_drift_scoring.getCurrentDriftTier(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:724
function gameplay_drift_scoring.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:709
---@param vehId any
function gameplay_drift_scoring.getDriftPerformanceFactor(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:728
function gameplay_drift_scoring.getDriftTiers() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:732
function gameplay_drift_scoring.getGC() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:704
---@param vehId any
function gameplay_drift_scoring.getPotentialScore(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:693
---@param vehId any
function gameplay_drift_scoring.getScore(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:719
---@param vehId any
function gameplay_drift_scoring.getScoreAddedThisFrame(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:736
function gameplay_drift_scoring.getScoreOptions() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:714
---@param vehId any
function gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:745
---@param stuntZoneType any
function gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:753
---@param vehId any
function gameplay_drift_scoring.isVehicleFrozen(vehId) end

--- Drift stunts --
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:568
---@param vehId any
function gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:239
function gameplay_drift_scoring.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:778
---@param data any
function gameplay_drift_scoring.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:596
---@param data any
function gameplay_drift_scoring.onDonutDriftAccomplished(data) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:761
---@param vehId any
function gameplay_drift_scoring.onDriftChainStarted(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:631
---@param data any
function gameplay_drift_scoring.onDriftCompleted(data) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:685
---@param vehId any
function gameplay_drift_scoring.onDriftCrash(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:765
function gameplay_drift_scoring.onDriftFreeroamCruisingStarted() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:757
---@param vehId any
function gameplay_drift_scoring.onDriftPlVehReset(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:689
---@param vehId any
function gameplay_drift_scoring.onDriftSpinout(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:575
---@param data any
function gameplay_drift_scoring.onDriftThroughAccomplished(data) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:667
---@param vehId any
function gameplay_drift_scoring.onDriftTransition(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:582
---@param data any
function gameplay_drift_scoring.onHitPoleAccomplished(data) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:589
---@param data any
function gameplay_drift_scoring.onNearPoleAccomplished(data) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:771
function gameplay_drift_scoring.onSerialize() end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:533
---@param dtReal any
---@param _dtSim any
function gameplay_drift_scoring.onUpdate(dtReal, _dtSim) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:234
---@param vehId any
function gameplay_drift_scoring.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:222
---@param vehId any
function gameplay_drift_scoring.reset(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:749
---@param vehId any
---@param isFrozen any
function gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:602
---@param vehId any
function gameplay_drift_scoring.wrapUp(vehId) end

---Source : lua/ge/extensions/gameplay/drift/scoring.lua:614
---@param vehId any
function gameplay_drift_scoring.wrapUpWithText(vehId) end

