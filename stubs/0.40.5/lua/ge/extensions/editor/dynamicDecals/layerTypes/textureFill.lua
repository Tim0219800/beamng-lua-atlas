---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Texture Fill" layer type of the Dynamic Decals tool: fills the vehicle with a pattern based on an input texture, with color (or vehicle palette), scale and offset. Provides the "Add Texture Fill Layer" window (OK calls api.addTextureFillLayer), the toolbar button (order 20), the inspector GUI of the textureFill type (fillTexturePath, colorPaletteMapId, color, scale, offset) and the doc page.
--- Access: extension `editor_dynamicDecals_layerTypes_textureFill`: `extensions.load("editor_dynamicDecals_layerTypes_textureFill")`, then the global `editor_dynamicDecals_layerTypes_textureFill`
---@class editor_dynamicDecals_layerTypes_textureFill
editor_dynamicDecals_layerTypes_textureFill = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:161
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerTypes_textureFill.editorPreferenceValueChanged(path, value) end

--- Opens the "Add Texture Fill Layer" window.
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:165
function editor_dynamicDecals_layerTypes_textureFill.openAddLayerWindow() end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:155
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerTypes_textureFill.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the related modules, registers the drawing of the add window, the inspector GUI of the textureFill type, the "textureFill" toolbar item, the documentation page and the window (450x310).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:181
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerTypes_textureFill.setup(tool_in) end

