---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/riverEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "River" edit mode of the world editor. This file is a thin wrapper: it loads the generic logic of meshEditor.lua (via dofile), configures it with type = "River" (preferencesName "riverEditor", niceName "River") and re-exposes its editor callbacks. It registers the riverEditMode mode (icon create_river, action map "RiverEditor", edited class River) with the shortcuts Alt + left click (create a river / add a node), copy and paste river properties.
--- Access: extension `editor_riverEditor`: `extensions.load("editor_riverEditor")`, then the global `editor_riverEditor`
---@class editor_riverEditor
---@field deleteNodeAM function Alias of meshEditor.deleteNodeAM: node deletion, intended for the action map.
---@field onEditorAxisGizmoAligmentChanged function Alias of meshEditor.onEditorAxisGizmoAligmentChanged_: axis gizmo alignment change (the spelling "Aligment" is the code's).
---@field onEditorGui function Alias of meshEditor.onEditorGui_: draws the mode's ImGui interface.
---@field onEditorInspectorFieldChanged function Alias of meshEditor.onEditorInspectorFieldChanged_: reacts to a field modification in the inspector.
---@field onEditorInspectorHeaderGui function Alias of meshEditor.onEditorInspectorHeaderGui_: custom inspector header.
---@field onEditorObjectSelectionChanged function Alias of meshEditor.onEditorObjectSelectionChanged_: the object selection changed.
---@field onEditorPreferenceValueChanged function Alias of meshEditor.onEditorPreferenceValueChanged_: reacts to a preference change.
---@field onEditorRegisterPreferences function Alias of meshEditor.onEditorRegisterPreferences_: declares the river editor's preferences.
---@field selectAllNodes function Alias of meshEditor.selectAllNodes: selects all the river's nodes.
editor_riverEditor = {}

--- Hook called when the editor is initialized. Creates editor.editModes.riverEditMode (onActivate, onUpdate, onToolbar, copy/paste, delete, select all, icon, auxShortcuts) and adds the auxiliary shortcuts "Create river / Add node" (LMB + Alt), "Copy river properties" and "Paste river properties".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/riverEditor.lua:17
function editor_riverEditor.onEditorInitialized() end

--- Hook called when the extension loads; only writes "initialized" to the log (level D).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/riverEditor.lua:40
function editor_riverEditor.onExtensionLoaded() end

