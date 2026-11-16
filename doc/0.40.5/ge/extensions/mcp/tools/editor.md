# `mcp_tools_editor`

*File: `lua/ge/extensions/mcp/tools/editor.lua` · VM: Game Engine (GE) · 577 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_editor`: `extensions.load("mcp_tools_editor")`, then the global `mcp_tools_editor`

MCP tools for the World Editor: enable/disable, state, selection, undo/redo, edit modes, open/save a level, list classes, create objects and modify their transform, with undo history. Loads editor_main on demand.

## Notes

- Most tools require the editor to be active (set_editor_active active=true, asynchronous over a few frames; check with editor_status), otherwise they return an explicit error.
- editor_load_level then forces editor.active=false: the code explains that openLevel sets editor.active=true before the mission starts, which would make the F11 activation path be ignored; setting it back to false allows the full activation to run again.
- create_editor_object and set_editor_transform go through editor.history (undoable) and mark the editor "dirty"; create_editor_object selects the new object. Defaults: class TSStatic, shape no_mesh.dae, collisionType and decalType 'Collision Mesh', position 10 m in front of the camera, parent = selected parent or MissionGroup.
- Rotation of set_editor_transform: euler {x,y,z} in degrees or quaternion rot {x,y,z,w} (rot takes precedence); scale a uniform number or {x,y,z}. Only the components provided change.
- editor_save_level writes the level to disk; use with caution.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_editor.clear_editor_selection()` | Clears the selection. | 112 |
| `mcp_tools_editor.create_editor_object(args)` | Creates a scene object (worldEditorCppApi.createObject), configures fields, name, position, scale, yaw, adds it to the parent and records a CreateObject history action. | 293 |
| `mcp_tools_editor.delete_editor_selection()` | Deletes the selected objects (undoable). | 120 |
| `mcp_tools_editor.editor_load_level(args)` | Opens a level in the editor (editor.openLevel, loses unsaved changes, asynchronous). Appends a trailing '/' to a folder. | 205 |
| `mcp_tools_editor.editor_redo(args)` | Redoes history steps. | 141 |
| `mcp_tools_editor.editor_save_level()` | Saves the current level (editor.saveLevel). | 223 |
| `mcp_tools_editor.editor_status()` | Editor state: active, initialized, dirty, levelName, levelPath, editMode, selectionCount, undoCount, redoCount, headless. | 68 |
| `mcp_tools_editor.editor_undo(args)` | Undoes history steps. | 133 |
| `mcp_tools_editor.fit_view_to_selection()` | Frames the editor camera on the selection (fitViewToSelectionSmooth or fitViewToSelection). | 171 |
| `mcp_tools_editor.get_editor_selection()` | Currently selected objects. | 95 |
| `mcp_tools_editor.list_edit_modes()` | Lists the registered edit modes and the current mode. | 149 |
| `mcp_tools_editor.list_editor_classes(args)` | Lists (500 max, sorted) the classes derived from SimObject via Sim.getSimObjectDerivedClassNames. | 273 |
| `mcp_tools_editor.select_editor_objects(args)` | Selects objects by id, ids[] or name. | 103 |
| `mcp_tools_editor.set_edit_mode(args)` | Changes the edit mode by name (editor.selectEditMode). | 159 |
| `mcp_tools_editor.set_editor_active(args)` | Enables or disables the World Editor (editor.setEditorActive). | 86 |
| `mcp_tools_editor.set_editor_transform(args)` | Applies position/rotation/scale to objects in a single undoable history transaction. | 435 |

### Parameter details

#### `mcp_tools_editor.clear_editor_selection()`

Clears the selection.

- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_editor.create_editor_object(args)`

Creates a scene object (worldEditorCppApi.createObject), configures fields, name, position, scale, yaw, adds it to the parent and records a CreateObject history action.

- `args` (*table|nil*) : {class?|classname?: string, shape?|shapeName?: string, name?: string, pos?: {x,y,z}, scale?: number|{x,y,z}, yaw?: number°, parent?: string, parentId?: integer, fields?: table, field?: string, value?: any, index?: string, collisionType?: string, decalType?: string}
- **returns**: string JSON {id, name, class, parentId, shapeName?}.
- **returns**: boolean true on error.

#### `mcp_tools_editor.delete_editor_selection()`

Deletes the selected objects (undoable).

- **returns**: string Message.
- **returns**: boolean true if nothing is selected or on error.

#### `mcp_tools_editor.editor_load_level(args)`

Opens a level in the editor (editor.openLevel, loses unsaved changes, asynchronous). Appends a trailing '/' to a folder.

- `args` (*table*) : {name?: string, path?: string}
- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_editor.editor_redo(args)`

Redoes history steps.

- `args` (*table|nil*) : {steps?: integer (default 1)}
- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_editor.editor_save_level()`

Saves the current level (editor.saveLevel).

- **returns**: string "saved level: …".
- **returns**: boolean true if there is no level path.

#### `mcp_tools_editor.editor_status()`

Editor state: active, initialized, dirty, levelName, levelPath, editMode, selectionCount, undoCount, redoCount, headless.

- **returns**: string JSON.
- **returns**: boolean true if editor_main fails to load.

#### `mcp_tools_editor.editor_undo(args)`

Undoes history steps.

- `args` (*table|nil*) : {steps?: integer (default 1)}
- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_editor.fit_view_to_selection()`

Frames the editor camera on the selection (fitViewToSelectionSmooth or fitViewToSelection).

- **returns**: string Message.
- **returns**: boolean true if nothing is selected or on error.

#### `mcp_tools_editor.get_editor_selection()`

Currently selected objects.

- **returns**: string JSON {count, objects:[{id, name, class}]}.
- **returns**: boolean true on error.

#### `mcp_tools_editor.list_edit_modes()`

Lists the registered edit modes and the current mode.

- **returns**: string JSON {current, modes}.
- **returns**: boolean true on error.

#### `mcp_tools_editor.list_editor_classes(args)`

Lists (500 max, sorted) the classes derived from SimObject via Sim.getSimObjectDerivedClassNames.

- `args` (*table|nil*) : {pattern?: string} case-insensitive substring.
- **returns**: string JSON {count, classes}.
- **returns**: boolean true on error.

#### `mcp_tools_editor.select_editor_objects(args)`

Selects objects by id, ids[] or name.

- `args` (*table*) : {id?, ids?: integer[], name?: string, mode?: 'new'|'add'|'remove'|'toggle' (default new)}
- **returns**: string JSON {count, ids}.
- **returns**: boolean true on error.

#### `mcp_tools_editor.set_edit_mode(args)`

Changes the edit mode by name (editor.selectEditMode).

- `args` (*table*) : {name: string} (from list_edit_modes).
- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_editor.set_editor_active(args)`

Enables or disables the World Editor (editor.setEditorActive).

- `args` (*table*) : {active: boolean, safeMode?: boolean}
- **returns**: string "editor activating/deactivating".
- **returns**: boolean true on error.

#### `mcp_tools_editor.set_editor_transform(args)`

Applies position/rotation/scale to objects in a single undoable history transaction.

- `args` (*table*) : {items?: {id|name, pos?, euler?|rot?, scale?}[], id?, ids?, name?, pos?, euler?, rot?, rotation?, scale?}. Without a target, uses the selection.
- **returns**: string JSON {count, ids}.
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the editor tools. |

## Calls into the engine (C++)

- `Engine.` `getSystemTimeMS`
- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `getSimObjectDerivedClassNames`, `getUniqueName`, `upcast`
- `obj:` `delete`, `getClassName`, `getField`, `getID`, `getName`, `getPosition`, `getScale`, `getTransform`, `isSubClassOf`, `postApply`, `registerObject`, `serialize`, `setField`, `setPosition`, `setScale`, `setTransform`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

**Loads extensions:** `editor_main`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/editor.lua`.*
