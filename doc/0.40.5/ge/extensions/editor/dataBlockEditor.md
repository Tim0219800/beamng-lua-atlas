# `editor_dataBlockEditor`

*File: `lua/ge/extensions/editor/dataBlockEditor.lua` · VM: Game Engine (GE) · 303 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dataBlockEditor`: `extensions.load("editor_dataBlockEditor")`, then the global `editor_dataBlockEditor`

World Editor DataBlock (SimDataBlock) editor, accessible through the Assets > "DataBlock Editor" menu. Two-tab window: "Existing" (tree of datablocks grouped by class, with a * for modified datablocks, Save and Delete buttons) and "New" (choice of a class then a "Create new DataBlock" window with name and optional copy of the values of an existing datablock). Field editing is done in the standard inspector; the extension marks the datablock as modified when a field changes. Also adds editor.openDatablockEditor(dataBlockId, previousInspectorObjectId) to open the editor from another tool.

## Notes

- Creation, deletion and saving go through editor.history (undo possible) and the functions editor.createDataBlock, removeDataBlockFromFile, saveDataBlockToFile, saveDirtyDataBlock.
- After deletion, a window states that the datablock is removed from its file and will cease to exist at restart.
- The class list is rebuilt at initialization then when the size of Sim.getDataBlockSet() changes and the window is visible.
- Class names are extracted from enumerateConsoleClasses("SimDataBlock") with the pattern %a+: a name containing a digit or an underscore would be truncated (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dataBlockEditor.onEditorGui()` | Hook called every editor frame: draws the DataBlock Editor window, the creation window and the deletion confirmation if the window is visible. *(internal)* *(hook)* | 138 |
| `editor_dataBlockEditor.onEditorInitialized()` | Hook called at World Editor initialization: adds the menu entry (Assets group), registers the "dataBlockEditor" and "createDataBlock" windows, loads the class list and defines editor.openDatablockEditor. *(internal)* *(hook)* | 114 |
| `editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook called when a field is modified in the inspector; if the first selected object is a datablock, marks it as modified (editor.setDataBlockDirty). *(internal)* *(hook)* | 285 |
| `editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook called to draw the inspector header; if a datablock is selected after a call to openDatablockEditor, shows the "<< Back To Previously Selected Object" button that restores the previous selection. *(internal)* *(hook)* | 101 |
| `editor_dataBlockEditor.onEditorObjectSelectionChanged()` | Hook called when the object selection changes; forgets the previously selected object for the "Back" button. *(internal)* *(hook)* | 292 |
| `editor_dataBlockEditor.onExtensionLoaded()` | Hook called when the extension is loaded; writes "initialized" to the log. *(internal)* *(hook)* | 123 |

### Parameter details

#### `editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook called when a field is modified in the inspector; if the first selected object is a datablock, marks it as modified (editor.setDataBlockDirty).

- `selectedIds` (*integer[]*) : ids of the selected objects
- `fieldName` (*string*) : modified field
- `fieldValue` (*any*) : new value
- `arrayIndex` (*integer*) : index in the array field

#### `editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook called to draw the inspector header; if a datablock is selected after a call to openDatablockEditor, shows the "<< Back To Previously Selected Object" button that restores the previous selection.

- `inspectorInfo` (*table*) : inspector info (unused)

## Calls into the engine (C++)

- `Sim.` `getDataBlockSet`
- `obj:` `isSubClassOf`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dataBlockEditor.lua`.*
