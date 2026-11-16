---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/genericMissionData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stores mission information lines (title, text, timer) sorted by category and sends them to the "genericMissionData" interface app via guihooks.trigger('SetGenericMissionData'). Used by missions and flowgraph to display arbitrary data sorted by order. The extension stays loaded permanently (setExtensionUnloadMode manual).
--- Access: extension `ui_apps_genericMissionData`: `extensions.load("ui_apps_genericMissionData")`, then the global `ui_apps_genericMissionData`
---@class ui_apps_genericMissionData
ui_apps_genericMissionData = {}

--- Clears all data and sends 'SetGenericMissionDataResetAll' to the interface.
---Source: lua/ge/extensions/ui/apps/genericMissionData.lua:17
function ui_apps_genericMissionData.clearData() end

--- Initialization hook: sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/genericMissionData.lua:6
function ui_apps_genericMissionData.onInit() end

--- Sends all items back to the interface, in display order (useful when the app is mounted afterwards).
---Source: lua/ge/extensions/ui/apps/genericMissionData.lua:26
function ui_apps_genericMissionData.sendAllData() end

--- Adds, updates or clears (clear=true) a mission item, then sends the affected items to the interface with their index.
---Source: lua/ge/extensions/ui/apps/genericMissionData.lua:37
---@param args table {category=string|nil ('default'), order=number|nil, clear=boolean|nil, title, txt, style, minutes, seconds, milliseconds}.
function ui_apps_genericMissionData.setData(args) end

