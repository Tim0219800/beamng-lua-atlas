---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reusable ImGui widgets for the layer GUIs of the Dynamic Decals inspector: texture picker (read-only field, folder button, reset button, preview, drag-and-drop target) and four-corner gradient editor for a decal layer. Each modification calls api.setLayer(layer, true). Depends on editor_api_dynamicDecals.
--- Access: extension `editor_dynamicDecals_inspector_utils`: `extensions.load("editor_dynamicDecals_inspector_utils")`, then the global `editor_dynamicDecals_inspector_utils`
---@class editor_dynamicDecals_inspector_utils
---@field dependencies string[] Extensions loaded before this one: {"editor_api_dynamicDecals"}.
editor_dynamicDecals_inspector_utils = {}

--- Draws a four-corner gradient square with an RGBA color picker at each corner; updates the layer's decalGradientColor* properties.
---Source: lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:56
---@param k any Not used in the function body.
---@param layer table Decal layer containing the four gradient colors.
---@param guiId string ImGui identifier suffix.
function editor_dynamicDecals_inspector_utils.decalColorGradientWidgetInspect(k, layer, guiId) end

--- Draws a texture picker for layer[property]: read-only path, opening of a file dialog (png/jpg/jpeg, default folder /art/decals/dynDecals/), deletion, preview and drop zone. Assigns layer[property] then calls api.setLayer(layer, true).
---Source: lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:17
---@param layer table Layer data.
---@param property string Name of the field containing the texture path.
---@param guiId string ImGui identifier suffix.
---@param removeTextureOverridePath string|nil Value put in the property by the delete button; default "/".
function editor_dynamicDecals_inspector_utils.decalTextureWidgetInspect(layer, property, guiId, removeTextureOverridePath) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:136
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_inspector_utils.editorPreferenceValueChanged(path, value) end

--- Empty function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:126
function editor_dynamicDecals_inspector_utils.onGui() end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:130
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_inspector_utils.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: stores the tool and the API.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:140
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_inspector_utils.setup(tool_in) end

