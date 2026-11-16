# `editor_meshSpline`

*File: `lua/ge/extensions/editor/meshSpline.lua` · VM: Game Engine (GE) · 1924 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshSpline`: `extensions.load("editor_meshSpline")`, then the global `editor_meshSpline`

Mesh Spline tool of the world editor: you draw a spline (nodes, widths, normals) along which static meshes (TSStatic) are repeated, for example guardrails, barriers or lampposts. This file handles the tool window, mouse/keyboard input, spline rendering, import from existing TSStatic (polygon or scenetree context menu), terraforming, session saving and "baking" (locking the spline so its meshes are saved with the level). The splines' state lives in meshSpline/splineMgr.lua; the placement of the meshes in meshSpline/populate.lua.

## Notes

- The splines are transient: onClientEndMission deletes them all and onSerialize removes them from the scene after serialization (Lua reload).
- A locked spline (isEnabled = false) keeps its meshes in the scene: onSerialize calls pop.release to remember their ids, onDeserialized takes them back with pop.adopt.
- The meshSplineEditMode edit mode is created in onEditorInitialized; setLockedById and eachObjectById are also used by the Master Spline for its linked splines.
- Internal constants: spacing from -0.2 to 40 m, vertical offset from -100 to 100 m, random seed from 0 to 1000, default node width 10 m, RDP simplification tolerance 9.0.
- The selectedSplineIdx / selectedNodeIdx indices are 1-based.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshSpline.eachObjectById(id, fn)` | Calls fn(mesh, true) for each mesh the tool holds for the spline with the given id (the "each" of splineLock). Does nothing if the spline no longer exists. | 108 |
| `editor_meshSpline.onClientEndMission()` | Hook called when leaving the map: deletes all the mesh splines, including disabled ones. *(internal)* *(hook)* | 1907 |
| `editor_meshSpline.onDeserialized(data)` | Deserialization hook: recreates the splines, takes back the meshes of locked splines (pop.adopt), clamps the selected index and recomputes the id-to-index table. *(internal)* *(hook)* | 164 |
| `editor_meshSpline.onEditorGui()` | Hook called every frame by the world editor: applies the deferred import, rebuilds "dirty" splines even if the tool is inactive (for linked splines), then, if the tool is active, draws its window, handles mesh audition, the import polygon, mouse/keyboard events and rendering. Tool inactive: only draws the spline outlines. *(internal)* *(hook)* | 1782 |
| `editor_meshSpline.onEditorInitialized()` | World editor initialization hook: creates the meshSplineEditMode mode, registers the "meshSpline" window and the audition window, and adds the "Convert to Mesh Spline" entry to the scenetree context menu (valid if at least 2 TSStatic are selected). *(internal)* *(hook)* | 1886 |
| `editor_meshSpline.onSerialize()` | Extension serialization hook (before Lua reload): leaves the audition view, releases the meshes of locked splines, serializes each spline, then deletes all the splines. Returns an empty table if there are none. *(internal)* *(hook)* | 141 |
| `editor_meshSpline.setLockedById(id, isLocked)` | Locks or unlocks the mesh spline with the given id and rebuilds it immediately. Before locking, first rebuilds a "dirty" spline so that what is displayed gets locked. Does nothing if the id is unknown. Also used by the Master Spline for its linked children. | 98 |
| `editor_meshSpline.setSelectedNodeIdx(idx)` | Sets the index of the selected node (selection shared between tools). | 138 |
| `editor_meshSpline.setSelectedSplineIdx(idx)` | Sets the index of the selected spline (selection shared between tools). | 135 |

### Parameter details

#### `editor_meshSpline.eachObjectById(id, fn)`

Calls fn(mesh, true) for each mesh the tool holds for the spline with the given id (the "each" of splineLock). Does nothing if the spline no longer exists.

- `id` (*string*) : Identifier of the mesh spline.
- `fn` (*function*) : Callback called with the mesh and true.

#### `editor_meshSpline.onDeserialized(data)`

Deserialization hook: recreates the splines, takes back the meshes of locked splines (pop.adopt), clamps the selected index and recomputes the id-to-index table.

- `data` (*table|nil*) : Data returned by onSerialize.

#### `editor_meshSpline.onSerialize()`

Extension serialization hook (before Lua reload): leaves the audition view, releases the meshes of locked splines, serializes each spline, then deletes all the splines. Returns an empty table if there are none.

- **returns**: table List of the serialized splines.

#### `editor_meshSpline.setLockedById(id, isLocked)`

Locks or unlocks the mesh spline with the given id and rebuilds it immediately. Before locking, first rebuilds a "dirty" spline so that what is displayed gets locked. Does nothing if the id is unknown. Also used by the Master Spline for its linked children.

- `id` (*string*) : Identifier (UUID) of the mesh spline.
- `isLocked` (*boolean*) : true to lock (isEnabled = false), false to unlock.

#### `editor_meshSpline.setSelectedNodeIdx(idx)`

Sets the index of the selected node (selection shared between tools).

- `idx` (*integer*) : Node index, 1-based.

#### `editor_meshSpline.setSelectedSplineIdx(idx)`

Sets the index of the selected spline (selection shared between tools).

- `idx` (*integer*) : Spline index, 1-based.

## Calls into the engine (C++)

- `obj:` `getClassName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshSpline.lua`.*
