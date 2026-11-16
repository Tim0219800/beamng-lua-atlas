# `editor_assemblySpline_distribution`

*File: `lua/ge/extensions/editor/assemblySpline/distribution.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assemblySpline_distribution`: `extensions.load("editor_assemblySpline_distribution")`, then the global `editor_assemblySpline_distribution`

Computes, for the Assembly Spline tool, which mesh to place at each location along the spline for each rigid component and each bridge of the molecule. Each component is a group (base mesh + variations): if isRandom, each location draws a variation according to its normalized randomWeight weights; otherwise the enabled variations are alternated in round robin. Only considers components enabled for the spline (mol.getRigidEnabled / getBridgeEnabled).

## Notes

- The result arrays are preallocated and reused from one call to the next (indexed by mesh id): do not keep them after a new computeMeshMap call.
- Bridges get numPlacements - 1 locations (a bridge links two consecutive placements).
- A group with no enabled component yields a shared empty array (emptyTable): do not modify it.
- The draw uses math.random (non-deterministic unless the global seed is set elsewhere).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assemblySpline_distribution.computeMeshMap(molecule, numPlacements, spline)` | Computes the mesh maps for all rigid components and bridges of the molecule. | 114 |

### Parameter details

#### `editor_assemblySpline_distribution.computeMeshMap(molecule, numPlacements, spline)`

Computes the mesh maps for all rigid components and bridges of the molecule.

- `molecule` (*table*) : Molecule with the rigids and bridges lists (each entry: mesh, variations, isRandom, randomWeight).
- `numPlacements` (*integer*) : Number of locations along the spline.
- `spline` (*table*) : Assembly spline (for the enabled/disabled state of components).
- **returns**: table rigidMaps: for each rigid (same index as molecule.rigids), array of meshPath per location.
- **returns**: table bridgeMaps: same for bridges, over numPlacements - 1 locations.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assemblySpline/distribution.lua`.*
