---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/roads.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_roads` : `extensions.load("editor_roadArchitect_roads")`, puis la globale `editor_roadArchitect_roads`
---@class editor_roadArchitect_roads
---@field isAuditionProfileDirty boolean
---@field map table
---@field multi table
---@field roads table
editor_roadArchitect_roads = {}

--- Adds a node between the currently-selected node and the next node.
---  [The added node is computed as the midpoint of the two nodes].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:404
---@param rIdx any
---@param nIdx any
---@param lie any
function editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie) end

--- Adds a new node at the end of the road with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:191
---@param rIdx any
---@param pos any
function editor_roadArchitect_roads.addNodeToRoad(rIdx, pos) end

--- Adds a new node at the given position, at the given index of the road.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:210
---@param rIdx any
---@param pos any
---@param idx any
function editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx) end

--- Performs a height adjustment to the road with the given index.
---  [The manner by which the road height is adjusted depends on various road/node properties].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:555
---@param hNew any
---@param hOld any
---@param nIdx any
---@param rIdx any
function editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx) end

--- Performs a lateral rotation upon the road with the given index.
---  [The manner by which the road is rotated depends on various road/node properties].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:602
---@param rotNew any
---@param rotOld any
---@param nIdx any
---@param rIdx any
function editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx) end

--- Removes all road from the scene.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:452
function editor_roadArchitect_roads.clearAllRoads() end

--- Clears the bridges structure.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:910
function editor_roadArchitect_roads.clearBridges() end

--- Computes the 2D axis-aligned bounding box of the road with the given id.
---  [The profile width is also included in the computation, rather than just the nodes themselves].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:314
---@param rIdx any
function editor_roadArchitect_roads.computeAABB2D(rIdx) end

--- Re-computes the road render data, for all roads, from fresh.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1115
function editor_roadArchitect_roads.computeAllRoadRenderData() end

--- Computes a 2D Axis-Aligned Bounding Box which represents the given road.
---  [This is used only with the acceleration tree.]
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:137
---@param r any
function editor_roadArchitect_roads.computeRoadAABB_2D(r) end

--- Computes the road render data for a single road.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1126
---@param i any
function editor_roadArchitect_roads.computeRoadRenderDataSingle(i) end

--- Converts all decal roads (from scene tree) to Road Architect style roads.
---  [Note: this removes the original decal roads from the scene tree.]
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1213
function editor_roadArchitect_roads.convertDecalRoads2RoadArchitect() end

--- Deep copies a node.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:285
---@param n any
function editor_roadArchitect_roads.copyNode(n) end

--- Deep copies a road.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:663
---@param r any
function editor_roadArchitect_roads.copyRoad(r) end

--- Create a multi-select (from given polygon) and allow it to be manipulated.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1075
---@param gPolygon any
function editor_roadArchitect_roads.createMultiSelect(gPolygon) end

--- Creates a new road from a given lateral profile.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:61
---@param profile any
function editor_roadArchitect_roads.createRoadFromProfile(profile) end

--- Creates a new road from a given lateral profile template name.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:129
---@param profileTemplateName any
function editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName) end

--- Deserializes a road.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1505
---@param rSer any
function editor_roadArchitect_roads.deserialiseRoad(rSer) end

--- Switches to the 'finalised' state.
---  [All requested procedural meshes are created, the collision mesh is re-computed, then all requested decals are laid].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1270
function editor_roadArchitect_roads.finalise() end

--- Flips the direction of the road with the given index.
---  [This will change the lateral position of the road reference line, and may be useful for fixing import errors].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:873
---@param rIdx any
function editor_roadArchitect_roads.flipRoad(rIdx) end

--- Gets the currently-loaded map.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:55
function editor_roadArchitect_roads.getCurrentMap() end

--- Gets the centroid of the multi-selection.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1100
function editor_roadArchitect_roads.getMultiSelectionCentroid() end

--- Gets the subset of roads from the given group.
---  When group is nil (whole-network terraform), returns every road in the session.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:330
---@param group any
function editor_roadArchitect_roads.getRoadsFromGroup(group) end

--- Gets the tree.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:182
function editor_roadArchitect_roads.getTree() end

--- Moves the camera to directly above the road with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:478
---@param rIdx any
function editor_roadArchitect_roads.goToRoad(rIdx) end

--- Determines if the mouse position is at an intermediate position along the road (between nodes).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:230
---@param rIdx any
---@param mousePos any
function editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos) end

--- Creates/updates a temporary linear road section, used for displaying and editing profiles.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:959
---@param pIdx any
function editor_roadArchitect_roads.manageTempRoadSection(pIdx) end

--- Performs a translation upon the road with the given index.
---  [The manner by which the road is translated depends on various road/node properties].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:515
---@param road any
---@param nodeIdx any
---@param mouseNow any
---@param mouseLast any
function editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast) end

--- Vertically-offsets all roads to a custom value.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1257
---@param offset any
function editor_roadArchitect_roads.offsetByValue(offset) end

--- Vertically-offsets all roads to the terrain.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1249
function editor_roadArchitect_roads.offsetRoads2Terrain() end

--- Re-computes the map (hash-table) between road names and index in the roads array.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:353
function editor_roadArchitect_roads.recomputeMap() end

--- Removes all road meshes from the scene and clears the roads structure.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:913
function editor_roadArchitect_roads.removeAll() end

--- Removes a group index from the given road.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1129
---@param r any
---@param groupIdx any
function editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx) end

--- Removes all hidden roads from the roads container.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:462
function editor_roadArchitect_roads.removeHiddenRoads() end

--- Removes the node with the given node id, from the road with the given road id.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:385
---@param rIdx any
---@param nIdx any
function editor_roadArchitect_roads.removeNode(rIdx, nIdx) end

--- Removes the road with the given id from the scene.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:362
---@param roadName any
function editor_roadArchitect_roads.removeRoad(roadName) end

--- Removes the tree.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:185
function editor_roadArchitect_roads.removeTree() end

--- Serializes a road.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1446
---@param r any
function editor_roadArchitect_roads.serialiseRoad(r) end

--- Sets all the roads dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:175
function editor_roadArchitect_roads.setAllDirty() end

--- Sets the flag which indicates if the audition profiles needs updating, to true.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:188
function editor_roadArchitect_roads.setAuditionProfileDirty() end

--- Sets the visibility of all bridges (master switch).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1426
---@param isShow any
function editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow) end

--- Sets the currently-loaded map.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:58
---@param cMap any
function editor_roadArchitect_roads.setCurrentMap(cMap) end

--- Handles the case when a road needs updated.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:149
---@param r any
function editor_roadArchitect_roads.setDirty(r) end

--- Sets the width at a given node, by dividing the given width into all the lanes.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:260
---@param rIdx any
---@param nIdx any
---@param offset any
function editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset) end

--- Sets the visibility of all overlays (master switch).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1436
---@param isShow any
function editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow) end

--- Sets the visibility of all roads (master switch).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1416
---@param isShow any
function editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow) end

--- Splits the road with the given index, at the given node position.
---  [This can be used for creating junctions].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:737
---@param rIdx any
---@param nIdx any
function editor_roadArchitect_roads.splitRoad(rIdx, nIdx) end

--- Leaves the 'finalised' state and returns to the 'edit' state.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1334
function editor_roadArchitect_roads.unfinalise() end

--- Update the bridge parameters after a change (width and depth).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1054
---@param road any
function editor_roadArchitect_roads.updateBridgeParameters(road) end

--- Updates the multi-selection container, after a road/group of roads was removed.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1202
function editor_roadArchitect_roads.updateMultiAfterRemove() end

--- Manages the updating of roads.
---  [Updates the render data for all roads which require it].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:889
function editor_roadArchitect_roads.updateRoads() end

--- Decrease the group indices stored in the roads, after the removal of a group.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1188
---@param placedGroups any
function editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups) end

--- Updates the width/relative height offset for the given road (in all nodes), after changing the lateral road profile.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:304
---@param road any
function editor_roadArchitect_roads.updateWAndHToNewProfile(road) end

