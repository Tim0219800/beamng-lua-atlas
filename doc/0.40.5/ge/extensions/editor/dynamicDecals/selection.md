# `editor_dynamicDecals_selection`

*File: `lua/ge/extensions/editor/dynamicDecals/selection.lua` · VM: Game Engine (GE) · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_selection`: `extensions.load("editor_dynamicDecals_selection")`, then the global `editor_dynamicDecals_selection`

Manages the selection of layers of the Dynamic Decals tool. selectLayer copies the layer into `editor.selection["dynamicDecalLayer"][uid]` (what the inspector reads) and configures the gizmo: starting transform and translate/rotate/scale callbacks depending on the type (decal, brushStroke, path, group). deselectLayer clears the selection and disables the gizmo.

## Notes

- The selection stores a deep copy (deepcopy) of the layer: modifying it does not modify the layer stack; you must go through api.setLayer.
- Rotation and scale are only handled for decals; brushStroke, path and group only handle translation (via api.moveLayerLocalPos).
- For a group, the gizmo is placed on the first draggable child. getDraggableChildLayer returns on the first child (the `return` is inside the loop): only the first child is examined.
- Without addToSelection, `editor.selection` is entirely reset to {} (all editor selections are lost).
- deselectLayer resets toolMode to tool.toolModes.decal.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_selection.deselectLayer(uid)` | Removes the layer `uid` from the selection, or the whole selection if uid is nil. Disables the gizmo (mode none, callbacks and data reset). | 119 |
| `editor_dynamicDecals_selection.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 142 |
| `editor_dynamicDecals_selection.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 136 |
| `editor_dynamicDecals_selection.selectLayer(uid, addToSelection)` | Selects the layer `uid` (replaces the selection, unless addToSelection) and prepares the gizmo (type "drag", objectType, transform, callbacks). | 28 |
| `editor_dynamicDecals_selection.setup(tool_in)` | Called by the tool: gets the tool, the API and the gizmo module. *(internal)* | 146 |

### Parameter details

#### `editor_dynamicDecals_selection.deselectLayer(uid)`

Removes the layer `uid` from the selection, or the whole selection if uid is nil. Disables the gizmo (mode none, callbacks and data reset).

- `uid` (*string|integer|nil*) : Layer to deselect.

#### `editor_dynamicDecals_selection.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_selection.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_selection.selectLayer(uid, addToSelection)`

Selects the layer `uid` (replaces the selection, unless addToSelection) and prepares the gizmo (type "drag", objectType, transform, callbacks).

- `uid` (*string|integer*) : Layer identifier; a warning is logged if it is nil.
- `addToSelection` (*boolean|nil*) : If true, adds to the existing selection.

#### `editor_dynamicDecals_selection.setup(tool_in)`

Called by the tool: gets the tool, the API and the gizmo module.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Calls into the engine (C++)

- `worldEditorCppApi.` `getAxisGizmoRotateOffset`, `getAxisGizmoScaleOffset`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/selection.lua`.*
