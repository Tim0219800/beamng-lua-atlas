---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/selection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the selection of layers of the Dynamic Decals tool. selectLayer copies the layer into `editor.selection["dynamicDecalLayer"][uid]` (what the inspector reads) and configures the gizmo: starting transform and translate/rotate/scale callbacks depending on the type (decal, brushStroke, path, group). deselectLayer clears the selection and disables the gizmo.
--- Access: extension `editor_dynamicDecals_selection`: `extensions.load("editor_dynamicDecals_selection")`, then the global `editor_dynamicDecals_selection`
---@class editor_dynamicDecals_selection
editor_dynamicDecals_selection = {}

--- Removes the layer `uid` from the selection, or the whole selection if uid is nil. Disables the gizmo (mode none, callbacks and data reset).
---Source: lua/ge/extensions/editor/dynamicDecals/selection.lua:119
---@param uid string|integer|nil Layer to deselect.
function editor_dynamicDecals_selection.deselectLayer(uid) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/selection.lua:142
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_selection.editorPreferenceValueChanged(path, value) end

--- Declares no preference (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/selection.lua:136
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_selection.registerEditorPreferences(prefsRegistry) end

--- Selects the layer `uid` (replaces the selection, unless addToSelection) and prepares the gizmo (type "drag", objectType, transform, callbacks).
---Source: lua/ge/extensions/editor/dynamicDecals/selection.lua:28
---@param uid string|integer Layer identifier; a warning is logged if it is nil.
---@param addToSelection boolean|nil If true, adds to the existing selection.
function editor_dynamicDecals_selection.selectLayer(uid, addToSelection) end

--- Called by the tool: gets the tool, the API and the gizmo module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/selection.lua:146
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_selection.setup(tool_in) end

