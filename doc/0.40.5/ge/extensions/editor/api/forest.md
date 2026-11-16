# `editor_api_forest`

*File: `lua/ge/extensions/editor/api/forest.lua` · VM: Game Engine (GE) · 118 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_forest`: `extensions.load("editor_api_forest")`, then the global `editor_api_forest`

Editor API for manipulating forest items (trees, rocks, etc. instanced via ForestData). initialize(editor) adds functions to editor to add, remove, update, rotate and select ForestItems. Functions that modify the forest set editor.forestDirty = true and call editor.setDirty().

## Notes

- updateForestItem and rotateForestSelection replace the item: the returned object must be used (updateItem returns a new item).
- rotateForestSelection only acts on editor.selection.forestItem; a single selection rotates around its own axis (or the world's depending on editor.getAxisGizmoAlignment()), several rotate around centerPoint.
- rotateForestSelection does not mark forestDirty itself.
- The comment of createForestItem says "from where to remove the item" for forestData (copy-paste); it is actually the forest where the item is created.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_forest.initialize(editorInstance)` | Installs this module's functions on the editor object. *(internal)* | 104 |

### Parameter details

#### `editor_api_forest.initialize(editorInstance)`

Installs this module's functions on the editor object.

- `editorInstance` (*table*) : editor object

## Class `editor`

Functions added to the editor object by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addForestItem(forestData, item)` | Adds an existing ForestItem to the forest. | 47 |
| `editor.createForestItem(forestData, itemData, transform, scale)` | Creates a new item using an existing item as a template, with a transform and a scale. | 68 |
| `editor.removeForestItem(forestData, item)` | Removes a ForestItem from the forest. | 56 |
| `editor.rotateForestSelection(forestData, deltaEulerRotation, centerPoint, originalTransforms)` | Applies a delta rotation to the selected forest items from their original transforms. | 16 |
| `editor.setForestItemCustomData(forestData, key, customData)` | Sets an item's opaque custom data. | 94 |
| `editor.setForestItemSelected(forestData, key, selected)` | Marks an item as selected or not (does not mark the forest as modified). | 100 |
| `editor.updateForestItem(forestData, key, keyPos, newData, newTrans, newScale, newUid)` | Updates an instance's information (data, transform, scale, uid). | 83 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/forest.lua`.*
