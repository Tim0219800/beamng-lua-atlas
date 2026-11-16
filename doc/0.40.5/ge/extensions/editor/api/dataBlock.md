# `editor_api_dataBlock`

*File: `lua/ge/extensions/editor/api/dataBlock.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_dataBlock`: `extensions.load("editor_api_dataBlock")`, then the global `editor_api_dataBlock`

Editor API for managing engine datablocks (shared data objects: sounds, particles, physical materials, etc.). initialize(editor) adds the creation, lookup, save and delete functions to the editor object; persistence goes through a PersistenceManager named dataBlockPersistMan. Default file: art/datablocks/managedDatablocks.json.

## Notes

- Bug: initialize assigns editor.addDataBlockToFile = addDataBlockToFile, but the local function is named addDatablockToFile (different casing). editor.addDataBlockToFile is therefore nil.
- createDataBlock returns the object ID (getID()), not the object.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_dataBlock.initialize(editorInstance)` | Creates the dataBlockPersistMan PersistenceManager if it does not exist and installs the functions on the editor object. *(internal)* | 99 |

### Parameter details

#### `editor_api_dataBlock.initialize(editorInstance)`

Creates the dataBlockPersistMan PersistenceManager if it does not exist and installs the functions on the editor object.

- `editorInstance` (*table*) : editor object

## Class `editor`

Functions added to the editor object by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.createDataBlock(name, type, copyFrom, filename)` | Creates a datablock of the given type, optionally copies the fields of an existing one, registers it, names it, adds it to the dataBlockGroup group and to the datablock set, then marks it as modified for the file. | 13 |
| `editor.findDataBlock(name)` | Looks up a datablock by name by iterating over the set. | 92 |
| `editor.getDataBlocks()` | Returns the set of all datablocks (Sim.getDataBlockSet()). | 86 |
| `editor.isDataBlockDirty(dataBlock)` | Returns whether the datablock has been modified. | 75 |
| `editor.removeDataBlockFromFile(dataBlock)` | Removes the datablock from the set and, if it has a file name, deletes it from its file. | 51 |
| `editor.saveDataBlockToFile(dataBlock, filename)` | Associates the datablock with a file (by default its current file) then saves it immediately. | 69 |
| `editor.saveDirtyDataBlock(dataBlock)` | Saves the datablock if it is modified. | 45 |
| `editor.setDataBlockDirty(dataBlock)` | Marks the datablock as modified (file = its file, otherwise the default file). | 81 |

## Calls into the engine (C++)

- `Sim.` `getDataBlockSet`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/dataBlock.lua`.*
