# `editor_meshRoadEditor`

*File: `lua/ge/extensions/editor/meshRoadEditor.lua` · VM: Game Engine (GE) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshRoadEditor`: `extensions.load("editor_meshRoadEditor")`, then the global `editor_meshRoadEditor`

World editor extension that provides the "Edit MeshRoad" mode (mesh roads). It loads editor/meshEditor.lua with dofile(), sets type = "MeshRoad", preferencesName = "meshRoadEditor" and niceName = "Mesh Road" on it, then registers the meshRoadEditMode edit mode (action map MeshRoadEditor, icon create_road_mesh). Alt+left click creates a road or adds a node; copy/paste transfers the properties.

## Notes

- All the logic is in meshEditor.lua; this file only configures it and relays its hooks.
- Bug: M.onEditorGui, M.deleteNodeAM and M.selectAllNodes are assigned from meshEditor.onEditorGui_, .deleteNodeAM and .selectAllNodes, which do not exist in meshEditor.lua: these three fields are nil. Deletion and select-all actually go through the edit mode's onDeleteSelection and onSelectAll.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshRoadEditor.onEditorInitialized()` | Hook called at world editor initialization: creates editor.editModes.meshRoadEditMode (name "Edit MeshRoad", onActivate, onUpdate, onToolbar, onDeselect, copy/paste, deletion, select all) and its auxiliary shortcuts (Alt+LMB, copy, paste). *(internal)* *(hook)* | 17 |
| `editor_meshRoadEditor.onExtensionLoaded()` | Hook called when the extension loads: writes "initialized" to the log (level D). *(internal)* *(hook)* | 41 |

## Fields

| Field | Type | Description |
|---|---|---|
| `deleteNodeAM` | nil | Relay of meshEditor.deleteNodeAM, which does not exist: it is nil. |
| `onEditorAxisGizmoAligmentChanged` | function | Relay of meshEditor.onEditorAxisGizmoAligmentChanged_. |
| `onEditorGui` | nil | Meant to relay meshEditor.onEditorGui_, but this function does not exist: it is nil. |
| `onEditorInspectorFieldChanged` | function | Relay of meshEditor.onEditorInspectorFieldChanged_ (regenerates the road if segmentLength or subdivideLength changes). |
| `onEditorInspectorHeaderGui` | function | Relay of meshEditor.onEditorInspectorHeaderGui_ (nodes panel in the inspector). |
| `onEditorObjectSelectionChanged` | function | Relay of meshEditor.onEditorObjectSelectionChanged_. |
| `onEditorPreferenceValueChanged` | function | Relay of meshEditor.onEditorPreferenceValueChanged_. |
| `onEditorRegisterPreferences` | function | Relay of meshEditor.onEditorRegisterPreferences_ (preferences meshRoadEditor.general.*). |
| `selectAllNodes` | nil | Relay of meshEditor.selectAllNodes, which does not exist: it is nil. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshRoadEditor.lua`.*
