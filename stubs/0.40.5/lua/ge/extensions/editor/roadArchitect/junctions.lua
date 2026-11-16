---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/junctions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Junction management of the Road Architect editor: pedestrian crossing, crossroads, T, Y, roundabout, rural/urban and highway/urban transitions, merges, separators, emergency lane fade and highway slip road. A junction is a record (name, type, ImGui parameters im.FloatPtr/IntPtr/BoolPtr, list of road names) whose roads are generated in roadMgr (editor/roadArchitect/roads) from profiles. The module can also move/rotate/copy/save/load a junction, finalize it (it becomes ordinary roads) and import a road network from the L-System tool. Editor-only (GE).
--- Access: extension `editor_roadArchitect_junctions`: `extensions.load("editor_roadArchitect_junctions")`, then the global `editor_roadArchitect_junctions`
---@class editor_roadArchitect_junctions
---@field junctions table<integer, table> List of junctions of the editing session (same table as the one used internally: modifications are visible on both sides). Each element contains at minimum name, type, roads (road names) and the condition parameters (condition, conditionSeed, numPatches, numPotholes).
editor_roadArchitect_junctions = {}

--- Adds a 4-branch crossroads, type 'crossroads'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8381
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addCrossroads(isNew) end

--- Adds a highway merge (for example 2 lanes to 1, 3 to 2...), type 'highway_merge'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9056
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addHighwayMergeJunction(isNew) end

--- Adds a highway separator: splits a two-way highway into two one-way sections to connect them separately, type 'highway_separator'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9246
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew) end

--- Adds a highway slip road, type 'highway_slip'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9429
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addHighwaySlipJunction(isNew) end

--- Adds a highway / urban transition (reduces the central reservation down to a simple centerline), type 'highway_urban_transition'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9155
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew) end

--- Adds a 2-way pedestrian crossing junction (crossing + traffic lights only), type 'crossing'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8280
---@param isNew boolean true: creates a new default record; false: reuses the last junction in the list.
function editor_roadArchitect_junctions.addPedXJunction(isNew) end

--- Adds a 4-branch roundabout, type 'roundabout'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8684
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addRoundaboutJunction(isNew) end

--- Adds an urban (with sidewalks) / rural (without sidewalks) transition, type 'rural_urban_transition'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8785
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew) end

--- Adds an emergency lane fade: the emergency lane of a one-way highway fades out to become a one-way rural road, type 'shoulder_fade'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9330
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addShoulderFadeJunction(isNew) end

--- Adds a 3-branch T junction, type 't-junction'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8482
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addTJunction(isNew) end

--- Adds an urban merge (for example 2 lanes to 1, 3 to 2...), type 'urban_merge'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8869
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addUrbanMergeJunction(isNew) end

--- Adds an urban separator, type 'urban_separator'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8970
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew) end

--- Adds a Y junction with 3 angled branches, type 'y-junction'.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8583
---@param isNew boolean true: new default record; false: reuses the last junction.
function editor_roadArchitect_junctions.addYJunction(isNew) end

--- For each listed road, removes the nodes located inside the sphere (circle in 2D) and projects the first or last node onto the circle, depending on whether the road touches the junction by its start ('start') or its end.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:10076
---@param jNodes table<integer, {rName: string, lie: string}> Road ends concerned: rName = road name, lie = 'start' or 'end'.
---@param jCen vec3 Center of the sphere.
---@param jRad number Radius, in meters.
function editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad) end

--- Tries to delete all junctions by calling removeJunction(i) in an ascending loop. See notes: the loop modifies the list during iteration.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9537
function editor_roadArchitect_junctions.clearAllJunctions() end

--- Computes the rotation angle around the junction's Z axis from the direction of its roads, relative to the X axis (util.getRotationBetweenVecs). Depends on the junction type.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:97
---@param jIdx integer Index in junctions.
---@return any  Rotation returned by util.getRotationBetweenVecs (nil for an unhandled type).
function editor_roadArchitect_junctions.computeInitRot(jIdx) end

--- Deep-copies a junction (new ImGui pointers, road list duplicated with deepcopy).
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9672
---@param jct table Junction record to copy.
---@return table  New independent record.
function editor_roadArchitect_junctions.copyJunction(jct) end

--- Automatically creates overlay roads between the roads arriving at the same junction (in pairs, depending on the start/end cases), from the roads' render data. No comment in the code; description inferred from code.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:10146
---@param jNodes table<integer, {rName: string, lie: string}> Road ends of the junction (rName, lie = 'start' or 'end').
---@param laneWidth number Lane width, in meters (inferred from code).
---@param jctCen vec3 Junction center (its z height is used).
function editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen) end

--- Inverse operation of serialiseJct: rebuilds a junction record with its ImGui pointers from a table read from JSON; some missing values get a default (for example arrowMat).
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9788
---@param jSer table Serialized table.
---@return table  Junction record usable in junctions.
function editor_roadArchitect_junctions.deserialiseJct(jSer) end

--- Finalizes the junction: renames its roads (junction name + ' R' + n, or 'Overlay n' for overlays), marks them as normal roads (isJctRoad = false), then removes the junction from the list. The roads remain in the editor.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9651
---@param jIdx integer Index in junctions.
function editor_roadArchitect_junctions.finaliseJunction(jIdx) end

--- Computes the center of junction jIdx. The computation depends on the type: midpoint between a node of two roads (crossing, crossroads, t, y, roundabout, merges, slip), between the start and end of the 3rd road (transitions), last node of the 1st road (separators), or midpoint between the ends of two roads (shoulder_fade, depending on isY1Outwards). Returns nil for an unhandled type.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:65
---@param jIdx integer Index in junctions.
---@return vec3|nil  Position of the junction center.
function editor_roadArchitect_junctions.getJunctionCentroid(jIdx) end

--- Places the free camera above the junction, looking down, at a height that fits the whole junction in the field of view (computed with the core_camera FOV). Does nothing if the bounding box is smaller than 0.1 m.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9588
---@param jIdx integer Index in junctions.
function editor_roadArchitect_junctions.goToJunction(jIdx) end

--- Imports a road network from the L-System tool: creates one Road Architect road per unique road (1 lane per direction profile, width from the import), then for each intersection cuts the roads at the sphere of the given radius and creates the junction overlays. If doTerraform is true, then terraforms the terrain under the whole network.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:10329
---@param roadNetwork table Indexed unique roads; each element has id, type, width, splineNodes (with pos) and nodes (with id).
---@param intersections table Intersections keyed by node id; each element has connectedRoads, radius and pos.
---@param DOI number Parameter passed to terra.terraformMultiRoads (domain of influence, inferred from code).
---@param margin number Margin passed to terra.terraformMultiRoads.
---@param doTerraform boolean true to terraform the terrain after the import.
function editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform) end

--- Opens the open dialog (editor_fileDialog), reads the JSON, deserializes the junction, adds it to the list then regenerates its roads with the addXxx(false) function matching its type.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9861
function editor_roadArchitect_junctions.loadJunction() end

--- Deletes the junction's roads (roadMgr.removeRoad) then the entry in the junctions list.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9528
---@param jIdx integer Index in junctions.
function editor_roadArchitect_junctions.removeJunction(jIdx) end

--- Rotates the junction around the Z axis through cen, by angle theta; the z height of the nodes is preserved.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9557
---@param jIdx integer Index in junctions.
---@param cen vec3 Center of rotation.
---@param theta number Angle in radians.
function editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta) end

--- Rotates all the junction's nodes around cen according to quaternion q (util.rotateVecByQuaternion).
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9575
---@param jIdx integer Index in junctions.
---@param cen vec3 Center of rotation.
---@param q quat Rotation to apply.
function editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q) end

--- Opens the save dialog (editor_fileDialog) then writes a JSON containing the serialized junction (name = file name), its position (centroid) and its initial rotation.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9846
---@param jIdx integer Index in junctions.
function editor_roadArchitect_junctions.saveJunction(jIdx) end

--- Converts a junction to a plain table, without ImGui pointers (values read with [0], name with ffi.string), ready to be written as JSON. Note: the roads list is shared, not copied.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9730
---@param jct table Junction record.
---@return table  Serializable table.
function editor_roadArchitect_junctions.serialiseJct(jct) end

--- Meant to make all the junction's roads use (or not use) meshes, but the body modifies nothing (see notes).
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9629
---@param jIdx integer Index in junctions.
function editor_roadArchitect_junctions.setAllMeshProperty(jIdx) end

--- Translates all nodes of all the junction's roads by the given vector and marks the roads as modified (roadMgr.setDirty).
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9544
---@param jIdx integer Index in junctions.
---@param offset vec3 Translation vector, in meters.
function editor_roadArchitect_junctions.translateJunction(jIdx, offset) end

--- Empties roadMgr.multi then regenerates the junction's roads according to its type after a parameter change, and reapplies the pavement condition.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:8244
---@param jIdx integer Index in junctions.
function editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx) end

--- Propagates the junction's wear state (condition, seed, number of patches and potholes) to all its non-overlay roads, then calls profileMgr.updateCondition. The roads' patches and potholes are 15% (rounded up) of the junction's values; the seed is shifted by one rank per road.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:152
---@param jct table Junction record.
function editor_roadArchitect_junctions.updateJunctionCondition(jct) end

--- Removes from the list the junctions for which at least one road no longer exists in roadMgr. To be called after a road is deleted.
---Source: lua/ge/extensions/editor/roadArchitect/junctions.lua:9637
function editor_roadArchitect_junctions.updateJunctionsAfterRoadRemove() end

