---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/debugTextures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Debug Textures" debug section of the Dynamic Decals tool. Shows, in collapsible headers, the internal textures of the editor_api_dynamicDecals API: dynamic, baked, highlight, decal (brush input) and masks. The maximum width of the previews comes from the preference `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (default 512).
--- Access: extension `editor_dynamicDecals_debugTextures`: `extensions.load("editor_dynamicDecals_debugTextures")`, then the global `editor_dynamicDecals_debugTextures`
---@class editor_dynamicDecals_debugTextures
editor_dynamicDecals_debugTextures = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/debugTextures.lua:48
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_debugTextures.editorPreferenceValueChanged(path, value) end

--- Registers the float preference `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (default 512).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/debugTextures.lua:42
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_debugTextures.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the API and registers the "Debug Textures" section (order 1130).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/debugTextures.lua:52
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_debugTextures.setup(tool_in) end

