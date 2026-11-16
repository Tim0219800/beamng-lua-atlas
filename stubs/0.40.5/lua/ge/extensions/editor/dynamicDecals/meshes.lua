---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/meshes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module (experimental, disabled) of the Dynamic Decals tool to change the shape file (.dae) onto which decals are projected. The section code exists but the registration of the "Meshes (Experimental)" section is commented out in setup: no interface is visible.
--- Access: extension `editor_dynamicDecals_meshes`: `extensions.load("editor_dynamicDecals_meshes")`, then the global `editor_dynamicDecals_meshes`
---@class editor_dynamicDecals_meshes
editor_dynamicDecals_meshes = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/meshes.lua:46
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_meshes.editorPreferenceValueChanged(path, value) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/meshes.lua:40
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_meshes.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: stores the tool, the API and the settings module. Registers no section (commented line).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/meshes.lua:50
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_meshes.setup(tool_in) end

