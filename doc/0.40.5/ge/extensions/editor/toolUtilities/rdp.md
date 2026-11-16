# `editor_toolUtilities_rdp`

*File: `lua/ge/extensions/editor/toolUtilities/rdp.lua` · VM: Game Engine (GE) · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_rdp`: `extensions.load("editor_toolUtilities_rdp")`, then the global `editor_toolUtilities_rdp`

Optimized implementation of the Ramer-Douglas-Peucker (RDP) algorithm to simplify polylines with too many points. Uses the distance to the segment (not to the infinite line), an explicit stack instead of recursion and reused tables. The simplifyNodes* variants compact the arrays in place, including parallel arrays (widths, normals, velocities, speed limits).

## Example

```lua
local rdp = extensions.editor_toolUtilities_rdp
local n = rdp.simplifyNodes(nodes, 2.0) -- nodes: list of vec3, modified in place
-- n = number of points kept
```

## Notes

- The nodes must be vec3 (or objects with the squaredDistanceToLineSegment method).
- The first and last points are always kept.
- Default tolerance 6.0 (world units, meters) when tol is nil.
- With 2 points or fewer, the simplify* functions return #nodes without modifying anything.
- The index tables and the stack are shared at module level: not reentrant, and the table returned by rdpIndices is overwritten if retListP is not passed.
- The parallel arrays (widths, normals...) must be at least as long as nodes.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP)` | Computes the indices to keep by RDP between startIdx and endIdx. The output table is emptied then filled; the order is not strictly increasing because of the stack, but the first index is startIdx. | 24 |
| `editor_toolUtilities_rdp.simplifyNodes(nodes, tol)` | Simplifies nodes in place and removes the excess points. | 69 |
| `editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol)` | Like simplifyNodes, keeping velocities aligned with nodes. | 140 |
| `editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol)` | Like simplifyNodes, keeping the widths array aligned with nodes. | 92 |
| `editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol)` | Like simplifyNodes, keeping widths and normals aligned with nodes. | 116 |
| `editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol)` | Like simplifyNodes, keeping widths, velocities and velLimits aligned with nodes. | 164 |

### Parameter details

#### `editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP)`

Computes the indices to keep by RDP between startIdx and endIdx. The output table is emptied then filled; the order is not strictly increasing because of the stack, but the first index is startIdx.

- `nodes` (*table*) : List of vec3.
- `startIdx` (*integer*) : Start index (1 for the whole path).
- `endIdx` (*integer*) : End index.
- `tol` (*number*) : Maximum tolerated distance to the segment.
- `retListP` (*table|nil*) : Reusable output table; created if nil.
- **returns**: table List of kept indices.

#### `editor_toolUtilities_rdp.simplifyNodes(nodes, tol)`

Simplifies nodes in place and removes the excess points.

- `nodes` (*table*) : List of vec3, modified.
- `tol` (*number|nil*) : Tolerance (default 6.0).
- **returns**: integer Number of remaining points.

#### `editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol)`

Like simplifyNodes, keeping velocities aligned with nodes.

- `nodes` (*table*) : Points.
- `velocities` (*table*) : Associated velocities.
- `tol` (*number|nil*) : Tolerance (default 6.0).
- **returns**: integer Number of remaining points.

#### `editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol)`

Like simplifyNodes, keeping the widths array aligned with nodes.

- `nodes` (*table*) : Points, modified in place.
- `widths` (*table*) : Associated widths, modified in place.
- `tol` (*number|nil*) : Tolerance (default 6.0).
- **returns**: integer Number of remaining points.

#### `editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol)`

Like simplifyNodes, keeping widths and normals aligned with nodes.

- `nodes` (*table*) : Points.
- `widths` (*table*) : Widths.
- `normals` (*table*) : Normals.
- `tol` (*number|nil*) : Tolerance (default 6.0).
- **returns**: integer Number of remaining points.

#### `editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol)`

Like simplifyNodes, keeping widths, velocities and velLimits aligned with nodes.

- `nodes` (*table*) : Points.
- `widths` (*table*) : Widths.
- `velocities` (*table*) : Speeds.
- `velLimits` (*table*) : Speed limits.
- `tol` (*number|nil*) : Tolerance (default 6.0).
- **returns**: integer Number of remaining points.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/rdp.lua`.*
