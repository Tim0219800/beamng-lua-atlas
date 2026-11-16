---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- State manager of the Mesh Spline tool: holds the list of mesh splines (meshSplines) and the id-to-index table (splineMap). It creates, copies, cuts, joins, deletes, serializes and rebuilds the splines, applies presets, manages the links with the Master Spline and provides the editor's undo/redo callbacks. Each spline has a SimGroup folder in MissionGroup (not saved until it is "baked") and receives a UUID via Engine.generateUUID().
--- Access: extension `editor_meshSpline_splineMgr`: `extensions.load("editor_meshSpline_splineMgr")`, then the global `editor_meshSpline_splineMgr`
---@class editor_meshSpline_splineMgr
editor_meshSpline_splineMgr = {}

--- Adds a new empty mesh spline: unique name, UUID, scene folder, default flags (isEnabled, normalMode = 2, isAliasRoundRobin...), then applies the 'concrete_barrier' preset and updates the id-to-index table.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:610
function editor_meshSpline_splineMgr.addNewMeshSpline() end

--- One-shot action: places the control nodes on the surface below (vertical raycast) then marks the spline dirty. Construction stays free in 3D; rerun it after terraforming to re-snap.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1246
---@param spline table Spline to modify.
function editor_meshSpline_splineMgr.conformNodesToTerrain(spline) end

--- Converts paths drawn from a bitmap into mesh splines: one spline per path, points converted to world coordinates via the terrain editor, normals taken from the terrain. A path that is too small is not imported (the empty spline created stays in the list).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1256
---@param paths table[] Paths with points ({x,y} in grid) and widths.
function editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths) end

--- Copies a spline's profile (all its parameters without the nodes, widths, normals or derived geometry) to paste it onto another.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1083
---@param spline table Source spline.
---@return table  Copied profile.
function editor_meshSpline_splineMgr.copyMeshSplineProfile(spline) end

--- Deep copy of a spline (buffer.encode/decode), with the derived geometry tables cleared.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:707
---@param spline table Spline to copy.
---@return table  Independent copy.
function editor_meshSpline_splineMgr.deepCopyMeshSpline(spline) end

--- Deep copy of the full list of splines (for undo/redo history).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:719
---@return table  List of copies.
function editor_meshSpline_splineMgr.deepCopyMeshSplineState() end

--- Deserializes a spline. data is either the editor's encoded blob (string) or a table from a JSON session file; in the latter case the derived tables are created empty and the {x,y,z} positions become vec3 again before the first rebuild.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1180
---@param data string|table Blob or session table.
---@param isCreateObject boolean true to create the spline's scene SimGroup folder (unless a locked spline already keeps one after a Lua reload).
---@return table  The deserialized spline.
function editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject) end

--- Finds a live spline by its id.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:672
---@param id string UUID of the spline.
---@return table|nil  The spline, or nil if absent.
function editor_meshSpline_splineMgr.findMeshSpline(id) end

--- Returns the simplified list of active splines (isEnabled) for the interface: name, id and type.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1289
---@return table[]  Elements {name, id, type}.
function editor_meshSpline_splineMgr.getCurrentMeshSplineList() end

--- Returns the default parameters of the interface sliders (bounds, values).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:607
---@return table  Slider parameters.
function editor_meshSpline_splineMgr.getDefaultSliderParams() end

--- Returns the tool's edit mode key.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:476
---@return string  Edit mode key.
function editor_meshSpline_splineMgr.getEditModeKey() end

--- Returns the live table of mesh splines (not copied).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:479
---@return table  List of splines, 1-based.
function editor_meshSpline_splineMgr.getMeshSplines() end

--- Returns the live id-to-index table of the splines.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:482
---@return table<string, integer>  Index by id.
function editor_meshSpline_splineMgr.getSplineMap() end

--- Returns the tool's name prefix ("Mesh Spline").
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:473
---@return string  Tool prefix.
function editor_meshSpline_splineMgr.getToolPrefixStr() end

--- Tells whether the spline with the given id is linked to a Master Spline.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1303
---@param id string UUID of the spline.
---@return boolean  true if linked, false otherwise (or if absent).
function editor_meshSpline_splineMgr.isLinked(id) end

--- Joins two open mesh splines into one: the concatenated geometry (geom.joinSplineGeometry) is written into the first, the second is deleted. Does nothing if an index is invalid or if the nodes do not allow the join.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:885
---@param splineIdx1 integer Index of the first spline.
---@param nodeIdx1 integer End node of the first.
---@param splineIdx2 integer Index of the second spline.
---@param nodeIdx2 integer End node of the second.
function editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Redo callback for an object selection operation: puts data.new back in place of the spline with the same id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1080
---@param data table Action data with old and new.
function editor_meshSpline_splineMgr.objectSelectRedo(data) end

--- Undo callback for an object selection operation: puts data.old back in place of the spline with the same id, removes its meshes and marks it dirty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1077
---@param data table Action data with old and new.
function editor_meshSpline_splineMgr.objectSelectUndo(data) end

--- Pastes a profile onto the spline: first removes its meshes, takes the profile's parameters (normalMode, spacing, jitter, vertical offset, etc.) and marks the spline dirty.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1098
---@param spline table Target spline.
---@param profile table Profile returned by copyMeshSplineProfile.
function editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile) end

--- Redoes the choice of a preset (removes the meshes before applying the new state).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1029
---@param meshSplineData table Action data.
function editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData) end

--- Undoes the choice of a preset (removes the meshes before applying the old state).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1015
---@param meshSplineData table Action data.
function editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData) end

--- Recomputes the id-to-index table (called by the session utility after a load that adds splines).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1063
function editor_meshSpline_splineMgr.recomputeIdMap() end

--- Deletes all the splines. With isIncludeDisabled true, including locked and linked ones; otherwise only the active non-linked ones.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:688
---@param isIncludeDisabled boolean true to delete everything.
function editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled) end

--- Deletes a linked spline by its id (called when a Master Spline layer is removed). Does nothing if the id is unknown.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:678
---@param splineId string UUID of the spline.
function editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId) end

--- Deletes the spline at the given index: its meshes, its scene folder, then the list entry; updates the id-to-index table. Crashes if the index does not exist (the spline is read without a test before tryRemove).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:656
---@param idx integer Spline index (1-based).
function editor_meshSpline_splineMgr.removeMeshSpline(idx) end

--- Serializes a spline for the editor buffer: first clears the derived tables of the live spline (which is therefore modified), then returns buffer.encode(spline).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1158
---@param spline table Spline to serialize.
---@return string  Encoded data (inferred from code).
function editor_meshSpline_splineMgr.serializeMeshSpline(spline) end

--- Serializes a spline into a simple, portable table for a session file (toolUtilities/session). Deep copy via the codec so the live spline is never modified; the derived geometry is cleared (rebuilt afterwards) and the scene handle removed.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1171
---@param spline table Spline to serialize.
---@return table  JSON-compatible table.
function editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline) end

--- Enables or disables a spline's link (isLink, linkId), removes its meshes and marks it dirty. Does nothing if the id is unknown.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1309
---@param id string UUID of the spline.
---@param groupId string Identifier of the link group, used as linkId if isLink is true.
---@param isLink boolean true to link, false to unlink.
function editor_meshSpline_splineMgr.setLink(id, groupId, isLink) end

--- Places the spline at the given index, creates its scene folder (SimGroup in MissionGroup, cansave = false) if it does not exist and marks it dirty.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:485
---@param spline table Spline to register.
---@param idx integer Destination index (1-based).
function editor_meshSpline_splineMgr.setMeshSpline(spline, idx) end

--- Registers all the splines of the table at their indices (calls setMeshSpline for each).
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:505
---@param splines table List of splines.
function editor_meshSpline_splineMgr.setMeshSplines(splines) end

--- Applies a preset (central mesh, caps, spacing, offsets, etc., from the presets table) to the spline: first removes its meshes from the scene, copies the preset parameters, measures the mesh and marks the spline dirty. Does nothing if the spline or the name is nil; an unknown name just clears it and marks it dirty.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:512
---@param spline table Target spline.
---@param presetStr string Preset name, for example 'concrete_barrier'.
function editor_meshSpline_splineMgr.setPreset(spline, presetStr) end

--- Redo callback for the edit of a single spline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1007
---@param meshSplineData table Action data containing the new state.
function editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData) end

--- Undo callback for the edit of a single spline (editor history).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:999
---@param meshSplineData table Action data containing the old state.
function editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData) end

--- Cuts the selected spline in two at the selected node. A looped spline is simply opened at the cut point. Otherwise the original spline is deleted and replaced by two new splines named <name>_split_A and <name>_split_B that take over its parameters.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:728
---@param selectedSplineIdx integer Spline index (1-based).
---@param selectedNodeIdx integer Index of the cut node (1-based).
function editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx) end

--- Redoes a cross-cutting edit across several mesh splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1053
---@param data table Action data.
function editor_meshSpline_splineMgr.transSplineEditRedo(data) end

--- Undoes a cross-cutting edit across several mesh splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1043
---@param data table Action data.
function editor_meshSpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all the mesh splines (isLink = false, linkId = nil) and marks them dirty.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1347
function editor_meshSpline_splineMgr.unlinkAll() end

--- Rebuilds the splines marked dirty: fewer than 2 nodes, removes meshes and geometry; otherwise recomputes the geometry (populationEngine.updateGeometry), repopulates the meshes (populate.populateMeshSpline) and updates roadLength. Then signals an edit to the "meshSpline" session.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1218
function editor_meshSpline_splineMgr.updateDirtyMeshSplines() end

--- Updates a linked spline with the Master Spline's geometry (nodes, widths, nmls, isLoop, isConformToTerrain). If there are fewer than 2 points, clears the derived geometry and removes the meshes. Marks the spline dirty.
---Source: lua/ge/extensions/editor/meshSpline/splineMgr.lua:1324
---@param id string UUID of the linked spline.
---@param points table Nodes.
---@param widths table Widths per node.
---@param nmls table Normals per node.
---@param isLoop boolean Looped spline.
---@param isConformToTerrain boolean Conforms to the surface below.
function editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

