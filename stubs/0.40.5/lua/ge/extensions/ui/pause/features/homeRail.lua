---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/features/homeRail.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds the right-hand button rail of the pause menu home. Depending on the context (freeroam, career, mission, multiplayer, garage, freeroamTutorial mode, scenario, first drive, multiseat) it assembles button groups: recovery (resume, repair, career/mission recovery), firstDriveLearning, tutorialLesson, career, auxiliary (vehicle selector, map, photo mode, replay), mainMenu (change level, quit activity, quit level) and multiseat. Used by ui_pause_providers_routeData_home.
--- Access: extension `ui_pause_features_homeRail`: `extensions.load("ui_pause_features_homeRail")`, then the global `ui_pause_features_homeRail`
---@class ui_pause_features_homeRail
ui_pause_features_homeRail = {}

--- Builds the list of rail groups for the pause context. Each group comes from Common.asRailGroup(name, actions) and empty groups are omitted. Logs the number of groups and multiseat actions.
---Source: lua/ge/extensions/ui/pause/features/homeRail.lua:681
---@param context table Pause context: mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isScenarioActive, isMissionActive, isBigMapAllowed...
---@param registerButton function Function (definition, callback) that registers a button and returns its description.
---@return table[]  Rail button groups.
function ui_pause_features_homeRail.build(context, registerButton) end

