# `editor_meshSpline_populate`

*File: `lua/ge/extensions/editor/meshSpline/populate.lua` · VM: Game Engine (GE) · 508 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshSpline_populate`: `extensions.load("editor_meshSpline_populate")`, then the global `editor_meshSpline_populate`

Placement of static meshes along a mesh spline. From the spline geometry, it samples positions (period = mesh length + spacing, floor of 10% of the length or 0.1 m), picks the components (central mesh, caps, aliases), manages pools of TSStatic in the spline's scene folder, applies jitter, vertical offset and rotation, and synchronizes the locked state. A spline is "discrete" (lampposts, spacing > 5 m) or "tiled" (barriers end to end).

## Notes

- A negative spacing creates an overlap; the period is floored to max(0.1 m, 10% of the mesh length) to avoid an excessive number of instances.
- "Lock ends" (isFixedEnds) only applies to discrete splines (spacing > 5): an element is placed at both ends and the interior is distributed uniformly.
- The random seed is set per spline (splineRandomSeed): the placement is reproducible.
- A locked spline (isEnabled = false) whose meshes exist is no longer moved by the tool, only its lock state is applied.
- The module keeps the internal state (staticMeshes by spline id): release/adopt are used to survive a Lua reload without destroying the meshes.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshSpline_populate.adopt(spline, ids)` | Takes back the meshes released by release() (those still in the scene), as they are, and remembers the spline's lock state. *(internal)* | 464 |
| `editor_meshSpline_populate.eachObject(spline, fn)` | Calls fn(mesh, true) for each mesh the tool holds for this spline (the "each" of splineLock). | 252 |
| `editor_meshSpline_populate.evenFitInfo(spline)` | For the "Lock ends" label: returns the effective center-to-center spacing (m) and the number of intervals the uniform fit would produce, i.e. n = max(1, round(length / period)) and length / n. Returns nil if the computation is impossible (fewer than 2 points, no mesh length). | 487 |
| `editor_meshSpline_populate.isDiscreteSpline(spline)` | Tells whether the spline is "discrete" (elements placed on the sampling points, like lampposts) rather than tiled: true if spacing exceeds 5 m. The interface uses it to show the "Lock ends" option. | 480 |
| `editor_meshSpline_populate.minSpacingFor(spline)` | Floor of the "Spacing" slider for this piece: the value that reaches the minimum allowed period (maximum overlap). Below that, the period would be clamped anyway. | 65 |
| `editor_meshSpline_populate.populateMeshSpline(spline, splineIdx)` | Populates the spline with static mesh instances along its length: samples, distributes the components, adjusts the mesh pools then positions and orients each instance. Exits without doing anything if the spline is locked with its meshes, if the length or the central mesh path is missing, or if there are fewer than 2 subdivided points. | 294 |
| `editor_meshSpline_populate.release(spline)` | For a Lua reload: the tool lets go of the meshes of a locked spline without deleting them (they belong to the level) and returns their ids per component, for adopt(). *(internal)* | 449 |
| `editor_meshSpline_populate.tryRemove(spline)` | Removes the spline's static meshes from the scene (if they still exist) and forgets their state. | 429 |

### Parameter details

#### `editor_meshSpline_populate.adopt(spline, ids)`

Takes back the meshes released by release() (those still in the scene), as they are, and remembers the spline's lock state.

- `spline` (*table*) : Mesh spline.
- `ids` (*table<string, integer[]>*) : Table returned by release().

#### `editor_meshSpline_populate.eachObject(spline, fn)`

Calls fn(mesh, true) for each mesh the tool holds for this spline (the "each" of splineLock).

- `spline` (*table*) : Mesh spline.
- `fn` (*function*) : Callback called with the mesh and true.

#### `editor_meshSpline_populate.evenFitInfo(spline)`

For the "Lock ends" label: returns the effective center-to-center spacing (m) and the number of intervals the uniform fit would produce, i.e. n = max(1, round(length / period)) and length / n. Returns nil if the computation is impossible (fewer than 2 points, no mesh length).

- `spline` (*table|nil*) : Mesh spline.
- **returns**: number|nil Effective spacing in meters.
- **returns**: integer|nil Number of intervals.

#### `editor_meshSpline_populate.isDiscreteSpline(spline)`

Tells whether the spline is "discrete" (elements placed on the sampling points, like lampposts) rather than tiled: true if spacing exceeds 5 m. The interface uses it to show the "Lock ends" option.

- `spline` (*table|nil*) : Mesh spline.
- **returns**: boolean|nil true/false, or nil/false if the spline or its spacing is absent.

#### `editor_meshSpline_populate.minSpacingFor(spline)`

Floor of the "Spacing" slider for this piece: the value that reaches the minimum allowed period (maximum overlap). Below that, the period would be clamped anyway.

- `spline` (*table*) : Mesh spline with extentsL_Center / extentsW_Center and rot.
- **returns**: number|nil Minimum spacing in meters, nil if the mesh length is not yet measured.

#### `editor_meshSpline_populate.populateMeshSpline(spline, splineIdx)`

Populates the spline with static mesh instances along its length: samples, distributes the components, adjusts the mesh pools then positions and orients each instance. Exits without doing anything if the spline is locked with its meshes, if the length or the central mesh path is missing, or if there are fewer than 2 subdivided points.

- `spline` (*table*) : Mesh spline to populate.
- `splineIdx` (*integer*) : Index of the spline in the list (1-based).

#### `editor_meshSpline_populate.release(spline)`

For a Lua reload: the tool lets go of the meshes of a locked spline without deleting them (they belong to the level) and returns their ids per component, for adopt().

- `spline` (*table*) : Locked mesh spline.
- **returns**: table<string, integer[]> Mesh ids by component identifier.

#### `editor_meshSpline_populate.tryRemove(spline)`

Removes the spline's static meshes from the scene (if they still exist) and forgets their state.

- `spline` (*table*) : Mesh spline.

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshSpline/populate.lua`.*
