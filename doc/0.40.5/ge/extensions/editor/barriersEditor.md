# `editor_barriersEditor`

*File: `lua/ge/extensions/editor/barriersEditor.lua` · VM: Game Engine (GE) · 316 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_barriersEditor`: `extensions.load("editor_barriersEditor")`, then the global `editor_barriersEditor`

"Barriers Selector" window (Gameplay > Barriers Editor menu) to choose the barrier prefabs of a level. It searches /levels/<level>/ for .prefab files matching a pattern (default *barrier*), temporarily instantiates them to read the TSStatic positions, then displays them in two lists (unselected / selected) with debug spheres in the view. A "Barriers Selection" edit mode lets you click in the view (click = toggle, Shift = add only, Alt = remove only). Menu entries synchronize the selection with the race editor (editor_raceEditor, field path.prefabs).

## Notes

- Bug: in the Prefabs > "Load Selected Prefabs" menu, the variables filename and f are not defined in that scope (nil globals), so spawnPrefab receives nil arguments and the entry does not work properly.
- Bug: M.onExtensionLoaded = onExtensionLoaded references an undefined variable (nil): the exported field is therefore nil.
- In "Add Selection to Race Editor" and "Set Selection exactly", path.prefabs is read before the `if path` test (error if getCurrentPath returns nil).
- onSerialize and onDeserialized are empty functions.
- Prefabs are keyed by file path (prefabsIndex): a file that is already loaded is not reloaded until "Clear results" has been used.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_barriersEditor.onDeserialized(data)` | Empty function. *(internal)* *(hook)* | 303 |
| `editor_barriersEditor.onEditorGui()` | Called every editor frame: draws the window (Load / Race Editor menus, two prefab lists, > and < buttons) and the debug spheres of each prefab. *(internal)* *(hook)* | 77 |
| `editor_barriersEditor.onEditorInitialized()` | Registers the window (1500x700), the "Barriers Editor" menu entry (Gameplay group) and the "Barriers Selection" edit mode with its mouse shortcuts. *(internal)* *(hook)* | 286 |
| `editor_barriersEditor.onSerialize()` | Empty function (returns nothing). *(internal)* *(hook)* | 300 |
| `editor_barriersEditor.show()` | Deselects the editor objects and shows the "Barriers Selector" window. | 281 |

### Parameter details

#### `editor_barriersEditor.onDeserialized(data)`

Empty function.

- `data` (*any*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Is nil: reference to a local variable that is never defined. ⚠ reference `onExtensionLoaded` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `Sim.` `upcast`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `obj:` `getClassName`, `getPosition`, `getRotation`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/barriersEditor.lua`.*
