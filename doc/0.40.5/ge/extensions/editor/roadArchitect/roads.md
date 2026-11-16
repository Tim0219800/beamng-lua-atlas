# `editor_roadArchitect_roads`

*File: `lua/ge/extensions/editor/roadArchitect/roads.lua` · VM: Game Engine (GE) · 1645 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_roads`: `extensions.load("editor_roadArchitect_roads")`, then the global `editor_roadArchitect_roads`

Central container of Road Architect: it stores the list of the session's roads (each road = nodes, lateral profile, display options, bridge, tunnels) and provides all the editing operations (adding/removing nodes, moving, height, lateral rotation, cutting, flipping, copying, serialization). It also handles the transition between the "edit" and "finalised" states (creation of procedural meshes, static meshes, tunnels and decals). A modder uses it to create or manipulate roads by script from the editor; the Road Architect modules (geometry, profiles, decals, roadMesh...) read its tables.

## Example

```lua
local roads = extensions.editor_roadArchitect_roads
local idx = #roads.roads + 1
roads.roads[idx] = roads.createRoadFromTemplate('Two Lane')  -- profile template name (example)
roads.map[roads.roads[idx].name] = idx
roads.addNodeToRoad(idx, vec3(0, 0, 0))
roads.addNodeToRoad(idx, vec3(50, 0, 0))
roads.updateRoads()
```

## Notes

- A road is a table (fields: name, displayName (im.ArrayChar), nodes, profile, isVis/isDirty..., renderData, tunnels, groupIdx). Many parameters are ImGui pointers (im.BoolPtr, im.FloatPtr, im.IntPtr): read/write with [0].
- A node = {p (vec3), isLocked, rot (FloatPtr, degrees), widths/heightsL/heightsR (FloatPtr tables keyed by lane key, -20..20), incircleRad, isAutoBanked, offset}.
- Internal limits: node height bounded to ±1000 m, lateral rotation bounded to ±50 degrees, local width (setLocalWidth) bounded to [0.5, 10] m per lane.
- createRoadFromProfile/createRoadFromTemplate only return the road table: they do NOT add it to roads.roads or roads.map (see convertDecalRoads2RoadArchitect for manual addition).
- Modified roads are marked isDirty via setDirty; updateRoads() then recomputes their renderData (roads with fewer than 2 nodes are ignored).
- A road named 'temp' (isHidden = true) is used to preview profiles (manageTempRoadSection).
- BUG/inconsistency: M.isAuditionProfileDirty is a boolean copy frozen at load time (the real flag is a local variable); reading this field does not give the current state.
- BUG probable: reparameteriseDecalRoad (internal) uses `while isError or iter > maxIter` (the bound is inverted) and builds its width points with pp1.x/pp1.y for all points.
- BUG probable: updateBridgeParameters does im.FloatPtr(road.bridgeWidth) whereas bridgeWidth is already a FloatPtr ([0] would be needed).
- convertDecalRoads2RoadArchitect: the comment says the original DecalRoads are deleted, but the sel:delete() call is commented out in the code; the function therefore does not delete them. Moreover it does not add it to roadMap via recomputeMap.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie)` | Adds a node between the selected node and its neighbor (midpoint, averaged values). At the ends of the road, copies the node and places it 3 m further along the road axis. | 404 |
| `editor_roadArchitect_roads.addNodeToRoad(rIdx, pos)` | Adds a node at the end of the road, with the per-lane widths/heights from the profile. Marks the road dirty. | 191 |
| `editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx)` | Inserts a node at the given index of the road. Marks the road dirty. | 210 |
| `editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx)` | Changes the height of a node (bounded to ±1000 m) and propagates the change to the other nodes (rigid or force field). Marks dirty. | 555 |
| `editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx)` | Changes the lateral rotation (banking) of a node and propagates it to the others (bounded to ±50 degrees). No effect if the profile is in auto-banking. | 602 |
| `editor_roadArchitect_roads.clearAllRoads()` | Deletes all roads that are not junction roads (isJctRoad). | 452 |
| `editor_roadArchitect_roads.clearBridges()` | Empties the bridges table of the roadMesh module (without deleting the scene objects). | 910 |
| `editor_roadArchitect_roads.computeAABB2D(rIdx)` | 2D bounding box of a road's nodes. Returns nil for a bridge or an overlay. (The comment says the profile width is included, but the code only takes the nodes into account.) | 314 |
| `editor_roadArchitect_roads.computeAllRoadRenderData()` | Recomputes the renderData of all roads with 2 or more nodes (via geometry). | 1115 |
| `editor_roadArchitect_roads.computeRoadAABB_2D(r)` | Computes the axis-aligned 2D bounding box of a road's nodes (used only by the acceleration tree). | 137 |
| `editor_roadArchitect_roads.computeRoadRenderDataSingle(i)` | Recomputes the renderData of a single road. | 1126 |
| `editor_roadArchitect_roads.convertDecalRoads2RoadArchitect()` | For each DecalRoad selected in the editor, creates a Road Architect road (re-parameterized nodes, profile according to lanesLeft/lanesRight) and adds it to roads. See notes: the DecalRoads are not deleted. | 1213 |
| `editor_roadArchitect_roads.copyNode(n)` | Deep copy of a node (new ImGui pointers and new vec3). | 285 |
| `editor_roadArchitect_roads.copyRoad(r)` | Deep copy of a road (nodes, profile, options, bridge/tunnel parameters). The name is kept identical, renderData is emptied, tunnels is empty and isDirty = true. | 663 |
| `editor_roadArchitect_roads.createMultiSelect(gPolygon)` | Fills roads.multi with all the nodes of all roads located inside the polygon (in 2D). | 1075 |
| `editor_roadArchitect_roads.createRoadFromProfile(profile)` | Builds a new road table from a lateral profile (updates the profile's lane flags, computes the lane keys). The road has no nodes and is not added to the list. | 61 |
| `editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName)` | Like createRoadFromProfile, but the profile is created from the name of a profile template (with an identifier generated by Engine.generateUUID()). | 129 |
| `editor_roadArchitect_roads.deserialiseRoad(rSer)` | Rebuilds a road (with ImGui pointers, isDirty = true) from a table serialized by serialiseRoad. | 1505 |
| `editor_roadArchitect_roads.finalise()` | Switches to the "finalised" state: recomputes all renderData, creates a scene folder per road ("Road Architect - Road <i>"), generates the bridge meshes then road meshes, the static meshes and the tunnels, reloads the collision (be:reloadCollision), places the decals then reloads the navgraph (map.reset()). | 1270 |
| `editor_roadArchitect_roads.flipRoad(rIdx)` | Reverses the direction of the road (node order) and immediately recomputes its renderData. Useful for fixing imports. | 873 |
| `editor_roadArchitect_roads.getCurrentMap()` | Returns the name/identifier of the map (level) currently stored by the module. | 55 |
| `editor_roadArchitect_roads.getMultiSelectionCentroid()` | Center of the 3D bounding box of the multi-selection nodes. | 1100 |
| `editor_roadArchitect_roads.getRoadsFromGroup(group)` | Returns the roads (without duplicates) belonging to a placed group; if group is nil, returns all the session's roads. | 330 |
| `editor_roadArchitect_roads.getTree()` | Returns the 2D quadtree used for display culling while editing (nil if it does not exist yet). | 182 |
| `editor_roadArchitect_roads.goToRoad(rIdx)` | Places the free camera directly above the center of the road, at a height that frames the whole road (according to the field of view). Does nothing if the road is too small (less than 0.1 m extent). | 478 |
| `editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos)` | Tests whether the mouse position is close (2D tolerance 3.5 m) to a segment of the road, between two nodes, to offer node insertion. | 230 |
| `editor_roadArchitect_roads.manageTempRoadSection(pIdx)` | Creates or updates the temporary road 'temp' (20 m straight segment at 1000 m altitude) that shows the profile being edited, places the free camera on it and makes it rotate around. Called every frame during the audition. | 959 |
| `editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast)` | Translates a road: either rigidly (all unlocked nodes), or as a force field (the central node follows the mouse, the others move proportionally to the distance, up to the first locked node). Marks the road dirty. | 515 |
| `editor_roadArchitect_roads.offsetByValue(offset)` | Adds a vertical offset to all nodes of all roads and marks them dirty. | 1257 |
| `editor_roadArchitect_roads.offsetRoads2Terrain()` | Enables isConformRoadToTerrain on all roads (they sit on the terrain) and marks them dirty. | 1249 |
| `editor_roadArchitect_roads.recomputeMap()` | Rebuilds the name -> index table (roads.map). To be called after any manual insertion/removal in roads. | 353 |
| `editor_roadArchitect_roads.removeAll()` | Deletes all decals, road meshes, statics, bridges and tunnels, then empties roads and the map. | 913 |
| `editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx)` | Removes a placed group index from the road's groupIdx list. | 1129 |
| `editor_roadArchitect_roads.removeHiddenRoads()` | Removes from roads all hidden roads (isHidden) and their meshes, then recomputes the map. | 462 |
| `editor_roadArchitect_roads.removeNode(rIdx, nIdx)` | Removes a node from a road (table.remove). Does not mark the road dirty. | 385 |
| `editor_roadArchitect_roads.removeRoad(roadName)` | Deletes a road by its name: removes decals, road and static meshes, quadtree entry, possible bridge folder, then the entry in roads and rebuilds the map. | 362 |
| `editor_roadArchitect_roads.removeTree()` | Forgets the quadtree (it will be recreated on the next setDirty). | 185 |
| `editor_roadArchitect_roads.serialiseRoad(r)` | Converts a road to a plain table (plain values, without ImGui pointers) for JSON saving. | 1446 |
| `editor_roadArchitect_roads.setAllDirty()` | Calls setDirty on all roads. | 175 |
| `editor_roadArchitect_roads.setAuditionProfileDirty()` | Requests the rebuild of the temporary profile audition road on the next call of manageTempRoadSection. | 188 |
| `editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow)` | Shows or hides all bridges. | 1426 |
| `editor_roadArchitect_roads.setCurrentMap(cMap)` | Stores the map (level) currently loaded. | 58 |
| `editor_roadArchitect_roads.setDirty(r)` | Marks the road as needing recomputation (isDirty), updates the profile condition and reinserts the road into the editing quadtree (created on demand with the terrain extent, or 5000 m by default). | 149 |
| `editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset)` | Changes the width of all 'road_lane' type lanes of a node: new width = starting width + offset, bounded to [0.5, 10]. | 260 |
| `editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow)` | Shows or hides all overlays. | 1436 |
| `editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow)` | Shows or hides all ordinary roads (neither bridges nor overlays) by overwriting their isVis. | 1416 |
| `editor_roadArchitect_roads.splitRoad(rIdx, nIdx)` | Cuts a road at the given node into two new roads ([A] and [B], each with a copy of the cut node pushed back by 1 m), deletes the old road and adds them to roads. Useful for creating junctions. | 737 |
| `editor_roadArchitect_roads.unfinalise()` | Leaves the "finalised" state: removes the decals, meshes, statics and tunnels generated by finalise and goes back to editing. | 1334 |
| `editor_roadArchitect_roads.updateBridgeParameters(road)` | Applies the road's bridge width and depth to the first two nodes (lanes -1 and 1). See notes: probable pointer bug. | 1054 |
| `editor_roadArchitect_roads.updateMultiAfterRemove()` | Removes from roads.multi the entries whose road or node no longer exists. | 1202 |
| `editor_roadArchitect_roads.updateRoads()` | Recomputes the renderData of each dirty road having at least 2 nodes; for bridges, also updates the bridge mesh in the scene folder "Road Architect - Bridge <name>". To be called every editing frame. | 889 |
| `editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups)` | Rebuilds the groupIdx of all roads from the list of remaining placed groups (renumbering after a group is deleted). | 1188 |
| `editor_roadArchitect_roads.updateWAndHToNewProfile(road)` | Resets the per-lane widths and heights of all the road's nodes according to its current profile (after a profile change). | 304 |

### Parameter details

#### `editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie)`

Adds a node between the selected node and its neighbor (midpoint, averaged values). At the ends of the road, copies the node and places it 3 m further along the road axis.

- `rIdx` (*integer*) : Index of the road.
- `nIdx` (*integer*) : Index of the selected node.
- `lie` (*string*) : 'above' (with the previous node) or 'below' (with the next node).

#### `editor_roadArchitect_roads.addNodeToRoad(rIdx, pos)`

Adds a node at the end of the road, with the per-lane widths/heights from the profile. Marks the road dirty.

- `rIdx` (*integer*) : Index of the road in roads.
- `pos` (*vec3*) : World position of the node.

#### `editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx)`

Inserts a node at the given index of the road. Marks the road dirty.

- `rIdx` (*integer*) : Index of the road.
- `pos` (*vec3*) : World position.
- `idx` (*integer*) : Insertion index in route.nodes (table.insert).

#### `editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx)`

Changes the height of a node (bounded to ±1000 m) and propagates the change to the other nodes (rigid or force field). Marks dirty.

- `hNew` (*number*) : New height of the central node, in meters.
- `hOld` (*number*) : Old height (used to compute the change dz).
- `nIdx` (*integer*) : Index of the central node.
- `rIdx` (*integer*) : Index of the road.

#### `editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx)`

Changes the lateral rotation (banking) of a node and propagates it to the others (bounded to ±50 degrees). No effect if the profile is in auto-banking.

- `rotNew` (*number*) : New rotation of the central node, in degrees.
- `rotOld` (*number*) : Old rotation.
- `nIdx` (*integer*) : Index of the central node.
- `rIdx` (*integer*) : Index of the road.

#### `editor_roadArchitect_roads.computeAABB2D(rIdx)`

2D bounding box of a road's nodes. Returns nil for a bridge or an overlay. (The comment says the profile width is included, but the code only takes the nodes into account.)

- `rIdx` (*integer*) : Index of the road.
- **returns**: table|nil {xMin, xMax, yMin, yMax} or nil.

#### `editor_roadArchitect_roads.computeRoadAABB_2D(r)`

Computes the axis-aligned 2D bounding box of a road's nodes (used only by the acceleration tree).

- `r` (*table*) : Road.
- **returns**: number xMin
- **returns**: number xMax
- **returns**: number yMin
- **returns**: number yMax

#### `editor_roadArchitect_roads.computeRoadRenderDataSingle(i)`

Recomputes the renderData of a single road.

- `i` (*integer*) : Index of the road.

#### `editor_roadArchitect_roads.copyNode(n)`

Deep copy of a node (new ImGui pointers and new vec3).

- `n` (*table*) : Node.
- **returns**: table Copy of the node.

#### `editor_roadArchitect_roads.copyRoad(r)`

Deep copy of a road (nodes, profile, options, bridge/tunnel parameters). The name is kept identical, renderData is emptied, tunnels is empty and isDirty = true.

- `r` (*table*) : Road.
- **returns**: table Copy of the road.

#### `editor_roadArchitect_roads.createMultiSelect(gPolygon)`

Fills roads.multi with all the nodes of all roads located inside the polygon (in 2D).

- `gPolygon` (*table<integer, vec3>*) : Vertices of the selection polygon.

#### `editor_roadArchitect_roads.createRoadFromProfile(profile)`

Builds a new road table from a lateral profile (updates the profile's lane flags, computes the lane keys). The road has no nodes and is not added to the list.

- `profile` (*table*) : Lateral profile (see editor/roadArchitect/profiles).
- **returns**: table The created road (default values: visible, 15 radial tunnel divisions, bridge half-width 5.5, depth 4, arch -6, etc.).

#### `editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName)`

Like createRoadFromProfile, but the profile is created from the name of a profile template (with an identifier generated by Engine.generateUUID()).

- `profileTemplateName` (*string*) : Profile template name.
- **returns**: table The created road.

#### `editor_roadArchitect_roads.deserialiseRoad(rSer)`

Rebuilds a road (with ImGui pointers, isDirty = true) from a table serialized by serialiseRoad.

- `rSer` (*table*) : Serialized road.
- **returns**: table Road usable in roads.

#### `editor_roadArchitect_roads.flipRoad(rIdx)`

Reverses the direction of the road (node order) and immediately recomputes its renderData. Useful for fixing imports.

- `rIdx` (*integer*) : Index of the road.

#### `editor_roadArchitect_roads.getCurrentMap()`

Returns the name/identifier of the map (level) currently stored by the module.

- **returns**: any Value stored by setCurrentMap (nil at start).

#### `editor_roadArchitect_roads.getMultiSelectionCentroid()`

Center of the 3D bounding box of the multi-selection nodes.

- **returns**: vec3 Center (nonsensical values if the selection is empty).

#### `editor_roadArchitect_roads.getRoadsFromGroup(group)`

Returns the roads (without duplicates) belonging to a placed group; if group is nil, returns all the session's roads.

- `group` (*table|nil*) : Group with group.list = list of entries {r = road name, n = node index}.
- **returns**: table List of roads.

#### `editor_roadArchitect_roads.getTree()`

Returns the 2D quadtree used for display culling while editing (nil if it does not exist yet).

- **returns**: table|nil The quadtree.

#### `editor_roadArchitect_roads.goToRoad(rIdx)`

Places the free camera directly above the center of the road, at a height that frames the whole road (according to the field of view). Does nothing if the road is too small (less than 0.1 m extent).

- `rIdx` (*integer*) : Index of the road.

#### `editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos)`

Tests whether the mouse position is close (2D tolerance 3.5 m) to a segment of the road, between two nodes, to offer node insertion.

- `rIdx` (*integer*) : Index of the road.
- `mousePos` (*vec3*) : Mouse position on the map.
- **returns**: boolean true if the mouse is over a segment.
- **returns**: vec3|nil Interpolated position on the segment.
- **returns**: integer|nil Index of the node following the point found.

#### `editor_roadArchitect_roads.manageTempRoadSection(pIdx)`

Creates or updates the temporary road 'temp' (20 m straight segment at 1000 m altitude) that shows the profile being edited, places the free camera on it and makes it rotate around. Called every frame during the audition.

- `pIdx` (*integer*) : Index of the profile in profileMgr.profiles.

#### `editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast)`

Translates a road: either rigidly (all unlocked nodes), or as a force field (the central node follows the mouse, the others move proportionally to the distance, up to the first locked node). Marks the road dirty.

- `road` (*table*) : Road (table, not an index).
- `nodeIdx` (*integer*) : Grabbed node.
- `mouseNow` (*vec3*) : Current mouse position.
- `mouseLast` (*vec3*) : Previous position.

#### `editor_roadArchitect_roads.offsetByValue(offset)`

Adds a vertical offset to all nodes of all roads and marks them dirty.

- `offset` (*number*) : Offset in meters (positive = upward).

#### `editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx)`

Removes a placed group index from the road's groupIdx list.

- `r` (*table*) : Road.
- `groupIdx` (*integer*) : Group index to remove.

#### `editor_roadArchitect_roads.removeNode(rIdx, nIdx)`

Removes a node from a road (table.remove). Does not mark the road dirty.

- `rIdx` (*integer*) : Index of the road.
- `nIdx` (*integer*) : Index of the node.

#### `editor_roadArchitect_roads.removeRoad(roadName)`

Deletes a road by its name: removes decals, road and static meshes, quadtree entry, possible bridge folder, then the entry in roads and rebuilds the map.

- `roadName` (*string*) : Name (identifier) of the road, not its displayName.

#### `editor_roadArchitect_roads.serialiseRoad(r)`

Converts a road to a plain table (plain values, without ImGui pointers) for JSON saving.

- `r` (*table*) : Road.
- **returns**: table Serialized road.

#### `editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow)`

Shows or hides all bridges.

- `isShow` (*boolean*) : true to show.

#### `editor_roadArchitect_roads.setCurrentMap(cMap)`

Stores the map (level) currently loaded.

- `cMap` (*any*) : Value to store (inferred from code).

#### `editor_roadArchitect_roads.setDirty(r)`

Marks the road as needing recomputation (isDirty), updates the profile condition and reinserts the road into the editing quadtree (created on demand with the terrain extent, or 5000 m by default).

- `r` (*table|nil*) : Road; does nothing if nil.

#### `editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset)`

Changes the width of all 'road_lane' type lanes of a node: new width = starting width + offset, bounded to [0.5, 10].

- `rIdx` (*integer*) : Index of the road.
- `nIdx` (*integer*) : Index of the node.
- `offset` (*number*) : Lane width change, in meters.

#### `editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow)`

Shows or hides all overlays.

- `isShow` (*boolean*) : true to show.

#### `editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow)`

Shows or hides all ordinary roads (neither bridges nor overlays) by overwriting their isVis.

- `isShow` (*boolean*) : true to show.

#### `editor_roadArchitect_roads.splitRoad(rIdx, nIdx)`

Cuts a road at the given node into two new roads ([A] and [B], each with a copy of the cut node pushed back by 1 m), deletes the old road and adds them to roads. Useful for creating junctions.

- `rIdx` (*integer*) : Index of the road.
- `nIdx` (*integer*) : Index of the cut node; must have a neighbor on each side (the code reads nodes[nIdx-1] and nodes[nIdx+1]).

#### `editor_roadArchitect_roads.updateBridgeParameters(road)`

Applies the road's bridge width and depth to the first two nodes (lanes -1 and 1). See notes: probable pointer bug.

- `road` (*table*) : Bridge type road.

#### `editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups)`

Rebuilds the groupIdx of all roads from the list of remaining placed groups (renumbering after a group is deleted).

- `placedGroups` (*table*) : List of placed groups, each with list = {{r = name, n = index}, ...}.

#### `editor_roadArchitect_roads.updateWAndHToNewProfile(road)`

Resets the per-lane widths and heights of all the road's nodes according to its current profile (after a profile change).

- `road` (*table*) : Road.

## Fields

| Field | Type | Description |
|---|---|---|
| `isAuditionProfileDirty` | boolean | Initial copy (false) of the profile audition flag; see notes, the real value is not exposed. |
| `map` | table<string, integer> | Hash table road name -> index in roads. Rebuilt by recomputeMap(). |
| `multi` | table<integer, {r: integer, n: integer}> | Multi-selection of nodes: each entry gives the road index (r) and node index (n). |
| `roads` | table<integer, table> | List of the session's roads (same table as the one used internally: modifying it acts directly). |

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/roads.lua`.*
