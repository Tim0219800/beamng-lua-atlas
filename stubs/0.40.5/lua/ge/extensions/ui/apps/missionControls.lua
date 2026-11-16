---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/missionControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the list of control hints shown by the missionControls interface app during a mission. Each hint is identified by a category, which makes it possible to add or remove one without touching the others (for example from a flowgraph node). The list sorted by order is sent to the interface via the SetMissionControls event.
--- Access: extension `ui_apps_missionControls`: `extensions.load("ui_apps_missionControls")`, then the global `ui_apps_missionControls`
---@class ui_apps_missionControls
ui_apps_missionControls = {}

--- Removes all hints and sends SetMissionControlsResetAll to the interface.
---Source: lua/ge/extensions/ui/apps/missionControls.lua:54
function ui_apps_missionControls.clearControls() end

--- Initialization hook: sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/missionControls.lua:6
function ui_apps_missionControls.onInit() end

--- Sends the current list back to the interface (useful when the app mounts).
---Source: lua/ge/extensions/ui/apps/missionControls.lua:59
function ui_apps_missionControls.sendAllData() end

--- Adds, updates or removes (clear=true) a hint, then sends the whole list back to the interface.
---Source: lua/ge/extensions/ui/apps/missionControls.lua:22
---@param args table {category|action|uiEvent, action=string|nil, uiEvent=string|nil, label=string|nil, order=number|nil (0 by default), clear=boolean|nil}.
function ui_apps_missionControls.setControl(args) end

--- Replaces all hints with the supplied list, then sends it to the interface.
---Source: lua/ge/extensions/ui/apps/missionControls.lua:40
---@param list table<integer, table>|nil Hints in the same format as setControl.
function ui_apps_missionControls.setControls(list) end

