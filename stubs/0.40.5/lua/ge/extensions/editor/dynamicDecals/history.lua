---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "History" section of the Dynamic Decals tool. Displays the undo (Undo) and redo (Redo) stacks of the API's history object (api.getHistory()), lets you undo/redo up to a chosen entry, clear the history, and shows the content of an action in a tooltip (dump truncated to 20 lines of 100 characters).
--- Access: extension `editor_dynamicDecals_history`: `extensions.load("editor_dynamicDecals_history")`, then the global `editor_dynamicDecals_history`
---@class editor_dynamicDecals_history
editor_dynamicDecals_history = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/history.lua:89
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_history.editorPreferenceValueChanged(path, value) end

--- Registers the float preference `dynamicDecalsTool.history.sectionHeight` (default 256, from 64 to 1024).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/history.lua:83
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_history.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the API and registers the "History" section (order 1045).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/history.lua:93
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_history.setup(tool_in) end

