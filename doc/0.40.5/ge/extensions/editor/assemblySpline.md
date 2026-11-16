# `editor_assemblySpline`

*File: `lua/ge/extensions/editor/assemblySpline.lua` · VM: Game Engine (GE) · 1787 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assemblySpline`: `extensions.load("editor_assemblySpline")`, then the global `editor_assemblySpline`

"Assembly Spline" tool of the world editor: you draw a spline and the tool automatically places TSStatic meshes from an "assembly kit" (folder assets/meshes/props/assembly_kit/) along it, e.g. fences or rails whose elements connect through 'nail.*' anchors. It registers as an edit mode (gyroscope icon), has an ImGui window 'assemblySpline', handles serialization of splines in the editor session, import from existing TSStatics (scene tree right-click menu "Convert to Assembly Spline" or selection polygon), locking/baking and terraforming. The logic is split between splineMgr, molecule, populate, distribution and import.

## Notes

- Constants at the top of the file: kitSearchPath, simplifyRdpTol = 9.0, defaultSplineWidth = 10 m, slider bounds (spacing 0..100, vertical offset -100..100, sag 0..100, random seed max 1000).
- Even when the tool is not active, onEditorGui updates dirty splines (for linked splines) and draws their hulls.
- onClientEndMission deletes all splines (even disabled ones) to avoid invalid TSStatic pointers after reload.
- A locked spline (isEnabled = false) keeps its meshes in the scene: onSerialize releases them (pop.release) and onDeserialized re-adopts them (pop.adopt).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assemblySpline.eachObjectById(id, fn)` | Calls fn on each scene object of the spline with the given id (delegates to pop.eachObject). Nothing if the spline no longer exists. | 109 |
| `editor_assemblySpline.onClientEndMission()` | Hook called when leaving the map: deletes all assembly splines. *(internal)* *(hook)* | 1768 |
| `editor_assemblySpline.onDeserialized(data)` | Hook called after reload with the onSerialize data: recreates the splines, re-adopts the kept objects, rebuilds the id->index table, the mesh kits and the molecules. *(internal)* *(hook)* | 161 |
| `editor_assemblySpline.onEditorGui()` | Hook called every frame by the editor: handles deferred import updates, updates dirty splines, displays the tool window, selection polygon drawing, mouse/keyboard input on nodes and the debugDraw rendering of the splines. *(internal)* *(hook)* | 1646 |
| `editor_assemblySpline.onEditorInitialized()` | Hook called at editor initialization: creates the assemblySplineEditMode edit mode, registers the window and adds the "Convert to Assembly Spline" menu entry to the scene tree (valid if at least 2 compatible TSStatics are selected). *(internal)* *(hook)* | 1748 |
| `editor_assemblySpline.onSerialize()` | Extension serialization hook (before Lua reload): serializes all splines then removes them from the scene. *(internal)* *(hook)* | 142 |
| `editor_assemblySpline.setLockedById(id, isLocked)` | Locks or unlocks the assembly spline with the given id and rebuilds it immediately (also used by the Master Spline for its linked children, and by baking). Locking first forces the update of a dirty spline. Does nothing if the id is not found. | 99 |
| `editor_assemblySpline.setSelectedNodeIdx(idx)` | Sets the index of the selected node (selection shared between tools). | 139 |
| `editor_assemblySpline.setSelectedSplineIdx(idx)` | Sets the index of the selected spline (selection shared between tools). | 136 |

### Parameter details

#### `editor_assemblySpline.eachObjectById(id, fn)`

Calls fn on each scene object of the spline with the given id (delegates to pop.eachObject). Nothing if the spline no longer exists.

- `id` (*integer*) : Spline id.
- `fn` (*function*) : Callback applied to each object.

#### `editor_assemblySpline.onDeserialized(data)`

Hook called after reload with the onSerialize data: recreates the splines, re-adopts the kept objects, rebuilds the id->index table, the mesh kits and the molecules.

- `data` (*table|nil*) : Serialized splines.

#### `editor_assemblySpline.onSerialize()`

Extension serialization hook (before Lua reload): serializes all splines then removes them from the scene.

- **returns**: table Array of serialized splines.

#### `editor_assemblySpline.setLockedById(id, isLocked)`

Locks or unlocks the assembly spline with the given id and rebuilds it immediately (also used by the Master Spline for its linked children, and by baking). Locking first forces the update of a dirty spline. Does nothing if the id is not found.

- `id` (*integer*) : Spline id.
- `isLocked` (*boolean*) : true to lock (isEnabled = false).

#### `editor_assemblySpline.setSelectedNodeIdx(idx)`

Sets the index of the selected node (selection shared between tools).

- `idx` (*integer*) : Index (1-based).

#### `editor_assemblySpline.setSelectedSplineIdx(idx)`

Sets the index of the selected spline (selection shared between tools).

- `idx` (*integer*) : Index (1-based).

## Calls into the engine (C++)

- `obj:` `getClassName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assemblySpline.lua`.*
