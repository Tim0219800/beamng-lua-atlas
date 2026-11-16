---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Linked Set" layer type of the Dynamic Decals tool: behaves like a group, but you can add to it in the inspector properties (among api.properties) with a value. The "Apply" button recursively propagates these values to all child layers that have the property, whatever their type. The toolbar button (order 40) calls api.addLinkedSet.
--- Access: extension `editor_dynamicDecals_layerTypes_linkedSet`: `extensions.load("editor_dynamicDecals_layerTypes_linkedSet")`, then the global `editor_dynamicDecals_layerTypes_linkedSet`
---@class editor_dynamicDecals_layerTypes_linkedSet
editor_dynamicDecals_layerTypes_linkedSet = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:184
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerTypes_linkedSet.editorPreferenceValueChanged(path, value) end

--- Empty function _anon(unused section).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:174
---@param guiId string ImGui identifier suffix (unused).
function editor_dynamicDecals_layerTypes_linkedSet.onGui(guiId) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:178
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerTypes_linkedSet.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the related modules, registers the inspector GUI of the linkedSet type, the "linkedSet" toolbar item and the "Layer Types / Linked Set Layers" documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:202
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerTypes_linkedSet.setup(tool_in) end

