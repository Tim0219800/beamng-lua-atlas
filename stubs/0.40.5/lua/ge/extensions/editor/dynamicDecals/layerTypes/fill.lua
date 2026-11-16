---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Fill" layer type of the Dynamic Decals tool: fills the entire vehicle with a solid color, useful as the base of a design. Provides the "Add Fill Layer" window (color palette + color, OK calls api.addFillLayer then adds the color to the history), the toolbar button (order 10), the inspector GUI of the fill type and the documentation page.
--- Access: extension `editor_dynamicDecals_layerTypes_fill`: `extensions.load("editor_dynamicDecals_layerTypes_fill")`, then the global `editor_dynamicDecals_layerTypes_fill`
---@class editor_dynamicDecals_layerTypes_fill
editor_dynamicDecals_layerTypes_fill = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:125
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerTypes_fill.editorPreferenceValueChanged(path, value) end

--- Opens the "Add Fill Layer" window.
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:129
function editor_dynamicDecals_layerTypes_fill.openAddLayerWindow() end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:119
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerTypes_fill.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the related modules, registers the add window (360x140), the drawing of this window, the inspector GUI of the fill type, the "fill" toolbar item and the documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:143
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerTypes_fill.setup(tool_in) end

