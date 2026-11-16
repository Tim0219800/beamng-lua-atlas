---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Group" layer type of the Dynamic Decals tool: a container layer that groups other layers; disabling it hides all its children. This module adds the "Add group" button to the toolbar (api.addGroup), registers an empty inspector GUI for this type and the "Layer Types / Group Layers" documentation page.
--- Access: extension `editor_dynamicDecals_layerTypes_group`: `extensions.load("editor_dynamicDecals_layerTypes_group")`, then the global `editor_dynamicDecals_layerTypes_group`
---@class editor_dynamicDecals_layerTypes_group
editor_dynamicDecals_layerTypes_group = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:37
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerTypes_group.editorPreferenceValueChanged(path, value) end

--- Empty function _anon(unused section).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:27
---@param guiId string ImGui identifier suffix (unused).
function editor_dynamicDecals_layerTypes_group.onGui(guiId) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:31
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerTypes_group.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: registers the inspector GUI of the group type, the "group" toolbar item (order 30) and the documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:52
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerTypes_group.setup(tool_in) end

