---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/scenarioManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crashTest_scenarioManager` : `extensions.load("gameplay_crashTest_scenarioManager")`, puis la globale `gameplay_crashTest_scenarioManager`
---@class gameplay_crashTest_scenarioManager
---@field dependencies table
gameplay_crashTest_scenarioManager = {}

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:753
function gameplay_crashTest_scenarioManager.activatesAllVehForReset() end

--- INTERNAL
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:572
function gameplay_crashTest_scenarioManager.clearMarkers() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:769
function gameplay_crashTest_scenarioManager.getCrashTestData() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:757
function gameplay_crashTest_scenarioManager.goToNextStepFromUI() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:737
---@param status any
---@param mission any
function gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:765
function gameplay_crashTest_scenarioManager.onCrashCamEnded() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:743
---@param extension any
function gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:749
function gameplay_crashTest_scenarioManager.onPlayerOutOfBounds() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:566
---@param dt any
---@param dtSim any
function gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:621
---@param dtReal any
---@param dtSim any
function gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:728
---@param crashEndData any
function gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData) end

--- basically check if player crashed into the actual target, if not then mission failed
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:701
---@param crashStartData any
function gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:203
---@param crashTestData any
---@param deactivateVehiclesFromOtherSteps_ any
function gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:318
function gameplay_crashTest_scenarioManager.reset() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:792
---@param _debug any
function gameplay_crashTest_scenarioManager.setDebug(_debug) end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:466
function gameplay_crashTest_scenarioManager.startScenario() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:761
function gameplay_crashTest_scenarioManager.startStepFromUI() end

---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:342
function gameplay_crashTest_scenarioManager.trackVehiclesForCrash() end

