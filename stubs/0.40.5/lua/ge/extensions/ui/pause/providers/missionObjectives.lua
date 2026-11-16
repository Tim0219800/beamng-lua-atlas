---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/missionObjectives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for the current mission's objectives. It simply returns the result of gameplay_missions_missionScreen.getPauseMissionObjectivesData().
--- Access: extension `ui_pause_providers_missionObjectives`: `extensions.load("ui_pause_providers_missionObjectives")`, then the global `ui_pause_providers_missionObjectives`
---@class ui_pause_providers_missionObjectives
---@field dependencies string[] {"gameplay_missions_missionScreen"}
ui_pause_providers_missionObjectives = {}

--- Returns the mission objectives data for the pause menu (provided by gameplay_missions_missionScreen). The context is ignored.
---Source: lua/ge/extensions/ui/pause/providers/missionObjectives.lua:11
---@param context table Pause menu context (unused).
---@return any  Data returned by getPauseMissionObjectivesData.
function ui_pause_providers_missionObjectives.getData(context) end

