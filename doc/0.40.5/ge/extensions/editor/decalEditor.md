# `editor_decalEditor`

*File: `lua/ge/extensions/editor/decalEditor.lua` · VM: Game Engine (GE) · 1400 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_decalEditor`: `extensions.load("editor_decalEditor")`, then the global `editor_decalEditor`

World Editor decal editor ("Edit Decal" edit mode, "Decal Editor" window, "DecalEditor" action map). Two tabs: "Templates" (list of DecalData with * for modified ones; create, delete, save one or all templates) and "Instances" (list and properties of placed decals, template replacement, duplication). In Templates mode, a click on the terrain creates an instance of the selected template; instances are visualized by debug spheres colored by id, selectable with the mouse (Ctrl+click = multi-selection) and movable with the axis gizmo (Shift + drag = duplicate). All actions are undoable via editor.history, and decals are saved before the level is saved.

## Notes

- The DummyDecal and tireTrackDecal templates are hidden from the list.
- Debug distances: spheres up to 250 m, texts up to 50 m; sphere opacity is set with the "Gizmo sphere alpha" slider.
- A spatial grid of cells speeds up the search for visible and hovered decals; it is rebuilt when the number of decals changes.
- The gizmo is placed on the average of the selected instances' positions, or on the instance's world matrix in local alignment with a single selection.
- Possible error: in onEditorInspectorFieldChanged, the result of scenetree.findObjectById is not checked before template:getClassName() (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_decalEditor.onEditorAxisGizmoAligmentChanged()` | Hook called when the gizmo alignment (local/world) changes; if instances are selected in Edit Decal mode, repositions the gizmo. *(internal)* *(hook)* | 282 |
| `editor_decalEditor.onEditorBeforeSaveLevel()` | Hook called before the level is saved; saves all decal templates (editor.saveDecals). *(internal)* *(hook)* | 1335 |
| `editor_decalEditor.onEditorGui()` | Hook called every editor frame; if the Edit Decal mode is active, draws the window (sphere opacity slider, "Show info labels" checkbox, Templates and Instances tabs). *(internal)* *(hook)* | 1359 |
| `editor_decalEditor.onEditorInitialized()` | Hook called at editor initialization: declares editor.editModes.decalEditMode (onActivate, onDeactivate, onUpdate, onDeleteSelection, create_decal icon, auxiliary shortcuts) and registers the 400x600 window. *(internal)* *(hook)* | 1316 |
| `editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook called when a field changes in the inspector; for each modified DecalData, marks it dirty in scenetree.decalPersistMan and notifies the instances that use it (editor.notifyDecalModified). *(internal)* *(hook)* | 1339 |
| `editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook called to draw the inspector header; in Edit Decal mode, shows the material preview of the selected template. *(internal)* *(hook)* | 1017 |
| `editor_decalEditor.onExtensionLoaded()` | Hook called when the extension is loaded; writes "initialized" to the log. *(internal)* *(hook)* | 1301 |

### Parameter details

#### `editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook called when a field changes in the inspector; for each modified DecalData, marks it dirty in scenetree.decalPersistMan and notifies the instances that use it (editor.notifyDecalModified).

- `selectedIds` (*integer[]*) : ids of the selected objects
- `fieldName` (*string*) : modified field
- `fieldValue` (*any*) : new value
- `arrayIndex` (*integer*) : index in the array field

#### `editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook called to draw the inspector header; in Edit Decal mode, shows the material preview of the selected template.

- `inspectorInfo` (*table*) : inspector info (unused)

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `debugDrawer:` `drawArrow`, `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/decalEditor.lua`.*
