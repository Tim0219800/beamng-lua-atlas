---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World editor telemetry tracker: measures how long the editor is open (activity "editorActive") and records the tool windows opened (event "editorToolWindowOpened" with tool name and entry point). Only tool names are reported, never level or asset paths. The track builder is tracked by another gameplay tracker.
--- Access: extension `telemetry_trackers_editor`: `extensions.load("telemetry_trackers_editor")`, then the global `telemetry_trackers_editor`
---@class telemetry_trackers_editor
---@field dependencies string[] telemetry_core.
telemetry_trackers_editor = {}

--- Hook called when the editor is activated: starts the editorActive activity (no effect if already open).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/editor.lua:19
function telemetry_trackers_editor.onEditorActivated() end

--- Hook called when the editor is closed: ends the editorActive activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/editor.lua:25
function telemetry_trackers_editor.onEditorDeactivated() end

--- Hook called when a tool window is opened: records the event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/editor.lua:31
---@param toolName string Tool name.
---@param entryPoint string Entry point (menu, shortcut, etc., inferred from code).
function telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint) end

--- Hook called when the game closes: closes the open editor activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/editor.lua:45
function telemetry_trackers_editor.onExit() end

--- Hook called on load: manual unload, and starts the activity if the editor is already active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/editor.lua:39
function telemetry_trackers_editor.onExtensionLoaded() end

--- Hook called on unload: closes the open editor activity (same function as onExit).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/editor.lua:45
function telemetry_trackers_editor.onExtensionUnloaded() end

