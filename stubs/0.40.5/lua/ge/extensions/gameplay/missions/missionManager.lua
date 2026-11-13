---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_missionManager` : `extensions.load("gameplay_missions_missionManager")`, puis la globale `gameplay_missions_missionManager`
---@class gameplay_missions_missionManager
---@field dependencies table
---@field fadeDuration number
gameplay_missions_missionManager = {}

--- WIP for allowing or disallowing missions
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1425
function gameplay_missions_missionManager.allowMissionInteraction() end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1301
---@param mission any
---@param force any
---@param abandonButtonPressed any
function gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1529
function gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil() end

--- exclusivity
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1541
function gameplay_missions_missionManager.getForegroundMissionId() end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1542
function gameplay_missions_missionManager.isCurrentlyProcessingStep() end

--- when we change level, immediately stop mission, but don't clean up.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.onCareerActive() end

--- when we change level, immediately stop mission, but don't clean up.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1060
function gameplay_missions_missionManager.onParkingVehiclesActivated() end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1071
---@param state any
function gameplay_missions_missionManager.onScreenFadeState(state) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1060
function gameplay_missions_missionManager.onTrafficStarted() end

--- external callbacks
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1434
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1088
---@param mission any
---@param userSettings any
---@param startingOptions any
function gameplay_missions_missionManager.start(mission, userSettings, startingOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1153
---@param mission any
---@param userSettings any
function gameplay_missions_missionManager.startAsScenario(mission, userSettings) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1193
---@param mission any
---@param userSettings any
---@param instant any
function gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1222
---@param mission any
---@param userSettings any
---@param startingOptions any
function gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1088
---@param mission any
---@param userSettings any
---@param startingOptions any
function gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1248
---@param mission any
---@param userSettings any
---@param level any
---@param startedFrom any
function gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom) end

---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1371
---@param mission any
---@param data any
function gameplay_missions_missionManager.stop(mission, data) end

--- when we change level, immediately stop mission, but don't clean up.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.stopForegroundMissionInstantly() end

