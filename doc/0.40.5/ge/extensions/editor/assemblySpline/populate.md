# `editor_assemblySpline_populate`

*File: `lua/ge/extensions/editor/assemblySpline/populate.lua` · VM: Game Engine (GE) · 538 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assemblySpline_populate`: `extensions.load("editor_assemblySpline_populate")`, then the global `editor_assemblySpline_populate`

Places the TSStatic meshes of an assembly spline in the level: from the spline geometry (divPoints, tangents, normals), the molecule and the distribution map (distribution.computeMeshMap), it positions the rigids along the curve (spacing, vertical offset, sag, pre-rotation, jitter, random seed) and stretches/orients the bridges between two rigids. The meshes are stored in pools per spline and per mesh path for reuse, and are children of the spline's SimGroup. Also handles the locked state (splineLock): a locked spline whose meshes exist is not re-placed.

## Notes

- Constant: minSpacingBetweenMolecules = 3.0 m.
- release/adopt are used for Lua reload: a locked spline keeps its meshes in the scene; release returns their ids by mesh path and adopt takes them back.
- Bridges are scaled in X to cover the distance between rigids and in Z for the sag desired by the user.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assemblySpline_populate.adopt(spline, ids)` | Takes back as-is the meshes released by release (those still present in the scene) and remembers the lock state. | 516 |
| `editor_assemblySpline_populate.eachObject(spline, fn)` | Calls fn(mesh, true) for each mesh the tool holds for the spline (the "each" of splineLock). | 54 |
| `editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule)` | Updates the spline in the scene. If the spline is locked (isEnabled false) and its meshes exist, only applies the lock state without moving them; otherwise (re)places all meshes. | 490 |
| `editor_assemblySpline_populate.release(spline)` | Lua reload: the tool lets go of the meshes of a locked spline without deleting them (they are part of the level) and returns their ids by mesh path. | 500 |
| `editor_assemblySpline_populate.tryRemove(spline)` | Deletes all meshes of the spline (scene objects and pools) and forgets its applied lock state. | 460 |

### Parameter details

#### `editor_assemblySpline_populate.adopt(spline, ids)`

Takes back as-is the meshes released by release (those still present in the scene) and remembers the lock state.

- `spline` (*table*) : Assembly spline.
- `ids` (*table<string, integer[]>*) : Result of release.

#### `editor_assemblySpline_populate.eachObject(spline, fn)`

Calls fn(mesh, true) for each mesh the tool holds for the spline (the "each" of splineLock).

- `spline` (*table*) : Assembly spline.
- `fn` (*function*) : Callback fn(mesh, true).

#### `editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule)`

Updates the spline in the scene. If the spline is locked (isEnabled false) and its meshes exist, only applies the lock state without moving them; otherwise (re)places all meshes.

- `spline` (*table*) : Assembly spline.
- `splineIdx` (*integer*) : Spline index.
- `molecule` (*table*) : Molecule (spline.moleculeDescription).

#### `editor_assemblySpline_populate.release(spline)`

Lua reload: the tool lets go of the meshes of a locked spline without deleting them (they are part of the level) and returns their ids by mesh path.

- `spline` (*table*) : Assembly spline.
- **returns**: table<string, integer[]> Mesh ids by meshPath.

#### `editor_assemblySpline_populate.tryRemove(spline)`

Deletes all meshes of the spline (scene objects and pools) and forgets its applied lock state.

- `spline` (*table*) : Assembly spline.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `obj:` `delete`, `getField`, `registerObject`, `setField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assemblySpline/populate.lua`.*
