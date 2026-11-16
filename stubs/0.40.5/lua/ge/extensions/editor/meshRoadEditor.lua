---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshRoadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World editor extension that provides the "Edit MeshRoad" mode (mesh roads). It loads editor/meshEditor.lua with dofile(), sets type = "MeshRoad", preferencesName = "meshRoadEditor" and niceName = "Mesh Road" on it, then registers the meshRoadEditMode edit mode (action map MeshRoadEditor, icon create_road_mesh). Alt+left click creates a road or adds a node; copy/paste transfers the properties.
--- Access: extension `editor_meshRoadEditor`: `extensions.load("editor_meshRoadEditor")`, then the global `editor_meshRoadEditor`
---@class editor_meshRoadEditor
---@field deleteNodeAM nil Relay of meshEditor.deleteNodeAM, which does not exist: it is nil.
---@field onEditorAxisGizmoAligmentChanged function Relay of meshEditor.onEditorAxisGizmoAligmentChanged_.
---@field onEditorGui nil Meant to relay meshEditor.onEditorGui_, but this function does not exist: it is nil.
---@field onEditorInspectorFieldChanged function Relay of meshEditor.onEditorInspectorFieldChanged_ (regenerates the road if segmentLength or subdivideLength changes).
---@field onEditorInspectorHeaderGui function Relay of meshEditor.onEditorInspectorHeaderGui_ (nodes panel in the inspector).
---@field onEditorObjectSelectionChanged function Relay of meshEditor.onEditorObjectSelectionChanged_.
---@field onEditorPreferenceValueChanged function Relay of meshEditor.onEditorPreferenceValueChanged_.
---@field onEditorRegisterPreferences function Relay of meshEditor.onEditorRegisterPreferences_ (preferences meshRoadEditor.general.*).
---@field selectAllNodes nil Relay of meshEditor.selectAllNodes, which does not exist: it is nil.
editor_meshRoadEditor = {}

--- Hook called at world editor initialization: creates editor.editModes.meshRoadEditMode (name "Edit MeshRoad", onActivate, onUpdate, onToolbar, onDeselect, copy/paste, deletion, select all) and its auxiliary shortcuts (Alt+LMB, copy, paste).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshRoadEditor.lua:17
function editor_meshRoadEditor.onEditorInitialized() end

--- Hook called when the extension loads: writes "initialized" to the log (level D).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshRoadEditor.lua:41
function editor_meshRoadEditor.onExtensionLoaded() end

