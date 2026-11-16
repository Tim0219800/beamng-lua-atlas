---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/quickraceSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend of the grid selector of the "Quickrace" Vue wizard: exposes the list of levels and, for each level, its list of tracks. The module contains no logic of its own: it creates a backend with ui/oneshotRaceSelector/core from the shared descriptor quickRaceTrackDescriptor (identifier "quickraceSelector") then copies all its functions into M.
--- Access: extension `ui_quickraceSelector_general`: `extensions.load("ui_quickraceSelector_general")`, then the global `ui_quickraceSelector_general`
---@class ui_quickraceSelector_general
---@field dependencies table<integer, string> Extensions to load beforehand: {"scenario_quickRaceLoader"}.
ui_quickraceSelector_general = {}

