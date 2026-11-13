---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_missionScreen` : `extensions.load("gameplay_missions_missionScreen")`, puis la globale `gameplay_missions_missionScreen`
---@class gameplay_missions_missionScreen
---@field dependencies table
---@field savedLayouts any
---@field testLayout any
---@field uiLayoutHistory table
gameplay_missions_missionScreen = {}

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:822
function gameplay_missions_missionScreen.abandonCurrentMission() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1012
---@param soundLabel any
---@param active any
---@param pitch any
function gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:894
---@param active any
function gameplay_missions_missionScreen.activateSoundBlur(active) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:824
---@param id any
---@param settings any
function gameplay_missions_missionScreen.changeUserSettings(id, settings) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1291
---@param dt any
function gameplay_missions_missionScreen.debugOnUpdate(dt) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1269
function gameplay_missions_missionScreen.discoverLayouts() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1281
---@param enable any
function gameplay_missions_missionScreen.enableDebug(enable) end

--- formats a single mission.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:111
---@param m any
function gameplay_missions_missionScreen.formatMission(m) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:599
---@param id any
---@param userSettings any
function gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:308
function gameplay_missions_missionScreen.getMissionScreenData() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1096
---@param ids any
function gameplay_missions_missionScreen.getMissionTiles(ids) end

--- gets all the missions at the current location (mission marker), and returns them in a list already formatted.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:258
function gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted() end

--- Data for pause menu (Vue MissionObjectives): merges unlocked stars with active star rules for current settings.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:713
function gameplay_missions_missionScreen.getPauseMissionObjectivesData() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:13
---@param type any
function gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1405
function gameplay_missions_missionScreen.isAnyMissionActive() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1406
function gameplay_missions_missionScreen.isMissionStartOrEndScreenActive() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:972
---@param id any
---@param routeTarget any
---@param routeParams any
function gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:991
function gameplay_missions_missionScreen.onBigMapActivated() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:927
---@param levelPath any
function gameplay_missions_missionScreen.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:923
function gameplay_missions_missionScreen.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1380
---@param mode any
---@param uiLayout any
function gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout) end

--- Testing: Todo: Remove
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1393
---@param mode any
function gameplay_missions_missionScreen.onRequestMissionScreenData(mode) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:937
---@param branch any
---@param skill any
---@param routeTarget any
---@param routeParams any
function gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1038
---@param mId any
---@param settingKey any
function gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:421
---@param id any
---@param userSettings any
function gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings) end

--- Resolves the vehicle that the mission would use by default (i.e. the option that
---  would be initially selected in the mission settings). The default-pick rules
---  are owned by gameplay_vehiclePerformance.getDefaultMissionVehicleSpec, so this
---  function only translates the spec into a class data payload.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:42
---@param m any
function gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m) end

--- Returns a PerformanceIndexSticker-shaped class requirement for a mission, or nil if
---  the mission does not have a class requirement to display. Mirrors the resolution
---  in gameplay/missionTypes/aiRace/constructor.lua:onPreStart.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:73
---@param m any
function gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m) end

--- Returns the player's current vehicle class as a PerformanceIndexSticker-shaped table
---  ({ class = { name, description, minPI }, performanceIndex }), or nil if unavailable.
---  Prefers the career-active inventory vehicle (which has real certification data),
---  and falls back to the active player vehicle in free-roam.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:22
function gameplay_missions_missionScreen.resolvePlayerVehicleClass() end

--- Resolves the panel state ("met" / "unmet" / "unknown") for the panel rendered
---  in the big map and on mission cards. Centralises the comparison rule so the
---  UI does not have to duplicate it.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:60
---@param currentClass any
---@param requiredClass any
function gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:882
---@param mId any
function gameplay_missions_missionScreen.setPreselectedMissionId(mId) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:877
---@param page any
function gameplay_missions_missionScreen.setPreselectedPage(page) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1250
---@param id any
---@param settings any
function gameplay_missions_missionScreen.startFromWithinMission(id, settings) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:790
---@param id any
---@param userSettings any
---@param startingOptions any
function gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:813
---@param id any
---@param force any
---@param abandonButtonPressed any
function gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed) end

