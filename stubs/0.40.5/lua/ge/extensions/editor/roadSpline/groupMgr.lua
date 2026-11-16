---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/groupMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the "groups" of the Road Spline tool: a group = a road (nodes, widths, normals, layers, automatic layer options, terrain painting, locking) with its SimGroup folder in MissionGroup. Handles creation/deletion, rebuilding of dirty groups (updateDirtyGroups: Catmull-Rom sampling or "engineered" geometry, rib points, then layers), deep copy, cutting/joining, serialization (buffer or session JSON table), undo/redo and linking with the Master Spline. A modder uses it to create or modify roads by script.
--- Access: extension `editor_roadSpline_groupMgr`: `extensions.load("editor_roadSpline_groupMgr")`, then the global `editor_roadSpline_groupMgr`
---@class editor_roadSpline_groupMgr
editor_roadSpline_groupMgr = {}

--- Adds an already built group to the list, with a unique name; creates its SimGroup folder (cansave = false) in MissionGroup if it does not exist yet.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:55
---@param group table Group to add.
function editor_roadSpline_groupMgr.addGroupToGroupArray(group) end

--- Creates a new empty group (unique name, UUID, transient SimGroup folder under MissionGroup, initial automatic layers) and adds it to the list.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:281
---@param name string|nil Base name; default "Road Spline N".
function editor_roadSpline_groupMgr.addNewGroup(name) end

--- Takes back the DecalRoads listed by release() (only those still present in the scene) and sets the applied lock state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:129
---@param group table Recreated group.
---@param ids table Value returned by release().
function editor_roadSpline_groupMgr.adopt(group, ids) end

--- Converts paths from a bitmap into Road Splines: grid points converted to world coordinates via the terrain, normals taken from the terrain; a path whose smallest dimension is less than or equal to 10 m is not imported.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:567
---@param paths table[] List of {points = {{x=,y=},...}, widths = {...}} in grid coordinates.
function editor_roadSpline_groupMgr.convertPathsToRoadGroups(paths) end

--- Copies the "profile" of a group: its non-hidden layers (serializeLayer, without scene ids) and its automatic layer options/settings (widths and offsets of lines and fades).
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:381
---@param sourceGroup table Source group.
---@return table  Profile ready for pasteGroupProfile or JSON.
function editor_roadSpline_groupMgr.copyGroupProfile(sourceGroup) end

--- Deep copy of all groups (for the undo history).
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:483
---@return table[]  List of copies.
function editor_roadSpline_groupMgr.deepCopyAllGroups() end

--- Deep copy of a group via string.buffer; empties the derived geometry (divPoints, divWidths, tangents, binormals, normals, discMap, divCurv) which will be recomputed.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:470
---@param group table Group.
---@return table  Independent copy.
function editor_roadSpline_groupMgr.deepCopyGroup(group) end

--- Deserializes a group, either from a blob (string) or from a JSON table: guarantees all tables, rehydrates the layers and vec3s, fills in the default values of the edge decor and creates the scene folder if requested (unless a kept folder still exists). Marks the group dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:632
---@param data string|table string.buffer blob or session table.
---@param isCreateObject boolean true to create the SimGroup folder in MissionGroup.
---@return table  The group ready to be added.
function editor_roadSpline_groupMgr.deserializeGroup(data, isCreateObject) end

--- Looks up a group by id.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:143
---@param id string UUID of the group.
---@return table|nil  The group or nil.
function editor_roadSpline_groupMgr.findGroup(id) end

--- Lists the active Road Splines (isEnabled), for the link menus of other tools.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:785
---@return table[]  Elements { name, id, type = "Road Spline" }.
function editor_roadSpline_groupMgr.getCurrentRoadSplineList() end

--- Returns the tool's edit mode key ("roadSplineEditor").
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:52
---@return string  "roadSplineEditor"
function editor_roadSpline_groupMgr.getEditModeKey() end

--- Returns the live array of the tool's groups (roads).
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:43
---@return table[]  List of groups, modifiable in place.
function editor_roadSpline_groupMgr.getGroups() end

--- Returns the table group id -> index in getGroups().
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:46
---@return table<string, integer>  Live table.
function editor_roadSpline_groupMgr.getIdToIdxMap() end

--- Returns the tool's name prefix ("Road Spline").
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:49
---@return string  "Road Spline"
function editor_roadSpline_groupMgr.getToolPrefixStr() end

--- Indicates whether the road is linked to a Master Spline.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:798
---@param id string UUID of the group.
---@return boolean  true if linked (false if unknown).
function editor_roadSpline_groupMgr.isLinked(id) end

--- Joins two non-looped roads into one: group1 is modified, group2 is deleted. Does nothing if a group is not found or if the node indices are invalid.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:538
---@param groupIdx1 integer Index of the first group.
---@param nodeIdx1 integer End node of the first group.
---@param groupIdx2 integer Index of the second group.
---@param nodeIdx2 integer End node of the second group.
function editor_roadSpline_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2) end

--- Applies a profile to the target group: deletes its layers, recreates those of the profile, copies the options (default values if absent), then regenerates the automatic layers and marks the group dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:426
---@param targetGroup table Target group.
---@param profile table Profile from copyGroupProfile.
function editor_roadSpline_groupMgr.pasteGroupProfile(targetGroup, profile) end

--- Recomputes the id -> index table (called by the session helper after a load that adds roads).
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:782
function editor_roadSpline_groupMgr.recomputeIdMap() end

--- Deletes the hidden (automatic) layers then recreates those whose group option is active (tire marks, repairs, cracks, patches, damaged asphalt, centerline, edge/lane lines, edge fades 1 to 3), and marks the group dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:177
---@param group table Group.
function editor_roadSpline_groupMgr.recreateAutoGeneratedLayers(group) end

--- Before a Lua reload: returns, by layer id, the DecalRoad ids of the locked group, so that adopt() takes them back afterwards (roads, folder and painting stay in the scene).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:120
---@param group table Group.
---@return table  { [layerId] = {id = decalRoadId, ids = {...}} }
function editor_roadSpline_groupMgr.release(group) end

--- Deletes the groups. With isIncludeDisabled, deletes everything and empties the list; otherwise only the enabled and unlinked groups (locked and linked ones stay).
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:157
---@param isIncludeDisabled boolean|nil true to delete everything, including locked and linked ones.
function editor_roadSpline_groupMgr.removeAllGroups(isIncludeDisabled) end

--- Deletes the group at the given index: undoes the terrain painting, deletes its layers (DecalRoads) and its scene folder, then recomputes the id -> index table.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:75
---@param idx integer Index in the list of groups.
function editor_roadSpline_groupMgr.removeGroup(idx) end

--- Deletes a linked spline by its id (called when the corresponding Master Spline layer is removed).
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:149
---@param splineId string UUID of the group.
function editor_roadSpline_groupMgr.removeLinkedRoadSpline(splineId) end

--- Serializes a group into a string.buffer blob: undoes the terrain painting if enabled and empties the derived tables before encoding.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:600
---@param group table Group.
---@return string  Encoded data.
function editor_roadSpline_groupMgr.serializeGroup(group) end

--- Serializes a group into a portable table for a JSON session file: without derived geometry or scene handles, layers reduced to the authoring fields (serializeLayer). The live group is not modified.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:615
---@param group table Group.
---@return table  JSON-compatible table.
function editor_roadSpline_groupMgr.serializeGroupToTable(group) end

--- Sets the same width on every node of the group and marks it dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:273
---@param group table Group.
---@param width number Width in meters.
function editor_roadSpline_groupMgr.setFixedWidth(group, width) end

--- Enables or disables the link of a road with another spline (linkId field) and marks it dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:804
---@param id string UUID of the road.
---@param groupId string UUID of the master spline (ignored if isLink is false).
---@param isLink boolean true to link.
function editor_roadSpline_groupMgr.setLink(id, groupId, isLink) end

--- Redo of an edit of a single group: restores data.new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:760
---@param data table { old = group, new = group }
function editor_roadSpline_groupMgr.singleGroupEditRedo(data) end

--- Undo of an edit of a single group: restores data.old (layers copied back, all fields of the road, painting, folder name if renamed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:759
---@param data table { old = group, new = group }
function editor_roadSpline_groupMgr.singleGroupEditUndo(data) end

--- Cuts a group at the given node. A loop becomes a reordered open road; an open road is replaced by two new groups "name (1)" and "name (2)" (new UUIDs). The per-corner settings (corners) follow.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:492
---@param group table Group to cut.
---@param groupIdx integer Group index.
---@param selectedNodeIdx integer Index of the cut node.
function editor_roadSpline_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx) end

--- Redo of a multi-group edit: reinserts the copies of groupsData.new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:779
---@param groupsData table { old = groups[], new = groups[] }
function editor_roadSpline_groupMgr.transGroupEditRedo(groupsData) end

--- Undo of an edit touching several groups: deletes all groups and reinserts the copies of groupsData.old.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:778
---@param groupsData table { old = groups[], new = groups[] }
function editor_roadSpline_groupMgr.transGroupEditUndo(groupsData) end

--- Detaches all linked roads (isLink = false, linkId = nil) and marks all groups dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:828
function editor_roadSpline_groupMgr.unlinkAll() end

--- Rebuilds the groups marked dirty (isDirty): ignores groups with fewer than 2 nodes (layers deleted), snaps the nodes to the terrain (vertical raycast), samples the spline (Catmull-Rom, or clothoid in engineered mode), computes the rib points and the length, repaints the terrain if active, regenerates the automatic layers and updates the DecalRoads. Also updates the individual layers marked dirty. During a handle drag, only the sampling is done and the group stays dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:204
---@param dragging boolean|nil true during a live drag (heavy rebuild deferred).
function editor_roadSpline_groupMgr.updateDirtyGroups(dragging) end

--- Replaces the geometry (nodes, widths, normals, loop) of a linked road and marks it dirty.
---Source: lua/ge/extensions/editor/roadSpline/groupMgr.lua:818
---@param id string UUID of the linked road.
---@param points vec3[] New nodes.
---@param widths number[] Widths in m.
---@param nmls vec3[] Normals.
---@param isLoop boolean Loop state of the master.
---@param isConformToTerrain boolean Received but not used in the code.
function editor_roadSpline_groupMgr.updateLinkedRoadSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

