# `editor_meshSpline_populationEngine`

*File: `lua/ge/extensions/editor/meshSpline/populationEngine.lua` · VM: Game Engine (GE) · 102 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshSpline_populationEngine`: `extensions.load("editor_meshSpline_populationEngine")`, then the global `editor_meshSpline_populationEngine`

Small geometry engine used by the Mesh Spline tool: it computes the derived geometry of a spline (subdivided points, widths, tangents, normals) from its control nodes (Catmull-Rom, free, projected onto the terrain or by raycast), then samples positions along this curve to place meshes. Relies on editor/toolUtilities/geom and util. Called by splineMgr and populate, not by a modder directly.

## Notes

- The output tables (outPositions, outTangents, outNormals) are reused and modified in place to avoid allocations; they are cleared if the spline does not have at least 2 subdivided points.
- If spline.isConformToTerrain is true, the nodes are modified in z (terrain height + rayPostFloat, or vertical raycast).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshSpline_populationEngine.clearDerivedGeometry(spline)` | Clears the spline's derived tables: divPoints, divWidths, tangents, binormals, normals and discMap. | 10 |
| `editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross)` | Computes the local frame (position, tangent, up vector) of the interval between samples index and index+1 (geom.ribbonIntervalFrame). | 75 |
| `editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit)` | Samples the spline at regular intervals. With useEvenFit, spacing is a target: an element is locked at both ends and the interior is spaced as uniformly as possible (geom.sampleSplineEvenFit, accounts for isLoop). Otherwise walks at a fixed period (geom.sampleSpline). | 46 |
| `editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions)` | Recomputes the spline's derived geometry. With fewer than 2 nodes, clears the geometry and returns false. If isConformToTerrain: lowers the nodes onto the terrain (terrainOnly) or by vertical raycast, then uses catmullRomConformToTerrain / catmullRomRaycast; otherwise catmullRomFree. | 19 |

### Parameter details

#### `editor_meshSpline_populationEngine.clearDerivedGeometry(spline)`

Clears the spline's derived tables: divPoints, divWidths, tangents, binormals, normals and discMap.

- `spline` (*table*) : Mesh Spline tool spline.

#### `editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross)`

Computes the local frame (position, tangent, up vector) of the interval between samples index and index+1 (geom.ribbonIntervalFrame).

- `positions` (*table*) : Sampled positions.
- `tangents` (*table*) : Sampled tangents.
- `normals` (*table*) : Sampled normals.
- `index` (*integer*) : Start index of the interval (1-based).
- `outPosition` (*vec3*) : Receives the position (inferred from code).
- `outTangent` (*vec3*) : Receives the tangent (inferred from code).
- `outUp` (*vec3*) : Receives the up vector (inferred from code).
- `previousAcross` (*vec3|nil*) : Transverse vector of the previous interval, for continuity (inferred from code).
- **returns**: boolean false if positions[index] or positions[index+1] does not exist, otherwise true.

#### `editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit)`

Samples the spline at regular intervals. With useEvenFit, spacing is a target: an element is locked at both ends and the interior is spaced as uniformly as possible (geom.sampleSplineEvenFit, accounts for isLoop). Otherwise walks at a fixed period (geom.sampleSpline).

- `spline` (*table*) : Spline with divPoints, tangents, normals, isLoop.
- `spacing` (*number*) : Period in meters between two positions.
- `outPositions` (*table*) : Table filled with the positions.
- `outTangents` (*table*) : Table filled with the tangents.
- `outNormals` (*table*) : Table filled with the normals.
- `useEvenFit` (*boolean|nil*) : Enables end-locked sampling.
- **returns**: table outPositions.
- **returns**: table outTangents.
- **returns**: table outNormals.

#### `editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions)`

Recomputes the spline's derived geometry. With fewer than 2 nodes, clears the geometry and returns false. If isConformToTerrain: lowers the nodes onto the terrain (terrainOnly) or by vertical raycast, then uses catmullRomConformToTerrain / catmullRomRaycast; otherwise catmullRomFree.

- `spline` (*table*) : Spline with nodes, widths, nmls, isConformToTerrain, terrainOnly, rayPostFloat.
- `minimumDivisions` (*integer*) : Minimum number of subdivisions per segment (passed to geom).
- **returns**: boolean true if the spline has at least 2 subdivided points after computation.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshSpline/populationEngine.lua`.*
