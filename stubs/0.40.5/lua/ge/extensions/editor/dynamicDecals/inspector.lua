---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/inspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Inspector of the Dynamic Decals tool: displays and lets you edit all properties of the selected layers (`editor.selection["dynamicDecalLayer"]`) or of the selected brush (`editor.selection["dynamicDecalBrush"]`). Common fields (uid, name, type, enabled) are drawn here; the rest is delegated to a GUI function registered per layer type via registerLayerGui (by the layerTypes/* modules).
--- Access: extension `editor_dynamicDecals_inspector`: `extensions.load("editor_dynamicDecals_inspector")`, then the global `editor_dynamicDecals_inspector`
---@class editor_dynamicDecals_inspector
editor_dynamicDecals_inspector = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector.lua:104
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value) end

--- If a brush is selected, calls brushes.inspectorGui(brush).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector.lua:91
---@param inspectorInfo table Inspector information (not used).
function editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo) end

--- Draws the inspector of the selected layers (a single one directly, several in TreeNodes). Does nothing if the selection is nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector.lua:64
---@param inspectorInfo table Editor inspector information (not used here).
function editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo) end

--- Registers the float preference `dynamicDecalsTool.inspector.texturePreviewSize` (default 128, from 32 to 512).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector.lua:98
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry) end

--- Registers the function that draws the specific properties of a layer type; it is called with (layer, guiId).
---Source: lua/ge/extensions/editor/dynamicDecals/inspector.lua:133
---@param layerTypeId integer Layer type identifier (value of api.layerTypes).
---@param guiFn function function(layer, guiId) that draws the UI.
function editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn) end

--- Called by the tool: gets API, brushes, docs, widgets and helper, installs a default GUI for each layer type of api.layerTypes and registers the "Inspector" doc page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/inspector.lua:118
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_inspector.setup(tool_in) end

