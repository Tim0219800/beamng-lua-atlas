# `editor_roadArchitect_junctions`

*File: `lua/ge/extensions/editor/roadArchitect/junctions.lua` · VM: Game Engine (GE) · 10439 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_junctions`: `extensions.load("editor_roadArchitect_junctions")`, then the global `editor_roadArchitect_junctions`

Junction management of the Road Architect editor: pedestrian crossing, crossroads, T, Y, roundabout, rural/urban and highway/urban transitions, merges, separators, emergency lane fade and highway slip road. A junction is a record (name, type, ImGui parameters im.FloatPtr/IntPtr/BoolPtr, list of road names) whose roads are generated in roadMgr (editor/roadArchitect/roads) from profiles. The module can also move/rotate/copy/save/load a junction, finalize it (it becomes ordinary roads) and import a road network from the L-System tool. Editor-only (GE).

## Example

```lua
local j = extensions.editor_roadArchitect_junctions
j.addTJunction(true)            -- creates a T junction (last in the list)
local idx = #j.junctions
j.junctions[idx].numLanesX[0] = 2   -- ImGui parameter (pointer)
j.updateJunctionAfterChange(idx)  -- regenerates the roads
j.goToJunction(idx)
j.finaliseJunction(idx)         -- freezes the roads, removes the junction from the list
```

## Notes

- A junction's parameters are ImGui pointers (im.FloatPtr, im.IntPtr, im.BoolPtr, im.ArrayChar): read/write with [0] and the name with ffi.string(jct.name).
- Junction types recognized by updateJunctionAfterChange: crossing, crossroads, t-junction, y-junction, roundabout, rural_urban_transition, urban_merge, urban_separator, highway_merge, highway_urban_transition, highway_separator, shoulder_fade, highway_slip. Any other type is ignored (TODO comment in the code).
- The addXxx(isNew) functions: with isNew=true they create a new record with default values; with isNew=false they reuse the last junction in the list (used by loadJunction after deserialiseJct). They then build the roads and call updateJunctionAfterChange(#junctions).
- Probable bug: clearAllJunctions iterates forward with for i = 1, #junctions while calling removeJunction(i), which does table.remove; every other element is skipped and the #junctions bound is evaluated only once (risk of nil index). Avoid it or call it in a loop until the list is empty.
- setAllMeshProperty does nothing useful: the loop fetches each road into a local variable r without modifying anything.
- finaliseJunction does not delete the roads: it renames them (junction name + ' R' + n, or 'Overlay n'), sets isJctRoad = false, then only removes the record from the junctions list.
- removeJunction deletes the junction's roads via roadMgr.removeRoad then the list entry.
- The 'shoulder_fade' junction is handled by getJunctionCentroid/computeInitRot, but the centroid depends on jct.isY1Outwards[0].
- Internal constant jctFlattenRad = 20 m (flattening radius around junctions, L-System).
- importRoadsFromLSystem assumes two-way roads, one lane per direction, and ignores road_type (TODO comments in the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_junctions.addCrossroads(isNew)` | Adds a 4-branch crossroads, type 'crossroads'. | 8381 |
| `editor_roadArchitect_junctions.addHighwayMergeJunction(isNew)` | Adds a highway merge (for example 2 lanes to 1, 3 to 2...), type 'highway_merge'. | 9056 |
| `editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew)` | Adds a highway separator: splits a two-way highway into two one-way sections to connect them separately, type 'highway_separator'. | 9246 |
| `editor_roadArchitect_junctions.addHighwaySlipJunction(isNew)` | Adds a highway slip road, type 'highway_slip'. | 9429 |
| `editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew)` | Adds a highway / urban transition (reduces the central reservation down to a simple centerline), type 'highway_urban_transition'. | 9155 |
| `editor_roadArchitect_junctions.addPedXJunction(isNew)` | Adds a 2-way pedestrian crossing junction (crossing + traffic lights only), type 'crossing'. | 8280 |
| `editor_roadArchitect_junctions.addRoundaboutJunction(isNew)` | Adds a 4-branch roundabout, type 'roundabout'. | 8684 |
| `editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew)` | Adds an urban (with sidewalks) / rural (without sidewalks) transition, type 'rural_urban_transition'. | 8785 |
| `editor_roadArchitect_junctions.addShoulderFadeJunction(isNew)` | Adds an emergency lane fade: the emergency lane of a one-way highway fades out to become a one-way rural road, type 'shoulder_fade'. | 9330 |
| `editor_roadArchitect_junctions.addTJunction(isNew)` | Adds a 3-branch T junction, type 't-junction'. | 8482 |
| `editor_roadArchitect_junctions.addUrbanMergeJunction(isNew)` | Adds an urban merge (for example 2 lanes to 1, 3 to 2...), type 'urban_merge'. | 8869 |
| `editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew)` | Adds an urban separator, type 'urban_separator'. | 8970 |
| `editor_roadArchitect_junctions.addYJunction(isNew)` | Adds a Y junction with 3 angled branches, type 'y-junction'. | 8583 |
| `editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad)` | For each listed road, removes the nodes located inside the sphere (circle in 2D) and projects the first or last node onto the circle, depending on whether the road touches the junction by its start ('start') or its end. | 10076 |
| `editor_roadArchitect_junctions.clearAllJunctions()` | Tries to delete all junctions by calling removeJunction(i) in an ascending loop. See notes: the loop modifies the list during iteration. | 9537 |
| `editor_roadArchitect_junctions.computeInitRot(jIdx)` | Computes the rotation angle around the junction's Z axis from the direction of its roads, relative to the X axis (util.getRotationBetweenVecs). Depends on the junction type. | 97 |
| `editor_roadArchitect_junctions.copyJunction(jct)` | Deep-copies a junction (new ImGui pointers, road list duplicated with deepcopy). | 9672 |
| `editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen)` | Automatically creates overlay roads between the roads arriving at the same junction (in pairs, depending on the start/end cases), from the roads' render data. No comment in the code; description inferred from code. | 10146 |
| `editor_roadArchitect_junctions.deserialiseJct(jSer)` | Inverse operation of serialiseJct: rebuilds a junction record with its ImGui pointers from a table read from JSON; some missing values get a default (for example arrowMat). | 9788 |
| `editor_roadArchitect_junctions.finaliseJunction(jIdx)` | Finalizes the junction: renames its roads (junction name + ' R' + n, or 'Overlay n' for overlays), marks them as normal roads (isJctRoad = false), then removes the junction from the list. The roads remain in the editor. | 9651 |
| `editor_roadArchitect_junctions.getJunctionCentroid(jIdx)` | Computes the center of junction jIdx. The computation depends on the type: midpoint between a node of two roads (crossing, crossroads, t, y, roundabout, merges, slip), between the start and end of the 3rd road (transitions), last node of the 1st road (separators), or midpoint between the ends of two roads (shoulder_fade, depending on isY1Outwards). Returns nil for an unhandled type. | 65 |
| `editor_roadArchitect_junctions.goToJunction(jIdx)` | Places the free camera above the junction, looking down, at a height that fits the whole junction in the field of view (computed with the core_camera FOV). Does nothing if the bounding box is smaller than 0.1 m. | 9588 |
| `editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform)` | Imports a road network from the L-System tool: creates one Road Architect road per unique road (1 lane per direction profile, width from the import), then for each intersection cuts the roads at the sphere of the given radius and creates the junction overlays. If doTerraform is true, then terraforms the terrain under the whole network. | 10329 |
| `editor_roadArchitect_junctions.loadJunction()` | Opens the open dialog (editor_fileDialog), reads the JSON, deserializes the junction, adds it to the list then regenerates its roads with the addXxx(false) function matching its type. | 9861 |
| `editor_roadArchitect_junctions.removeJunction(jIdx)` | Deletes the junction's roads (roadMgr.removeRoad) then the entry in the junctions list. | 9528 |
| `editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta)` | Rotates the junction around the Z axis through cen, by angle theta; the z height of the nodes is preserved. | 9557 |
| `editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q)` | Rotates all the junction's nodes around cen according to quaternion q (util.rotateVecByQuaternion). | 9575 |
| `editor_roadArchitect_junctions.saveJunction(jIdx)` | Opens the save dialog (editor_fileDialog) then writes a JSON containing the serialized junction (name = file name), its position (centroid) and its initial rotation. | 9846 |
| `editor_roadArchitect_junctions.serialiseJct(jct)` | Converts a junction to a plain table, without ImGui pointers (values read with [0], name with ffi.string), ready to be written as JSON. Note: the roads list is shared, not copied. | 9730 |
| `editor_roadArchitect_junctions.setAllMeshProperty(jIdx)` | Meant to make all the junction's roads use (or not use) meshes, but the body modifies nothing (see notes). | 9629 |
| `editor_roadArchitect_junctions.translateJunction(jIdx, offset)` | Translates all nodes of all the junction's roads by the given vector and marks the roads as modified (roadMgr.setDirty). | 9544 |
| `editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx)` | Empties roadMgr.multi then regenerates the junction's roads according to its type after a parameter change, and reapplies the pavement condition. | 8244 |
| `editor_roadArchitect_junctions.updateJunctionCondition(jct)` | Propagates the junction's wear state (condition, seed, number of patches and potholes) to all its non-overlay roads, then calls profileMgr.updateCondition. The roads' patches and potholes are 15% (rounded up) of the junction's values; the seed is shifted by one rank per road. | 152 |
| `editor_roadArchitect_junctions.updateJunctionsAfterRoadRemove()` | Removes from the list the junctions for which at least one road no longer exists in roadMgr. To be called after a road is deleted. | 9637 |

### Parameter details

#### `editor_roadArchitect_junctions.addCrossroads(isNew)`

Adds a 4-branch crossroads, type 'crossroads'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addHighwayMergeJunction(isNew)`

Adds a highway merge (for example 2 lanes to 1, 3 to 2...), type 'highway_merge'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew)`

Adds a highway separator: splits a two-way highway into two one-way sections to connect them separately, type 'highway_separator'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addHighwaySlipJunction(isNew)`

Adds a highway slip road, type 'highway_slip'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew)`

Adds a highway / urban transition (reduces the central reservation down to a simple centerline), type 'highway_urban_transition'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addPedXJunction(isNew)`

Adds a 2-way pedestrian crossing junction (crossing + traffic lights only), type 'crossing'.

- `isNew` (*boolean*) : true: creates a new default record; false: reuses the last junction in the list.

#### `editor_roadArchitect_junctions.addRoundaboutJunction(isNew)`

Adds a 4-branch roundabout, type 'roundabout'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew)`

Adds an urban (with sidewalks) / rural (without sidewalks) transition, type 'rural_urban_transition'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addShoulderFadeJunction(isNew)`

Adds an emergency lane fade: the emergency lane of a one-way highway fades out to become a one-way rural road, type 'shoulder_fade'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addTJunction(isNew)`

Adds a 3-branch T junction, type 't-junction'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addUrbanMergeJunction(isNew)`

Adds an urban merge (for example 2 lanes to 1, 3 to 2...), type 'urban_merge'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew)`

Adds an urban separator, type 'urban_separator'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.addYJunction(isNew)`

Adds a Y junction with 3 angled branches, type 'y-junction'.

- `isNew` (*boolean*) : true: new default record; false: reuses the last junction.

#### `editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad)`

For each listed road, removes the nodes located inside the sphere (circle in 2D) and projects the first or last node onto the circle, depending on whether the road touches the junction by its start ('start') or its end.

- `jNodes` (*table<integer, {rName: string, lie: string}>*) : Road ends concerned: rName = road name, lie = 'start' or 'end'.
- `jCen` (*vec3*) : Center of the sphere.
- `jRad` (*number*) : Radius, in meters.

#### `editor_roadArchitect_junctions.computeInitRot(jIdx)`

Computes the rotation angle around the junction's Z axis from the direction of its roads, relative to the X axis (util.getRotationBetweenVecs). Depends on the junction type.

- `jIdx` (*integer*) : Index in junctions.
- **returns**: any Rotation returned by util.getRotationBetweenVecs (nil for an unhandled type).

#### `editor_roadArchitect_junctions.copyJunction(jct)`

Deep-copies a junction (new ImGui pointers, road list duplicated with deepcopy).

- `jct` (*table*) : Junction record to copy.
- **returns**: table New independent record.

#### `editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen)`

Automatically creates overlay roads between the roads arriving at the same junction (in pairs, depending on the start/end cases), from the roads' render data. No comment in the code; description inferred from code.

- `jNodes` (*table<integer, {rName: string, lie: string}>*) : Road ends of the junction (rName, lie = 'start' or 'end').
- `laneWidth` (*number*) : Lane width, in meters (inferred from code).
- `jctCen` (*vec3*) : Junction center (its z height is used).

#### `editor_roadArchitect_junctions.deserialiseJct(jSer)`

Inverse operation of serialiseJct: rebuilds a junction record with its ImGui pointers from a table read from JSON; some missing values get a default (for example arrowMat).

- `jSer` (*table*) : Serialized table.
- **returns**: table Junction record usable in junctions.

#### `editor_roadArchitect_junctions.finaliseJunction(jIdx)`

Finalizes the junction: renames its roads (junction name + ' R' + n, or 'Overlay n' for overlays), marks them as normal roads (isJctRoad = false), then removes the junction from the list. The roads remain in the editor.

- `jIdx` (*integer*) : Index in junctions.

#### `editor_roadArchitect_junctions.getJunctionCentroid(jIdx)`

Computes the center of junction jIdx. The computation depends on the type: midpoint between a node of two roads (crossing, crossroads, t, y, roundabout, merges, slip), between the start and end of the 3rd road (transitions), last node of the 1st road (separators), or midpoint between the ends of two roads (shoulder_fade, depending on isY1Outwards). Returns nil for an unhandled type.

- `jIdx` (*integer*) : Index in junctions.
- **returns**: vec3|nil Position of the junction center.

#### `editor_roadArchitect_junctions.goToJunction(jIdx)`

Places the free camera above the junction, looking down, at a height that fits the whole junction in the field of view (computed with the core_camera FOV). Does nothing if the bounding box is smaller than 0.1 m.

- `jIdx` (*integer*) : Index in junctions.

#### `editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform)`

Imports a road network from the L-System tool: creates one Road Architect road per unique road (1 lane per direction profile, width from the import), then for each intersection cuts the roads at the sphere of the given radius and creates the junction overlays. If doTerraform is true, then terraforms the terrain under the whole network.

- `roadNetwork` (*table*) : Indexed unique roads; each element has id, type, width, splineNodes (with pos) and nodes (with id).
- `intersections` (*table*) : Intersections keyed by node id; each element has connectedRoads, radius and pos.
- `DOI` (*number*) : Parameter passed to terra.terraformMultiRoads (domain of influence, inferred from code).
- `margin` (*number*) : Margin passed to terra.terraformMultiRoads.
- `doTerraform` (*boolean*) : true to terraform the terrain after the import.

#### `editor_roadArchitect_junctions.removeJunction(jIdx)`

Deletes the junction's roads (roadMgr.removeRoad) then the entry in the junctions list.

- `jIdx` (*integer*) : Index in junctions.

#### `editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta)`

Rotates the junction around the Z axis through cen, by angle theta; the z height of the nodes is preserved.

- `jIdx` (*integer*) : Index in junctions.
- `cen` (*vec3*) : Center of rotation.
- `theta` (*number*) : Angle in radians.

#### `editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q)`

Rotates all the junction's nodes around cen according to quaternion q (util.rotateVecByQuaternion).

- `jIdx` (*integer*) : Index in junctions.
- `cen` (*vec3*) : Center of rotation.
- `q` (*quat*) : Rotation to apply.

#### `editor_roadArchitect_junctions.saveJunction(jIdx)`

Opens the save dialog (editor_fileDialog) then writes a JSON containing the serialized junction (name = file name), its position (centroid) and its initial rotation.

- `jIdx` (*integer*) : Index in junctions.

#### `editor_roadArchitect_junctions.serialiseJct(jct)`

Converts a junction to a plain table, without ImGui pointers (values read with [0], name with ffi.string), ready to be written as JSON. Note: the roads list is shared, not copied.

- `jct` (*table*) : Junction record.
- **returns**: table Serializable table.

#### `editor_roadArchitect_junctions.setAllMeshProperty(jIdx)`

Meant to make all the junction's roads use (or not use) meshes, but the body modifies nothing (see notes).

- `jIdx` (*integer*) : Index in junctions.

#### `editor_roadArchitect_junctions.translateJunction(jIdx, offset)`

Translates all nodes of all the junction's roads by the given vector and marks the roads as modified (roadMgr.setDirty).

- `jIdx` (*integer*) : Index in junctions.
- `offset` (*vec3*) : Translation vector, in meters.

#### `editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx)`

Empties roadMgr.multi then regenerates the junction's roads according to its type after a parameter change, and reapplies the pavement condition.

- `jIdx` (*integer*) : Index in junctions.

#### `editor_roadArchitect_junctions.updateJunctionCondition(jct)`

Propagates the junction's wear state (condition, seed, number of patches and potholes) to all its non-overlay roads, then calls profileMgr.updateCondition. The roads' patches and potholes are 15% (rounded up) of the junction's values; the seed is shifted by one rank per road.

- `jct` (*table*) : Junction record.

## Fields

| Field | Type | Description |
|---|---|---|
| `junctions` | table<integer, table> | List of junctions of the editing session (same table as the one used internally: modifications are visible on both sides). Each element contains at minimum name, type, roads (road names) and the condition parameters (condition, conditionSeed, numPatches, numPotholes). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/junctions.lua`.*
