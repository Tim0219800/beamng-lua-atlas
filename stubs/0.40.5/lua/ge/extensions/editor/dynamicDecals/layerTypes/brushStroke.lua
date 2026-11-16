---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Brush Stroke" layer type of the Dynamic Decals tool: a virtual brush stroke that places a decal every frame during movement and interpolates decals between frames. It shares the properties of a decal layer. This module provides the "Brush Stroke Properties" section (number of interpolation steps, order 1070), the inspector GUI of the brushStroke type (uid, name, enabled, color, scale, rotation, alpha mask, SDF, textures, dataPoints, etc.) and the documentation pages (Brush Stroke Layers, Properties).
--- Access: extension `editor_dynamicDecals_layerTypes_brushStroke`: `extensions.load("editor_dynamicDecals_layerTypes_brushStroke")`, then the global `editor_dynamicDecals_layerTypes_brushStroke`
---@class editor_dynamicDecals_layerTypes_brushStroke
editor_dynamicDecals_layerTypes_brushStroke = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua:544
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerTypes_brushStroke.editorPreferenceValueChanged(path, value) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua:538
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerTypes_brushStroke.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the related modules, registers the "Brush Stroke Properties" section, the inspector GUI of the brushStroke type and the documentation pages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua:589
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerTypes_brushStroke.setup(tool_in) end

