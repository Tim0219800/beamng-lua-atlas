---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/roads.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central container of Road Architect: it stores the list of the session's roads (each road = nodes, lateral profile, display options, bridge, tunnels) and provides all the editing operations (adding/removing nodes, moving, height, lateral rotation, cutting, flipping, copying, serialization). It also handles the transition between the "edit" and "finalised" states (creation of procedural meshes, static meshes, tunnels and decals). A modder uses it to create or manipulate roads by script from the editor; the Road Architect modules (geometry, profiles, decals, roadMesh...) read its tables.
--- Access: extension `editor_roadArchitect_roads`: `extensions.load("editor_roadArchitect_roads")`, then the global `editor_roadArchitect_roads`
---@class editor_roadArchitect_roads
---@field isAuditionProfileDirty boolean Initial copy (false) of the profile audition flag; see notes, the real value is not exposed.
---@field map table<string, integer> Hash table road name -> index in roads. Rebuilt by recomputeMap().
---@field multi table<integer, {r: integer, n: integer}> Multi-selection of nodes: each entry gives the road index (r) and node index (n).
---@field roads table<integer, table> List of the session's roads (same table as the one used internally: modifying it acts directly).
editor_roadArchitect_roads = {}

--- Adds a node between the selected node and its neighbor (midpoint, averaged values). At the ends of the road, copies the node and places it 3 m further along the road axis.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:404
---@param rIdx integer Index of the road.
---@param nIdx integer Index of the selected node.
---@param lie string 'above' (with the previous node) or 'below' (with the next node).
function editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie) end

--- Adds a node at the end of the road, with the per-lane widths/heights from the profile. Marks the road dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:191
---@param rIdx integer Index of the road in roads.
---@param pos vec3 World position of the node.
function editor_roadArchitect_roads.addNodeToRoad(rIdx, pos) end

--- Inserts a node at the given index of the road. Marks the road dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:210
---@param rIdx integer Index of the road.
---@param pos vec3 World position.
---@param idx integer Insertion index in route.nodes (table.insert).
function editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx) end

--- Changes the height of a node (bounded to ±1000 m) and propagates the change to the other nodes (rigid or force field). Marks dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:555
---@param hNew number New height of the central node, in meters.
---@param hOld number Old height (used to compute the change dz).
---@param nIdx integer Index of the central node.
---@param rIdx integer Index of the road.
function editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx) end

--- Changes the lateral rotation (banking) of a node and propagates it to the others (bounded to ±50 degrees). No effect if the profile is in auto-banking.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:602
---@param rotNew number New rotation of the central node, in degrees.
---@param rotOld number Old rotation.
---@param nIdx integer Index of the central node.
---@param rIdx integer Index of the road.
function editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx) end

--- Deletes all roads that are not junction roads (isJctRoad).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:452
function editor_roadArchitect_roads.clearAllRoads() end

--- Empties the bridges table of the roadMesh module (without deleting the scene objects).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:910
function editor_roadArchitect_roads.clearBridges() end

--- 2D bounding box of a road's nodes. Returns nil for a bridge or an overlay. (The comment says the profile width is included, but the code only takes the nodes into account.)
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:314
---@param rIdx integer Index of the road.
---@return table|nil  {xMin, xMax, yMin, yMax} or nil.
function editor_roadArchitect_roads.computeAABB2D(rIdx) end

--- Recomputes the renderData of all roads with 2 or more nodes (via geometry).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1115
function editor_roadArchitect_roads.computeAllRoadRenderData() end

--- Computes the axis-aligned 2D bounding box of a road's nodes (used only by the acceleration tree).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:137
---@param r table Road.
---@return number  xMin
---@return number  xMax
---@return number  yMin
---@return number  yMax
function editor_roadArchitect_roads.computeRoadAABB_2D(r) end

--- Recomputes the renderData of a single road.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1126
---@param i integer Index of the road.
function editor_roadArchitect_roads.computeRoadRenderDataSingle(i) end

--- For each DecalRoad selected in the editor, creates a Road Architect road (re-parameterized nodes, profile according to lanesLeft/lanesRight) and adds it to roads. See notes: the DecalRoads are not deleted.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1213
function editor_roadArchitect_roads.convertDecalRoads2RoadArchitect() end

--- Deep copy of a node (new ImGui pointers and new vec3).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:285
---@param n table Node.
---@return table  Copy of the node.
function editor_roadArchitect_roads.copyNode(n) end

--- Deep copy of a road (nodes, profile, options, bridge/tunnel parameters). The name is kept identical, renderData is emptied, tunnels is empty and isDirty = true.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:663
---@param r table Road.
---@return table  Copy of the road.
function editor_roadArchitect_roads.copyRoad(r) end

--- Fills roads.multi with all the nodes of all roads located inside the polygon (in 2D).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1075
---@param gPolygon table<integer, vec3> Vertices of the selection polygon.
function editor_roadArchitect_roads.createMultiSelect(gPolygon) end

--- Builds a new road table from a lateral profile (updates the profile's lane flags, computes the lane keys). The road has no nodes and is not added to the list.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:61
---@param profile table Lateral profile (see editor/roadArchitect/profiles).
---@return table  The created road (default values: visible, 15 radial tunnel divisions, bridge half-width 5.5, depth 4, arch -6, etc.).
function editor_roadArchitect_roads.createRoadFromProfile(profile) end

--- Like createRoadFromProfile, but the profile is created from the name of a profile template (with an identifier generated by Engine.generateUUID()).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:129
---@param profileTemplateName string Profile template name.
---@return table  The created road.
function editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName) end

--- Rebuilds a road (with ImGui pointers, isDirty = true) from a table serialized by serialiseRoad.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1505
---@param rSer table Serialized road.
---@return table  Road usable in roads.
function editor_roadArchitect_roads.deserialiseRoad(rSer) end

--- Switches to the "finalised" state: recomputes all renderData, creates a scene folder per road ("Road Architect - Road <i>"), generates the bridge meshes then road meshes, the static meshes and the tunnels, reloads the collision (be:reloadCollision), places the decals then reloads the navgraph (map.reset()).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1270
function editor_roadArchitect_roads.finalise() end

--- Reverses the direction of the road (node order) and immediately recomputes its renderData. Useful for fixing imports.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:873
---@param rIdx integer Index of the road.
function editor_roadArchitect_roads.flipRoad(rIdx) end

--- Returns the name/identifier of the map (level) currently stored by the module.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:55
---@return any  Value stored by setCurrentMap (nil at start).
function editor_roadArchitect_roads.getCurrentMap() end

--- Center of the 3D bounding box of the multi-selection nodes.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1100
---@return vec3  Center (nonsensical values if the selection is empty).
function editor_roadArchitect_roads.getMultiSelectionCentroid() end

--- Returns the roads (without duplicates) belonging to a placed group; if group is nil, returns all the session's roads.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:330
---@param group table|nil Group with group.list = list of entries {r = road name, n = node index}.
---@return table  List of roads.
function editor_roadArchitect_roads.getRoadsFromGroup(group) end

--- Returns the 2D quadtree used for display culling while editing (nil if it does not exist yet).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:182
---@return table|nil  The quadtree.
function editor_roadArchitect_roads.getTree() end

--- Places the free camera directly above the center of the road, at a height that frames the whole road (according to the field of view). Does nothing if the road is too small (less than 0.1 m extent).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:478
---@param rIdx integer Index of the road.
function editor_roadArchitect_roads.goToRoad(rIdx) end

--- Tests whether the mouse position is close (2D tolerance 3.5 m) to a segment of the road, between two nodes, to offer node insertion.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:230
---@param rIdx integer Index of the road.
---@param mousePos vec3 Mouse position on the map.
---@return boolean  true if the mouse is over a segment.
---@return vec3|nil  Interpolated position on the segment.
---@return integer|nil  Index of the node following the point found.
function editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos) end

--- Creates or updates the temporary road 'temp' (20 m straight segment at 1000 m altitude) that shows the profile being edited, places the free camera on it and makes it rotate around. Called every frame during the audition.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:959
---@param pIdx integer Index of the profile in profileMgr.profiles.
function editor_roadArchitect_roads.manageTempRoadSection(pIdx) end

--- Translates a road: either rigidly (all unlocked nodes), or as a force field (the central node follows the mouse, the others move proportionally to the distance, up to the first locked node). Marks the road dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:515
---@param road table Road (table, not an index).
---@param nodeIdx integer Grabbed node.
---@param mouseNow vec3 Current mouse position.
---@param mouseLast vec3 Previous position.
function editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast) end

--- Adds a vertical offset to all nodes of all roads and marks them dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1257
---@param offset number Offset in meters (positive = upward).
function editor_roadArchitect_roads.offsetByValue(offset) end

--- Enables isConformRoadToTerrain on all roads (they sit on the terrain) and marks them dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1249
function editor_roadArchitect_roads.offsetRoads2Terrain() end

--- Rebuilds the name -> index table (roads.map). To be called after any manual insertion/removal in roads.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:353
function editor_roadArchitect_roads.recomputeMap() end

--- Deletes all decals, road meshes, statics, bridges and tunnels, then empties roads and the map.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:913
function editor_roadArchitect_roads.removeAll() end

--- Removes a placed group index from the road's groupIdx list.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1129
---@param r table Road.
---@param groupIdx integer Group index to remove.
function editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx) end

--- Removes from roads all hidden roads (isHidden) and their meshes, then recomputes the map.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:462
function editor_roadArchitect_roads.removeHiddenRoads() end

--- Removes a node from a road (table.remove). Does not mark the road dirty.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:385
---@param rIdx integer Index of the road.
---@param nIdx integer Index of the node.
function editor_roadArchitect_roads.removeNode(rIdx, nIdx) end

--- Deletes a road by its name: removes decals, road and static meshes, quadtree entry, possible bridge folder, then the entry in roads and rebuilds the map.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:362
---@param roadName string Name (identifier) of the road, not its displayName.
function editor_roadArchitect_roads.removeRoad(roadName) end

--- Forgets the quadtree (it will be recreated on the next setDirty).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:185
function editor_roadArchitect_roads.removeTree() end

--- Converts a road to a plain table (plain values, without ImGui pointers) for JSON saving.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1446
---@param r table Road.
---@return table  Serialized road.
function editor_roadArchitect_roads.serialiseRoad(r) end

--- Calls setDirty on all roads.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:175
function editor_roadArchitect_roads.setAllDirty() end

--- Requests the rebuild of the temporary profile audition road on the next call of manageTempRoadSection.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:188
function editor_roadArchitect_roads.setAuditionProfileDirty() end

--- Shows or hides all bridges.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1426
---@param isShow boolean true to show.
function editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow) end

--- Stores the map (level) currently loaded.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:58
---@param cMap any Value to store (inferred from code).
function editor_roadArchitect_roads.setCurrentMap(cMap) end

--- Marks the road as needing recomputation (isDirty), updates the profile condition and reinserts the road into the editing quadtree (created on demand with the terrain extent, or 5000 m by default).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:149
---@param r table|nil Road; does nothing if nil.
function editor_roadArchitect_roads.setDirty(r) end

--- Changes the width of all 'road_lane' type lanes of a node: new width = starting width + offset, bounded to [0.5, 10].
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:260
---@param rIdx integer Index of the road.
---@param nIdx integer Index of the node.
---@param offset number Lane width change, in meters.
function editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset) end

--- Shows or hides all overlays.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1436
---@param isShow boolean true to show.
function editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow) end

--- Shows or hides all ordinary roads (neither bridges nor overlays) by overwriting their isVis.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1416
---@param isShow boolean true to show.
function editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow) end

--- Cuts a road at the given node into two new roads ([A] and [B], each with a copy of the cut node pushed back by 1 m), deletes the old road and adds them to roads. Useful for creating junctions.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:737
---@param rIdx integer Index of the road.
---@param nIdx integer Index of the cut node; must have a neighbor on each side (the code reads nodes[nIdx-1] and nodes[nIdx+1]).
function editor_roadArchitect_roads.splitRoad(rIdx, nIdx) end

--- Leaves the "finalised" state: removes the decals, meshes, statics and tunnels generated by finalise and goes back to editing.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1334
function editor_roadArchitect_roads.unfinalise() end

--- Applies the road's bridge width and depth to the first two nodes (lanes -1 and 1). See notes: probable pointer bug.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1054
---@param road table Bridge type road.
function editor_roadArchitect_roads.updateBridgeParameters(road) end

--- Removes from roads.multi the entries whose road or node no longer exists.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1202
function editor_roadArchitect_roads.updateMultiAfterRemove() end

--- Recomputes the renderData of each dirty road having at least 2 nodes; for bridges, also updates the bridge mesh in the scene folder "Road Architect - Bridge <name>". To be called every editing frame.
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:889
function editor_roadArchitect_roads.updateRoads() end

--- Rebuilds the groupIdx of all roads from the list of remaining placed groups (renumbering after a group is deleted).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:1188
---@param placedGroups table List of placed groups, each with list = {{r = name, n = index}, ...}.
function editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups) end

--- Resets the per-lane widths and heights of all the road's nodes according to its current profile (after a profile change).
---Source: lua/ge/extensions/editor/roadArchitect/roads.lua:304
---@param road table Road.
function editor_roadArchitect_roads.updateWAndHToNewProfile(road) end

