---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/debugSection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Debug" section (order 1010) of the Dynamic Decals tool: a series of test buttons for developers. They call the editor_api_dynamicDecals API (layer reprojection, brush bake, layerStack dump, material names, surface depth/normal, vehicle material update), the other modules of the tool (textures, gizmo, notification, docs, widgets, settings) and a dynamic material generator for all vehicles.
--- Access: extension `editor_dynamicDecals_debugSection`: `extensions.load("editor_dynamicDecals_debugSection")`, then the global `editor_dynamicDecals_debugSection`
---@class editor_dynamicDecals_debugSection
editor_dynamicDecals_debugSection = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/debugSection.lua:172
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_debugSection.editorPreferenceValueChanged(path, value) end

--- Declares no preference (the body is entirely commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/debugSection.lua:166
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_debugSection.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the API and the textures, gizmo, notification, docs, widgets, settings modules, then registers the "Debug" section (order 1010).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/debugSection.lua:176
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_debugSection.setup(tool_in) end

