# `editor_heroRoadEditor_meshRefine`

*File: `lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua` · VM: Game Engine (GE) · 171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_meshRefine`: `extensions.load("editor_heroRoadEditor_meshRefine")`, then the global `editor_heroRoadEditor_meshRefine`

Mesh decimation for the Hero Road Editor, using the Ramer-Douglas-Peucker (RDP) algorithm. decimateStations reduces the number of stations (transverse slices) along the road; decimateCols reduces the number of columns (lateral points of a cross-section). Used by mesh.lua to build the levels of detail (LOD) and the collision mesh.

## Notes

- Both functions return sorted (1-based) indices of the kept elements, never the points themselves.
- Tolerances are in meters.
- colMaxDev and splitDev are module-level local functions (not exported) so that LuaJIT can compile them.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m)` | Lateral decimation of the columns. Forces keeping column 1, the last one and any boundary between bands of different materials, then applies RDP to the interior columns with the MAXIMUM (o, dz) deviation over all stations: a column stays if the profile bends at any station (for example a crown that appears gradually keeps its apex columns). | 129 |
| `editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM)` | Multi-channel RDP over stations 1..m: a station is kept if the centerline, the left edge (column 1) or the right edge (column numCols) deviates by more than the tolerance from the chord. Always keeps stations 1 and m and those in mustKeep. With tolZM, tolM only bounds the in-plane deviation and tolZM the vertical deviation (a plan chord only shifts an edge, a vertical chord creates a bump). A maxSegM cap reinserts original stations to cut overly long segments into roughly equal sub-segments (at best down to the original spacing). | 49 |

### Parameter details

#### `editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m)`

Lateral decimation of the columns. Forces keeping column 1, the last one and any boundary between bands of different materials, then applies RDP to the interior columns with the MAXIMUM (o, dz) deviation over all stations: a column stays if the profile bends at any station (for example a crown that appears gradually keeps its apex columns).

- `ptsA` (*table*) : ptsA[s] = cross-section of station s, an array of {o, dz} per column (lateral offset, vertical deviation).
- `bandMat` (*table*) : One material per band (between columns c and c+1).
- `tolM` (*number*) : Tolerance in meters.
- `m` (*integer*) : Number of stations.
- **returns**: integer[] Sorted indices of the kept columns.

#### `editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM)`

Multi-channel RDP over stations 1..m: a station is kept if the centerline, the left edge (column 1) or the right edge (column numCols) deviates by more than the tolerance from the chord. Always keeps stations 1 and m and those in mustKeep. With tolZM, tolM only bounds the in-plane deviation and tolZM the vertical deviation (a plan chord only shifts an edge, a vertical chord creates a bump). A maxSegM cap reinserts original stations to cut overly long segments into roughly equal sub-segments (at best down to the original spacing).

- `centres` (*table*) : Centerline points per station (x, y, z).
- `W` (*table*) : Grid of world points W[station][column]; only columns 1 and numCols are read.
- `numCols` (*integer*) : Number of columns in the grid.
- `tolM` (*number*) : Tolerance in meters (in-plane only if tolZM is provided, otherwise 3D deviation).
- `m` (*integer*) : Number of stations.
- `maxSegM` (*number|nil*) : Maximum arc length between two kept stations, in meters; nil or 0 to disable.
- `mustKeep` (*table<integer, boolean>|nil*) : Set of station indices that must be kept.
- `tolZM` (*number|nil*) : Vertical tolerance in meters; enables the two-tolerance mode.
- **returns**: integer[] Sorted indices of the kept stations.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua`.*
