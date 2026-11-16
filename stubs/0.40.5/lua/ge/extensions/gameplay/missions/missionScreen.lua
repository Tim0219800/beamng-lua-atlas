---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the mission system and the UI (Vue): prepares the mission screen data (missions at the current marker, ongoing mission, list tiles, active stars according to settings, starting options, entry fee, repair, required vehicle class), starts or stops a mission from the UI, handles navigation to a mission on the big map and the end screen sounds. Almost all its functions are called by the interface via Lua commands (e.g. gameplay_missions_missionScreen.startMissionById); results are sent back via guihooks.trigger.
--- Access: extension `gameplay_missions_missionScreen`: `extensions.load("gameplay_missions_missionScreen")`, then the global `gameplay_missions_missionScreen`
---@class gameplay_missions_missionScreen
---@field dependencies string[] Extensions loaded beforehand: gameplay_missions_missions, gameplay_markerInteraction, gameplay_playmodeMarkers.
---@field savedLayouts table[]|nil Test layouts read from /gameplay/testing/*.json by discoverLayouts; nil before the first call.
---@field testLayout table|nil Test layout returned by onRequestMissionScreenData when the mode contains "test"; nil by default.
---@field uiLayoutHistory table[] The last 20 mission screen layouts received by onMissionScreenReady (with recordedAt and recordedAtFormatted).
gameplay_missions_missionScreen = {}

--- Abandons the current mission as if the player had pressed the abandon button.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:822
function gameplay_missions_missionScreen.abandonCurrentMission() end

--- Plays (with the given pitch) or stops the counting sounds of the end screen (money, xp, vouchers).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1012
---@param soundLabel string money, xp or vouchers.
---@param active boolean true to play; false stops all counting sounds.
---@param pitch number|nil "pitch" parameter (1 by default).
function gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch) end

--- Enables or disables the audio blur (core_sounds.setAudioBlur) during the mission screen.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:894
---@param active boolean true to enable.
function gameplay_missions_missionScreen.activateSoundBlur(active) end

--- Called when the player changes a setting: determines the corresponding progress key (mission:getProgressKeyForUserSetting) and sends to the UI, via the guihook "missionProgressKeyChanged", {progressKey, translation, progress} with the reformatted aggregates. Uses the parent mission if missionIdForAttempt is set. Despite its name, it does not modify any setting.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:824
---@param id string Mission id.
---@param settings table[] List {key, value}.
function gameplay_missions_missionScreen.changeUserSettings(id, settings) end

--- Imgui debug window, used as onUpdate when enableDebug(true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1291
---@param dt number Elapsed time (s).
function gameplay_missions_missionScreen.debugOnUpdate(dt) end

--- Debug tool: reads the JSON layouts of /gameplay/testing into M.savedLayouts.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1269
function gameplay_missions_missionScreen.discoverLayouts() end

--- Debug tool: enables/disables the imgui window of the layout history (affects M.onUpdate).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1281
---@param enable boolean true to enable.
function gameplay_missions_missionScreen.enableDebug(enable) end

--- Puts a mission in the format expected by the UI (id, translated name, icon, description, preview, type label, stars, settings, required class, career leagues, etc.).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:111
---@param m table Built mission.
---@return table  Data formatted for the interface.
function gameplay_missions_missionScreen.formatMission(m) end

--- Determines which stars are active, visible and enabled for given settings (after recomputing dynamic rewards, ignoring the keys of ignoreUserSettingsKeyForActiveStars). Stores the settings in m._lastUserSettingsOutsideOfMission.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:599
---@param id string Mission id.
---@param userSettings table List {key, value} or flat key -> value table.
---@return table  Table containing notably starInfo per star key; empty table if the mission does not exist.
function gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings) end

--- Mission screen data: if a mission is in progress, returns the "ongoingMission" context (ongoing mission, recovery options, buttons hidden during the tutorial or looping rally); otherwise the "availableMissions" context (marker missions or custom list, tiles, preselected mission/page, ongoing delivery warning) or "empty".
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:308
---@return table  Table with the context field and the associated data.
function gameplay_missions_missionScreen.getMissionScreenData() end

--- Builds the tiles of the current level's mission list (filters, groups by difficulty and "all", sorting). Without ids, keeps only the missions visible in freeroam; with ids, only those.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1096
---@param ids table<string, boolean>|nil Set of ids to include.
---@return table  Table including tilesById, and the sorted groups (details in the code).
function gameplay_missions_missionScreen.getMissionTiles(ids) end

--- List of the missions of the marker where the player is, already formatted and sorted by unlock depth; nil if the game state has no playmode markers.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:258
---@return table[]|nil  Formatted missions.
function gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted() end

--- Pause menu data (Vue component MissionObjectives): merges the unlocked stars with the active star rules for the settings of the current mission.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:713
---@return table  {stars, message, showMessage}; stars is empty if there is no mission or no stars.
function gameplay_missions_missionScreen.getPauseMissionObjectivesData() end

--- Cost of the repair offered at the start of a career mission: "moneyRepair" -> {money=1000}, "voucherRepair" -> {vouchers=1}, otherwise nil.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:13
---@param type string moneyRepair or voucherRepair.
---@return table<string, number>|nil  Cost per attribute.
function gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type) end

--- Returns whether a foreground mission is in progress.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1405
---@return boolean  true if a mission is active.
function gameplay_missions_missionScreen.isAnyMissionActive() end

--- Broadcasts the hook onGetIsMissionStartOrEndScreenActive; a module that displays the mission start/end screen answers it by adding a value.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1406
---@return any  First value added by a listener, or false.
function gameplay_missions_missionScreen.isMissionStartOrEndScreenActive() end

--- Opens the big map centered on a mission (freeroam_bigMapMode.enterBigMap, instant); POI selection and navigation are then done by onBigMapActivated.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:972
---@param id string Mission id.
---@param routeTarget string|nil Target UI route.
---@param routeParams table|nil Route parameters (autoSelectPoiId = id by default).
function gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams) end

--- Hook called when the big map opens: if a navigation to a mission is pending (and older than 3 s), selects the POI and starts the navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:991
function gameplay_missions_missionScreen.onBigMapActivated() end

--- Hook at level end; does nothing (commented-out code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:927
---@param levelPath string Level path.
function gameplay_missions_missionScreen.onClientEndMission(levelPath) end

--- Hook on extension unload; does nothing (commented-out code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:923
function gameplay_missions_missionScreen.onExtensionUnloaded() end

--- Hook sent when the mission screen is displayed: stores the received UI layout (last 20).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1380
---@param mode string Screen mode.
---@param uiLayout table Layout sent by the UI (receives recordedAt).
function gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout) end

--- Test ("Todo: Remove"): if the mode contains "test", returns to the UI a copy of M.testLayout via the guihook "onRequestMissionScreenDataReady".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1393
---@param mode string Requested mode.
function gameplay_missions_missionScreen.onRequestMissionScreenData(mode) end

--- Opens the career challenges screen (starting "league" missions of the current level, filtered by branch and skill) via ui_router.navigate ("mission.details" by default).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:937
---@param branch string|nil Branch; "undefined" = nil.
---@param skill string|nil Skill; "undefined" or "all" = nil.
---@param routeTarget string|nil Target UI route.
---@param routeParams table|nil Route parameters (pathId = branch by default).
function gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams) end

--- Opens the vehicle selector for a mission's "custom vehicle" setting, then returns to the mission's "settings" page with the chosen model and config.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1038
---@param mId string Mission id.
---@param settingKey string Key of the vehicle selection setting.
function gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey) end

--- Computes the starting options for the given settings and sends them to the UI via the guihook "missionStartingOptionsForUserSettingsReady" ({missionId, options, entryFee}). Checks: mission startable, personal vehicle chosen, starting on foot impossible, entry fee payable, vehicle class, and offers the paid repair in career if the vehicle is damaged.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:421
---@param id string Mission id.
---@param userSettings table[] List of settings {key, value}.
function gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings) end

--- Class of the vehicle the mission would use by default (preselected option in its settings). The selection rules are in gameplay_vehiclePerformance.getDefaultMissionVehicleSpec; for an imposed vehicle (preset) the class comes from getClassFromConfig, otherwise it falls back to the player's.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:42
---@param m table Built mission.
---@return table|nil  Class data.
function gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m) end

--- Returns the vehicle class required by the mission (missionTypeData.vehicleGroupByClassActive and vehicleGroupByClass), built with gameplay_vehiclePerformance.buildClassRequirement; "auto" takes the player's class (B by default), "userSetting" gives nil (choice in the settings).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:73
---@param m table Built mission.
---@return table|nil  Class requirement, or nil if there is none.
function gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m) end

--- Performance class of the player's vehicle as {class={name, description, minPI}, performanceIndex}: active inventory vehicle in career, otherwise the current player vehicle via gameplay_vehiclePerformance.getClassFromVehId.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:22
---@return table|nil  Class data, or nil if unavailable.
function gameplay_missions_missionScreen.resolvePlayerVehicleClass() end

--- Compares the current class and the required class by name: "met" if identical, "unmet" if different, "unknown" if one is missing.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:60
---@param currentClass table|nil Current class {class={name}}.
---@param requiredClass table|nil Required class.
---@return string  met, unmet or unknown.
function gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass) end

--- Sets the mission preselected when the mission screen opens.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:882
---@param mId string|nil Mission id.
function gameplay_missions_missionScreen.setPreselectedMissionId(mId) end

--- Sets the mission screen page to open (used only once by getMissionScreenData).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:877
---@param page string|nil Page name, e.g. "settings".
function gameplay_missions_missionScreen.setPreselectedPage(page) end

--- Restarts/reconfigures a mission from within a running mission (flattens the settings then calls missionManager.startFromWithinMission).
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:1250
---@param id string Id of the mission to start.
---@param settings table[]|nil List {key, value}.
function gameplay_missions_missionScreen.startFromWithinMission(id, settings) end

--- Starts a mission with a fade (gameplay_missions_missionManager.startWithFade) after flattening the settings. Logs an error if the id is invalid or if the mission is not startable.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:790
---@param id string Mission id.
---@param userSettings table[]|nil List {key, value}.
---@param startingOptions table|nil Options (startedFrom, skipUnlockCheck, skipPartConditionSnapshot...).
function gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions) end

--- Requests the abandonment (with fade) of the mission with the given id, or of the foreground mission if id is nil.
---Source: lua/ge/extensions/gameplay/missions/missionScreen.lua:813
---@param id string|nil Mission id.
---@param force boolean|nil Passed to attemptAbandonMissionWithFade (unused there).
---@param abandonButtonPressed boolean|nil true if the player is the one abandoning.
function gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed) end

