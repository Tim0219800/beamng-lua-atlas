---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/lightRunnerSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Grid selector backend for the LightRunner Vue wizard. It reuses the same levels/tracks as the quick race (scenario_quickRaceLoader): only the vehicle selection is restricted (powerglow-compatible car/truck), elsewhere in the vehicle selector's filters. The module simply copies into M all the functions of the backend created by `oneshotRaceSelector/core` with the descriptor `quickRaceTrackDescriptor.build("lightRunnerSelector")`.
--- Access: extension `ui_lightRunnerSelector_general`: `extensions.load("ui_lightRunnerSelector_general")`, then the global `ui_lightRunnerSelector_general`
---@class ui_lightRunnerSelector_general
---@field dependencies table<integer, string> {"scenario_quickRaceLoader"}.
ui_lightRunnerSelector_general = {}

