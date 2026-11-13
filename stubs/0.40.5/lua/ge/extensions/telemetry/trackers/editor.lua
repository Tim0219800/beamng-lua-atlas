---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_editor` : `extensions.load("telemetry_trackers_editor")`, puis la globale `telemetry_trackers_editor`
---@class telemetry_trackers_editor
---@field dependencies table
telemetry_trackers_editor = {}

---Source : lua/ge/extensions/telemetry/trackers/editor.lua:19
function telemetry_trackers_editor.onEditorActivated() end

---Source : lua/ge/extensions/telemetry/trackers/editor.lua:25
function telemetry_trackers_editor.onEditorDeactivated() end

---Source : lua/ge/extensions/telemetry/trackers/editor.lua:31
---@param toolName any
---@param entryPoint any
function telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint) end

--- close the open activity, otherwise the last one has no duration
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:45
function telemetry_trackers_editor.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/editor.lua:39
function telemetry_trackers_editor.onExtensionLoaded() end

--- close the open activity, otherwise the last one has no duration
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:45
function telemetry_trackers_editor.onExtensionUnloaded() end

