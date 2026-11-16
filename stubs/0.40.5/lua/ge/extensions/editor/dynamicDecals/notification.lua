---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/notification.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Notification window of the Dynamic Decals tool ("Dynamic Decals - Notifications"). Other modules call add(section, title, message, level); messages are grouped by section in collapsible headers, colored by level (log white, warning yellow, error red), deletable one by one or all together. The window opens by itself when a message is added and closes when the list is empty.
--- Access: extension `editor_dynamicDecals_notification`: `extensions.load("editor_dynamicDecals_notification")`, then the global `editor_dynamicDecals_notification`
---@class editor_dynamicDecals_notification
---@field levels table<string, integer> Severity levels: log = 1, warning = 2, error = 3.
editor_dynamicDecals_notification = {}

--- Adds a notification in the given section and flags the window to open on the next frame.
---Source: lua/ge/extensions/editor/dynamicDecals/notification.lua:97
---@param section string Section name (grouping key).
---@param title string Title displayed before the message.
---@param msg string|function Text, or function that draws the content.
---@param level integer|nil A value of levels; default levels.log.
function editor_dynamicDecals_notification.add(section, title, msg, level) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/notification.lua:84
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value) end

--- Draws the notification window. Registered with the tool via tool.registerOnEditorGuiFn and called every editor UI frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/notification.lua:31
function editor_dynamicDecals_notification.onGui() end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/notification.lua:78
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: registers onGui and declares the editor window (450x650).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/notification.lua:88
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_notification.setup(tool_in) end

