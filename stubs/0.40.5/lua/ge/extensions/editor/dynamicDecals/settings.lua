---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Settings" section (order 1040) of the Dynamic Decals tool. Lets you enable/disable the decal API, choose the cursor position (UV) or the mouse, the UV layer (0 or 1), the materials and meshes of the player vehicle that receive decals, and the texture resolution. Maintains the material name <-> index table used by the other modules.
--- Access: extension `editor_dynamicDecals_settings`: `extensions.load("editor_dynamicDecals_settings")`, then the global `editor_dynamicDecals_settings`
---@class editor_dynamicDecals_settings
editor_dynamicDecals_settings = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/settings.lua:204
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_settings.editorPreferenceValueChanged(path, value) end

--- Returns the names of the currently enabled materials (indices of api.getMaterialIndices()).
---Source: lua/ge/extensions/editor/dynamicDecals/settings.lua:246
---@return string[]  List of material names.
function editor_dynamicDecals_settings.getUsedMaterialNames() end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/settings.lua:198
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_settings.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: prepares the lists (UV layers, resolutions), initializes the resolution indices from the API if it is ready, updates the materials, starts the mesh reading job and registers the "Settings" section.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/settings.lua:213
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_settings.setup(tool_in) end

--- Rereads api.getShapeMaterialNames() for the player vehicle and rebuilds the name->index and index->name tables.
---Source: lua/ge/extensions/editor/dynamicDecals/settings.lua:28
function editor_dynamicDecals_settings.updateMaterials() end

