---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/brushes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Brush management for the Dynamic Decals tool: a preset saves the current state of the decal properties (color/alpha/metallic/normal/roughness textures, color, gradient, rotation, scale, skew, UV, alpha mask, SDF, mirror, intensities, wrap...). Brushes are stored in /art/dynamicDecals/brushes/brushes.json, listed in the browser's "Brushes" tab (order 30) and inspectable (Use / Delete / Save). A modder uses it to save or reload a decal setting.
--- Access: extension `editor_dynamicDecals_brushes`: `extensions.load("editor_dynamicDecals_brushes")`, then the global `editor_dynamicDecals_brushes`
---@class editor_dynamicDecals_brushes
editor_dynamicDecals_brushes = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:609
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_brushes.editorPreferenceValueChanged(path, value) end

--- Returns the list of brushes loaded in memory.
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:599
---@return table[]  List of brushes (the internal table, not a copy).
function editor_dynamicDecals_brushes.getBrushes() end

--- Draws the inspector of a selected brush: Use (loadBrush), Delete and Save buttons (visible only if brush.dirty), then the preview and the properties.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:306
---@param brush table Selected brush (editor.selection["dynamicDecalBrush"]).
function editor_dynamicDecals_brushes.inspectorGui(brush) end

--- Applies to the API (api.set*) all properties of a brush: alpha mask, blend mode, color, textures, rotation, scale, skew, gradient, UV, SDF, etc.
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:135
---@param brush table Brush (brushes.json entry, see saveBrush for the fields).
function editor_dynamicDecals_brushes.loadBrush(brush) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:603
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_brushes.registerEditorPreferences(prefsRegistry) end

--- Creates a brush from the current API state (api.get*), adds it to the list and writes brushes.json.
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:55
---@param name string|nil Brush name; defaults to the color texture name.
function editor_dynamicDecals_brushes.saveBrush(name) end

--- Called by the tool: gets API, browser, selection and layerTypes_decal, loads brushes.json if present, registers the "Brushes" tab of the browser.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/brushes.lua:613
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_brushes.setup(tool_in) end

