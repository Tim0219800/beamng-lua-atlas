# `editor_meshEditor`

*File: `lua/ge/extensions/editor/meshEditor.lua` · VM: Game Engine (GE) · 1081 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshEditor`: `extensions.load("editor_meshEditor")`, then the global `editor_meshEditor`

Code shared by the editors of "mesh"-type node objects (MeshRoad and River) of the world editor. It is not an extension loaded by extensions.load: meshRoadEditor.lua and riverEditor.lua load it with dofile() then set M.type, M.preferencesName and M.niceName before wiring its "_"-suffixed functions to their edit mode. It handles the selection of the mesh and its nodes, creation by Alt+click, node insertion, width dragging, field copy/paste, deletion, undo/redo history, highlighting and preferences (default width, depth, height).

## Notes

- The module variables (M.type, M.preferencesName, M.niceName) must be set by the calling editor BEFORE onActivate_ / onEditorRegisterPreferences_; otherwise the preference paths are invalid.
- Since dofile() re-evaluates the file, each editor (road, river) has its own isolated copy of the state (selected node, copied fields).
- Alt held = creation mode: clicking on empty space creates a mesh or adds a node; clicking on the selected mesh inserts an interpolated node (average width, depth, normal).
- Minor bug: meshRoadEditor.lua and riverEditor.lua export M.onEditorGui_, M.deleteNodeAM and M.selectAllNodes from this module, but it does not define them: these fields are nil on the editors' side.
- The functions of the exported list use the "_" suffix so they are not confused with the hooks of the extension that wraps them.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshEditor.copySettingsAM()` | Called by the action map (copy): remembers the fields of the selected mesh (editor.copyFields) for a later paste or to initialize a new mesh. Does nothing if no mesh is selected. *(internal)* | 964 |
| `editor_meshEditor.onActivate_()` | Called when the edit mode is activated: computes the mode name ("Edit" .. M.type) and synchronizes the selection with the editor. *(internal)* *(hook)* | 1060 |
| `editor_meshEditor.onDeleteSelection()` | Deletes the selection: the selected nodes if the mesh keeps more than 2, otherwise the whole mesh. Goes through the editor history (undo/redo). *(internal)* *(hook)* | 269 |
| `editor_meshEditor.onDeselect_()` | Called when the edit mode is exited: deselects the node and clears the object selection. *(internal)* *(hook)* | 1055 |
| `editor_meshEditor.onEditorAxisGizmoAligmentChanged_()` | Hook: when the axis gizmo alignment changes (and this mode is active), repositions the gizmo on the selected node. The name contains the game's typo "Aligment". *(internal)* *(hook)* | 1040 |
| `editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook: when an inspector field changes, regenerates the meshes of the handled type if the field is segmentLength or subdivideLength. *(internal)* *(hook)* | 1029 |
| `editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo)` | Hook: draws, in the inspector header, the panel of the selected nodes' properties (width, depth, height) when this mode is active and a mesh with selected nodes exists. *(internal)* *(hook)* | 354 |
| `editor_meshEditor.onEditorObjectSelectionChanged_()` | Hook: when the object selection changes (mode active), keeps the id of the first object of type M.type as the current mesh. *(internal)* *(hook)* | 1047 |
| `editor_meshEditor.onEditorPreferenceValueChanged_(path, value)` | Hook: recomputes the height offset (heightOffset) when the preference <preferencesName>.general.defaultHeight changes. *(internal)* *(hook)* | 1011 |
| `editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry)` | Hook: registers the preferences category M.preferencesName with defaultWidth (10), defaultDepth (5), defaultHeight (2), dragWidth, highlightNearby and highlightNearbyDistance (100 m). *(internal)* *(hook)* | 1015 |
| `editor_meshEditor.onSelectAll()` | Selects all the nodes of the current mesh (indices 0 to getNodeCount()-1). *(internal)* *(hook)* | 53 |
| `editor_meshEditor.onToolbar_()` | Draws the mode toolbar: default width and depth, "Highlight nearby" checkbox and highlight distance in meters. The values are written to the preferences. *(internal)* *(hook)* | 984 |
| `editor_meshEditor.onUpdate_()` | Called every frame while the mode is active: detects the hovered node or mesh, handles the mouse raycast, Alt+click creation of meshes and nodes, width dragging, highlighting and debugDrawer drawing (spheres and help texts). *(internal)* *(hook)* | 735 |
| `editor_meshEditor.pasteFieldsAM()` | Called by the action map (paste): applies the remembered fields to the selected mesh via a "PasteMeshFields" history action (undo/redo possible). Does nothing without a selected mesh or without a copy. *(internal)* | 129 |

### Parameter details

#### `editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook: when an inspector field changes, regenerates the meshes of the handled type if the field is segmentLength or subdivideLength.

- `selectedIds` (*integer[]*) : Ids of the objects whose field changed.
- `fieldName` (*string*) : Name of the modified field.
- `fieldValue` (*any*) : New value (unused here).
- `arrayIndex` (*integer|nil*) : Index in an array field (unused here).

#### `editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo)`

Hook: draws, in the inspector header, the panel of the selected nodes' properties (width, depth, height) when this mode is active and a mesh with selected nodes exists.

- `inspectorInfo` (*table*) : Inspector information provided by the editor.

#### `editor_meshEditor.onEditorPreferenceValueChanged_(path, value)`

Hook: recomputes the height offset (heightOffset) when the preference <preferencesName>.general.defaultHeight changes.

- `path` (*string*) : Full path of the modified preference.
- `value` (*number*) : New value.

#### `editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry)`

Hook: registers the preferences category M.preferencesName with defaultWidth (10), defaultDepth (5), defaultHeight (2), dragWidth, highlightNearby and highlightNearbyDistance (100 m).

- `prefsRegistry` (*table*) : Editor preferences registry.

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`, `setSolidTriCulling`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshEditor.lua`.*
