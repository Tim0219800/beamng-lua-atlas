---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central manager of the "groups" (roads) of the Hero Road Editor. A group is a Lua table describing a road: nodes/widths/normals, cross-section profile, materials, marking layers, placed elements (crosswalks, repairs, potholes, widenings, intersections, barriers), groundmodel paint and Edit/Live state. The module creates, copies, splits, joins, serializes and deletes groups, applies profile presets, holds the undo/redo functions and drives the rebuild: updateDirtyGroups resamples the centerline then calls mesh, sidewalkMgr, barrierMgr and layerMgr in the right order.
--- Access: extension `editor_heroRoadEditor_groupMgr`: `extensions.load("editor_heroRoadEditor_groupMgr")`, then the global `editor_heroRoadEditor_groupMgr`
---@class editor_heroRoadEditor_groupMgr
---@field defaultCrossingDepthM number Default depth (m) of a new crosswalk: 3.5.
---@field defaultPotholeRadiusM number Default radius (m) of a new pothole: 2.0.
---@field defaultRepairLengthM number Default length (m) of a new repair patch cluster: 8.0.
editor_heroRoadEditor_groupMgr = {}

--- Adds a placeable barrier segment (guardrail, jersey or plastic) on one side, over a length window, at abscissa t01; the furniture is placed by barrierMgr after the rebuild.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1218
---@param group table Hero Road group.
---@param t01 number|nil Normalized abscissa (default 0.5).
---@return table|nil  The created barrier (side, lengthM, offsetM, zOffsetM, type).
function editor_heroRoadEditor_groupMgr.addBarrier(group, t01) end

--- Adds a crosswalk at abscissa t01 ({ id, name, t, depthM 3.5, lateral 'carriageway' }) and marks dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1097
---@param group table Hero Road group.
---@param t01 number|nil Normalized abscissa (default 0.5).
---@return table|nil  The created crosswalk.
function editor_heroRoadEditor_groupMgr.addCrossing(group, t01) end

--- Adds an existing group to the array, with a unique name; creates its SimGroup folder if missing and sets its canSave (true if group.isEnabled == false).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:112
---@param group table Group to add.
function editor_heroRoadEditor_groupMgr.addGroupToGroupArray(group) end

--- Adds an intersection (funnel flare on one side, this road being the trunk) at abscissa t01, with options giveWay, exitCenterline and breakEdge.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1246
---@param group table Hero Road group.
---@param t01 number|nil Normalized abscissa (default 0.5).
---@return table|nil  The created intersection (flareM, lengthM, bevelM, side...).
function editor_heroRoadEditor_groupMgr.addJunction(group, t01) end

--- Creates a new group with all default parameters (see notes), its transient scene folder and its automatic layers, adds it to the list and updates the id map. Returns nothing: the group is found with getGroups()[#getGroups()].
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:557
---@param name string|nil Base name; default 'Hero Road N'. Made unique by util.generateUniqueName.
function editor_heroRoadEditor_groupMgr.addNewGroup(name) end

--- Adds a procedural pothole (carved into the mesh) at abscissa t01; the adjustment extent is about the diameter.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1154
---@param group table Hero Road group.
---@param t01 number|nil Normalized abscissa (default 0.5).
---@return table|nil  The created pothole (lateralM, lengthM, widthM, depthM, noise, cutMarkings, seed).
function editor_heroRoadEditor_groupMgr.addPothole(group, t01) end

--- Adds a repair patch cluster (scatter of asphalt decals, random seed) at abscissa t01 and marks dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1122
---@param group table Hero Road group.
---@param t01 number|nil Normalized abscissa (default 0.5).
---@return table|nil  The created cluster.
function editor_heroRoadEditor_groupMgr.addRepair(group, t01) end

--- Adds a flat widening on one side (layby, overtaking lane) at abscissa t01, with smoothed entry and exit tapers.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1183
---@param group table Hero Road group.
---@param t01 number|nil Normalized abscissa (default 0.5).
---@return table|nil  The created widening (side, widthM, bayLenM, taperInM, taperOutM, edgeBulge, laneDivider).
function editor_heroRoadEditor_groupMgr.addWidening(group, t01) end

--- Applies a profile preset to the group (copies all its fields, resyncs the width, marks dirty). Does nothing if the key is unknown.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:219
---@param group table Hero Road group.
---@param key string 'highway', 'city', 'country', 'ledge', 'rally', 'race', 'speedway' or 'valley'.
function editor_heroRoadEditor_groupMgr.applyProfilePreset(group, key) end

--- Default values of a new barrier.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1212
---@return table  { lengthM = 30.0, offsetM = 0.5, zOffsetM = 0.0, side = 'right', type = 'guardrail' }.
function editor_heroRoadEditor_groupMgr.barrierDefaults() end

--- Extent along the road (m) of a barrier segment, i.e. its length; used to keep it away from the ends.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1215
---@param b table Gate.
---@return number  lengthM or 30.0 by default.
function editor_heroRoadEditor_groupMgr.barrierExtent(b) end

--- Clamps a normalized abscissa so that the strip (plus 0.5 m clearance) stays away from both ends; on a road that is too short, returns 0.5.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1023
---@param group table Hero Road group.
---@param t01 number Normalized abscissa.
---@param depthM number|nil Extent along the road (default 3.5 m).
---@return number  Clamped t01.
function editor_heroRoadEditor_groupMgr.clampCrossingT(group, t01, depthM) end

--- Hides during a drag: deletes the group's mesh, sidewalks, furniture and decals (the layer definitions are kept) and reloads the collision if a mesh existed.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:264
---@param group table Hero Road group.
function editor_heroRoadEditor_groupMgr.clearGroupVisuals(group) end

--- One-off "Drape to Terrain": sets the z height of each node to that of the terrain (core_terrain.getTerrainHeight) and marks dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:228
---@param group table Hero Road group.
function editor_heroRoadEditor_groupMgr.conformGroupToTerrain(group) end

--- Converts paths traced from an image (terrain bitmap) into Hero Road groups: grid points converted to world coordinates, normals taken from the terrain.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1370
---@param paths table[] Paths { points = {{x, y}, ...}, widths = {...} } in terrain grid coordinates.
function editor_heroRoadEditor_groupMgr.convertPathsToRoadGroups(paths) end

--- Copies a group's layer profile: non-automatic (serialized) layers and the marking, edge and cross-section flags/parameters (lanes, crown, shoulder, etc.).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:784
---@param sourceGroup table Source group.
---@return table  Copied profile, to pass to pasteGroupProfile.
function editor_heroRoadEditor_groupMgr.copyGroupProfile(sourceGroup) end

--- World frame of a crosswalk at normalized abscissa t01: center and ends of the roadway edges (p0 left, p1 right). Drives the placement ghost, the handles and the zebra strip. nil if the geometry is not ready.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1067
---@param group table Hero Road group.
---@param t01 number Normalized abscissa 0..1.
---@return vec3|nil  Center.
---@return vec3|nil  Left edge.
---@return vec3|nil  Right edge.
function editor_heroRoadEditor_groupMgr.crossingFrame(group, t01) end

--- Deep copy of the state of all groups.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1287
---@return table[]  List of copies.
function editor_heroRoadEditor_groupMgr.deepCopyAllGroups() end

--- Deep copy of a group via string.buffer (encode/decode), with the derived arrays (divPoints, divWidths, tangents, binormals, normals, discMap) emptied. Used for undo snapshots.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1275
---@param group table Group to copy.
---@return table  Independent copy.
function editor_heroRoadEditor_groupMgr.deepCopyGroup(group) end

--- Deserializes a group from a string.buffer blob or a session JSON table: fills missing fields with defaults (old saves), rehydrates the layers, converts nodes/normals to vec3 and marks dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1417
---@param data string|table Encoded blob or raw table.
---@param isCreateObject boolean|nil Flag passed by the caller (inferred from code).
---@return table  The reconstituted group.
function editor_heroRoadEditor_groupMgr.deserializeGroup(data, isCreateObject) end

--- Deserialization when loading a session: if the road is baked but its .dae files have disappeared, it is reloaded in editable mode (isEnabled = true, bakedManifest cleared).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1607
---@param gt table Group table read from the session file.
---@return table  The reconstituted group.
function editor_heroRoadEditor_groupMgr.deserializeSessionGroup(gt) end

--- Aligns the sparse array group.corners (per-corner overrides, false = auto) to the number of nodes: pads with false and truncates the excess.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:187
---@param group table Hero Road group.
---@return table  The group.corners array.
function editor_heroRoadEditor_groupMgr.ensureCornerArray(group) end

--- List of enabled (Edit) roads as { name, id, type = 'Hero Road' }.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1796
---@return table[]  Entries { name, id, type }.
function editor_heroRoadEditor_groupMgr.getCurrentRoadSplineList() end

--- Edit mode key of the tool: 'heroRoadEditor'.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:109
---@return string  Key.
function editor_heroRoadEditor_groupMgr.getEditModeKey() end

--- Current array of all groups (live references, not a copy).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:100
---@return table[]  List of groups.
function editor_heroRoadEditor_groupMgr.getGroups() end

--- Table group id to index in getGroups().
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:103
---@return table<string, integer>  Id to index map.
function editor_heroRoadEditor_groupMgr.getIdToIdxMap() end

--- Tool name prefix: 'Hero Road'.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:106
---@return string  Prefix.
function editor_heroRoadEditor_groupMgr.getToolPrefixStr() end

--- Indicates whether the profile is one-way (one side has zero lanes).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:197
---@param group table Hero Road group.
---@return boolean  true if lanesLeft or lanesRight is 0.
function editor_heroRoadEditor_groupMgr.isOneWayProfile(group) end

--- Joins two open roads into one: modifies group 1 with the joined geometry (geom.joinSplineGeometry), deletes group 2 and clears the terraform baseline. Does nothing if the indices are invalid.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1340
---@param groupIdx1 integer Index of the kept group.
---@param nodeIdx1 integer End node of group 1.
---@param groupIdx2 integer Index of the deleted group.
---@param nodeIdx2 integer End node of group 2.
function editor_heroRoadEditor_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2) end

--- Default values of a new intersection (also the reset values of the sliders).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:93
---@return table  { flareM = 4.0, lengthM = 8.0, bevelM = 2.5 }.
function editor_heroRoadEditor_groupMgr.junctionDefaults() end

--- Total extent (m) of an intersection: near bevel + throat + far bevel (2*bevelM + lengthM). Used for adjustment and meshing via the correspondence with the widening.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:97
---@param j table Intersection.
---@return number  Meters.
function editor_heroRoadEditor_groupMgr.junctionExtent(j) end

--- Pastes a profile onto a group: deletes its layers, takes the profile's layers and parameters (absent values keep those of the target or the defaults), marks dirty and recreates the automatic layers.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:898
---@param targetGroup table Target group.
---@param profile table Profile returned by copyGroupProfile.
function editor_heroRoadEditor_groupMgr.pasteGroupProfile(targetGroup, profile) end

--- Light rebuild for groundmodel painting: redoes the mesh (mesh.updateMesh) and reloads the collision. Does nothing if the road is disabled, of terrain type, without preview or has fewer than 2 nodes.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:532
---@param group table Hero Road group.
function editor_heroRoadEditor_groupMgr.rebuildSurfaceOnly(group) end

--- Recomputes the id to index map (called by the session helper after a load).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1615
function editor_heroRoadEditor_groupMgr.recomputeIdMap() end

--- Deletes all automatic (hidden) layers then recreates those whose flag is active (tire tracks, repairs, damaged asphalt, cracks, patches, centerline, edge/lane lines, edge fades), and marks the group dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:239
---@param group table Hero Road group.
function editor_heroRoadEditor_groupMgr.recreateAutoGeneratedLayers(group) end

--- Deletes all groups (isIncludeDisabled = true) or only the enabled (Edit) groups otherwise.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:167
---@param isIncludeDisabled boolean true to include the disabled/baked roads.
function editor_heroRoadEditor_groupMgr.removeAllGroups(isIncludeDisabled) end

--- Deletes the barrier at index idx.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1238
---@param group table Hero Road group.
---@param idx integer Index.
function editor_heroRoadEditor_groupMgr.removeBarrier(group, idx) end

--- Deletes the crosswalk at index idx and marks the group dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1113
---@param group table Hero Road group.
---@param idx integer Index.
function editor_heroRoadEditor_groupMgr.removeCrossing(group, idx) end

--- Deletes the group at index idx: restores terrain paint, undoes the terraform, deletes layers, mesh, sidewalks, furniture and scene folder, then recomputes the id map.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:135
---@param idx integer Index in getGroups().
function editor_heroRoadEditor_groupMgr.removeGroup(idx) end

--- Deletes the intersection at index idx.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1268
---@param group table Hero Road group.
---@param idx integer Index.
function editor_heroRoadEditor_groupMgr.removeJunction(group, idx) end

--- Deletes a group by its id (called from the deletion of a master spline layer).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:159
---@param splineId string Id (uuid) of the group.
function editor_heroRoadEditor_groupMgr.removeLinkedRoadSpline(splineId) end

--- Deletes the pothole at index idx.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1175
---@param group table Hero Road group.
---@param idx integer Index.
function editor_heroRoadEditor_groupMgr.removePothole(group, idx) end

--- Deletes the repair patch cluster at index idx.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1145
---@param group table Hero Road group.
---@param idx integer Index.
function editor_heroRoadEditor_groupMgr.removeRepair(group, idx) end

--- Deletes the widening at index idx.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1205
---@param group table Hero Road group.
---@param idx integer Index.
function editor_heroRoadEditor_groupMgr.removeWidening(group, idx) end

--- Serializes a group to a string.buffer blob after emptying its derived arrays (modifies the actual group).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1404
---@param group table Group to serialize.
---@return string  Encoded blob.
function editor_heroRoadEditor_groupMgr.serializeGroup(group) end

--- A group as a simple portable table for the session file: copy by the codec, without runtime keys, layers reduced to their author data.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1583
---@param group table Group to export.
---@return table  Exportable table (JSON).
function editor_heroRoadEditor_groupMgr.serializeGroupToTable(group) end

--- Sets the same width on all the group's nodes and marks it dirty. Overwritten by syncProfileWidth at the next rebuild (the lane profile is authoritative).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:539
---@param group table Hero Road group.
---@param width number Width in meters.
function editor_heroRoadEditor_groupMgr.setFixedWidth(group, width) end

--- Sets the number of lanes per side (and optionally their width), recomputes the roadway width and marks the group dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:547
---@param group table Hero Road group.
---@param lanesLeft integer Lanes on the left.
---@param lanesRight integer Lanes on the right.
---@param laneWidthM number|nil Lane width in meters (min 1.5).
function editor_heroRoadEditor_groupMgr.setLaneProfile(group, lanesLeft, lanesRight, laneWidthM) end

--- Redoes a change to a single group: applies the data.new state.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1774
---@param data table History data { old, new }.
function editor_heroRoadEditor_groupMgr.singleGroupEditRedo(data) end

--- Undoes a change to a single group: restores the data.old state (layers, parameters, placed elements) in the group with the same id.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1772
---@param data table History data { old, new }.
function editor_heroRoadEditor_groupMgr.singleGroupEditUndo(data) end

--- Cuts a road at the selected node. Loop: becomes a reordered open road. Otherwise: creates two new groups '(1)' and '(2)' (new ids, corner overrides kept, terraform baseline cleared) and deletes the old one.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1296
---@param group table Group to cut.
---@param groupIdx integer Index of the group in getGroups().
---@param selectedNodeIdx integer Index of the cut node.
function editor_heroRoadEditor_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx) end

--- Derives the roadway width from the lane profile: normalizes lanesLeft/lanesRight (integers >= 0, at least 1 lane in total), clamps laneWidthM to a 1.5 m minimum, sets leftExtM/rightExtM and the width of each node.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:204
---@param group table Hero Road group.
function editor_heroRoadEditor_groupMgr.syncProfileWidth(group) end

--- Normalized abscissa of a world point projected (in plan) onto the centerline, adjusted away from the ends. Used when dragging a handle. nil if the road has no ribbon.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1059
---@param group table Hero Road group.
---@param p vec3 World point.
---@param depthM number|nil Extent along the road used for the adjustment.
---@return number|nil  t01 or nil.
function editor_heroRoadEditor_groupMgr.tForPointOnGroup(group, p, depthM) end

--- Redoes a multi-group change (groupsData.new state).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1793
---@param groupsData table History data { old, new }.
function editor_heroRoadEditor_groupMgr.transGroupEditRedo(groupsData) end

--- Undoes a change touching several groups: deletes all groups and restores the copies from groupsData.old, all marked dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1791
---@param groupsData table History data { old, new } (lists of groups).
function editor_heroRoadEditor_groupMgr.transGroupEditUndo(groupsData) end

--- Rebuilds each group marked isDirty (and the dirty layers of the others), then marks the session as edited. Handles disabled/baked roads, groups with fewer than 2 nodes (clean everything), mesh roads, terrain roads, dragging and disabled preview. Called every frame by the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:402
---@param dragging boolean true while dragging a node/gizmo: only the ribbon edges are rebuilt.
function editor_heroRoadEditor_groupMgr.updateDirtyGroups(dragging) end

--- Default values of a new widening (also the reset values of the sliders).
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:87
---@return table  { widthM = 3.0, bayLenM = 30.0, taperInM = 40.0, taperOutM = 25.0 }.
function editor_heroRoadEditor_groupMgr.wideningDefaults() end

--- Total extent (m) along the road of a widening: entry taper + bay + exit taper.
---Source: lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:90
---@param w table Widening.
---@return number  Meters.
function editor_heroRoadEditor_groupMgr.wideningExtent(w) end

