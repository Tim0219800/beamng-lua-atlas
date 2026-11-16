# `editor_roadArchitect_overlays`

*File: `lua/ge/extensions/editor/roadArchitect/overlays.lua` · VM: Game Engine (GE) · 524 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_overlays`: `extensions.load("editor_roadArchitect_overlays")`, then the global `editor_roadArchitect_overlays`

Generation of the overlay roads of Road Architect junctions: fictitious trajectory lines crossing the junction, from an entry lane to an exit lane. Each function adds to the roads array a road marked isOverlay, isJctRoad and not drivable (isDrivable = false), with a profile created by profileMgr.createOverlayProfile, and adds its name to jct.roads. Lanes and exits are drawn at random with math.randomseed(jct.seed[0]), so the result is reproducible for the same seed. The number of overlays is jct.numCrossings[0]. Called by the Road Architect junction manager when finalizing a junction.

## Notes

- The jct parameter is the Road Architect junction table; the fields used are ImGui pointers (access with [0]): seed, numCrossings, laneWidthX, numLanesX (highways), numRBLanes (roundabout), isYOneWay, isY1Outwards, isY2Outwards (Y junction), plus jct.roads (names of the junction's roads, fixed indices depending on the type).
- The points are read from renderData[i][lane][7] of the junction's roads (lane center), so the roads' render data must already be computed.
- Crossroads, T, Y and roundabout randomly pick a start and end exit in a while loop; it only stops if the start road has at least one right lane and the end road at least one left lane. If no combination satisfies this condition, the loop may run forever.
- Each function ends with roadMgr.recomputeMap() to rebuild the name -> index table of the roads.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_overlays.addCrossroadsOverlays(jct)` | Adds jct.numCrossings[0] overlay roads to a 4-branch crossroads (roads jct.roads[5..8]): a trajectory between an exit lane of one branch and an entry lane of another, smoothed by chordal Catmull-Rom points. | 17 |
| `editor_roadArchitect_overlays.addHighwayMergeOverlays(jct)` | Adds overlay roads to a highway merge junction (roads jct.roads[1..3]): one trajectory per crossing that starts from a lane of road 1, passes onto road 2 (with a possible random one-lane change) then onto road 3. | 367 |
| `editor_roadArchitect_overlays.addHighwaySlipOverlays(jct)` | Adds overlay roads to a highway junction with slip roads (main roads jct.roads[1..4] and entry/exit slip roads jct.roads[5] and [6]). | 457 |
| `editor_roadArchitect_overlays.addHighwayTransOverlays(jct)` | Adds overlay roads to a highway-urban transition junction (roads jct.roads[1..3]), on the same principle as the highway merge. | 412 |
| `editor_roadArchitect_overlays.addRoundaboutOverlays(jct, cen)` | Adds overlay roads to a roundabout (branches jct.roads[5..8], ring jct.roads[9]): each trajectory goes through an arc of the ring, built by rotating the radius vector around the vertical axis in 45-degree steps (17 points) for each of the ring's jct.numRBLanes[0] lanes. | 265 |
| `editor_roadArchitect_overlays.addTJunctionOverlays(jct)` | Adds jct.numCrossings[0] overlay roads to a T junction (roads jct.roads[4..6]), with the same lane drawing and smoothing method as for a crossroads. | 121 |
| `editor_roadArchitect_overlays.addYJunctionOverlays(jct)` | Adds overlay roads to a Y junction. Handles one-way branches (jct.isYOneWay[0]) and their orientation (isY1Outwards, isY2Outwards) to reverse the point direction if needed. | 205 |

### Parameter details

#### `editor_roadArchitect_overlays.addCrossroadsOverlays(jct)`

Adds jct.numCrossings[0] overlay roads to a 4-branch crossroads (roads jct.roads[5..8]): a trajectory between an exit lane of one branch and an entry lane of another, smoothed by chordal Catmull-Rom points.

- `jct` (*table*) : Junction table (roads, seed, numCrossings, laneWidthX...).

#### `editor_roadArchitect_overlays.addHighwayMergeOverlays(jct)`

Adds overlay roads to a highway merge junction (roads jct.roads[1..3]): one trajectory per crossing that starts from a lane of road 1, passes onto road 2 (with a possible random one-lane change) then onto road 3.

- `jct` (*table*) : Junction table (numLanesX, laneWidthX, numCrossings, seed, roads).

#### `editor_roadArchitect_overlays.addHighwaySlipOverlays(jct)`

Adds overlay roads to a highway junction with slip roads (main roads jct.roads[1..4] and entry/exit slip roads jct.roads[5] and [6]).

- `jct` (*table*) : Slip road junction table.

#### `editor_roadArchitect_overlays.addHighwayTransOverlays(jct)`

Adds overlay roads to a highway-urban transition junction (roads jct.roads[1..3]), on the same principle as the highway merge.

- `jct` (*table*) : Transition junction table.

#### `editor_roadArchitect_overlays.addRoundaboutOverlays(jct, cen)`

Adds overlay roads to a roundabout (branches jct.roads[5..8], ring jct.roads[9]): each trajectory goes through an arc of the ring, built by rotating the radius vector around the vertical axis in 45-degree steps (17 points) for each of the ring's jct.numRBLanes[0] lanes.

- `jct` (*table*) : Roundabout junction table.
- `cen` (*vec3*) : Center of the roundabout.

#### `editor_roadArchitect_overlays.addTJunctionOverlays(jct)`

Adds jct.numCrossings[0] overlay roads to a T junction (roads jct.roads[4..6]), with the same lane drawing and smoothing method as for a crossroads.

- `jct` (*table*) : T junction table.

#### `editor_roadArchitect_overlays.addYJunctionOverlays(jct)`

Adds overlay roads to a Y junction. Handles one-way branches (jct.isYOneWay[0]) and their orientation (isY1Outwards, isY2Outwards) to reverse the point direction if needed.

- `jct` (*table*) : Y junction table.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/overlays.lua`.*
