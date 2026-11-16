---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/loadSave.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Load/Save" section of the Dynamic Decals tool. Lets you save the layer stack to a `.dyndecals.json` project file ("Save as..." / "Save") and load one ("Load from file") in Overwrite (replace) or Append (add) mode. The default folder is /art/dynamicDecals/projects/. The last used path is kept across extension reloads (onSerialize / onDeserialized).
--- Access: extension `editor_dynamicDecals_loadSave`: `extensions.load("editor_dynamicDecals_loadSave")`, then the global `editor_dynamicDecals_loadSave`
---@class editor_dynamicDecals_loadSave
editor_dynamicDecals_loadSave = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:88
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_loadSave.editorPreferenceValueChanged(path, value) end

--- Returns the path of the last project file used (or the default folder).
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:145
---@return string  Project path.
function editor_dynamicDecals_loadSave.getCurrentPorjectFilePath() end

--- Opens the file dialog (filter .dyndecals.json) then calls api.loadLayerStackFromFile(path, mode) and stores the path.
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:22
function editor_dynamicDecals_loadSave.loadFileDialog() end

--- Hook called after reload with the data from onSerialize; restores lastProjectFilePath (default: projects folder).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:141
---@param data table Table returned by onSerialize.
function editor_dynamicDecals_loadSave.onDeserialized(data) end

--- Extension reload hook: returns {lastProjectFilePath} to keep.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:135
---@return table  Data to restore.
function editor_dynamicDecals_loadSave.onSerialize() end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:82
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_loadSave.registerEditorPreferences(prefsRegistry) end

--- Opens the "Save as" dialog (overwrite confirmation) then calls api.saveLayerStackToFile and stores the path.
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:39
function editor_dynamicDecals_loadSave.saveAsFileDialog() end

--- Called by the tool: gets API, notification and docs, prepares the list of loading modes, registers the "Load/Save" section (order 20) and the "Save & Load" documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/loadSave.lua:117
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_loadSave.setup(tool_in) end

