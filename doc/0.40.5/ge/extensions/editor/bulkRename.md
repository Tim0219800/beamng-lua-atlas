# `editor_bulkRename`

*File: `lua/ge/extensions/editor/bulkRename.lua` · VM: Game Engine (GE) · 269 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_bulkRename`: `extensions.load("editor_bulkRename")`, then the global `editor_bulkRename`

"Bulk Rename" window (Assets menu) of the level editor: renames scene objects in bulk. You choose the field to rename (name or internalName), the set of objects (current selection, or objects whose name matches a pattern with * and ?), and a rename pattern where %n inserts a counter (%4n = 4 digits with zeros), and %o the old name. A preview table shows old name, new name, ID and collision ID; the rename goes through objectHistoryActions.changeObjectFieldMultipleValuesWithUndo (undoable).

## Example

```lua
-- rename pattern: "barrier_%3n" -> barrier_001, barrier_002, ...
```

## Notes

- Name collisions are detected only for the name field (internalName may be duplicated); the RENAME button is not blocked in case of collision.
- The search pattern is taken from the ImGui filter and passed to Sim.findObjectsByNameMask.
- After renaming, editor_sceneTree.recacheAllNodes() is called.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_bulkRename.onEditorActivated()` | Hook called when the editor is activated; empty function. *(internal)* *(hook)* | 245 |
| `editor_bulkRename.onEditorGui()` | Called every editor frame: draws the Bulk Rename window (options, patterns, RENAME button, preview table). *(internal)* *(hook)* | 139 |
| `editor_bulkRename.onEditorInitialized()` | Registers the "bulkRename" window (600x600) and the "Bulk Rename" menu entry (Assets group). *(internal)* *(hook)* | 256 |
| `editor_bulkRename.onEditorObjectSelectionChanged()` | Hook called when the editor object selection changes; recomputes the name preview. *(internal)* *(hook)* | 248 |
| `editor_bulkRename.onExtensionLoaded()` | Hook called when the extension is loaded; empty function. *(internal)* *(hook)* | 261 |

## Calls into the engine (C++)

- `Sim.` `findObjectsByNameMask`
- `obj:` `getGeneratedDisplayName`, `getID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/bulkRename.lua`.*
