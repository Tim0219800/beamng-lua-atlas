---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Spline manager of the Drive Path Editor (prefix "Drive Path Spline", edit mode drivePathSplineEditMode). A path spline describes a route for an AI: nodes, widths, normals, speeds (vels) and speed limits (velLimits) in free mode, or a list of navgraph nodes (graphNodes/graphPath) in graph mode. The module holds the list of splines and the id-to-index table, handles creation, deletion, splitting, joining, reversing, undo/redo, serialization, spline-vehicle links (which move the vehicle back to the start) and the map's navgraph cache (map.getGraphpath()).
--- Access: extension `editor_drivePathEditor_splineMgr`: `extensions.load("editor_drivePathEditor_splineMgr")`, then the global `editor_drivePathEditor_splineMgr`
---@class editor_drivePathEditor_splineMgr
editor_drivePathEditor_splineMgr = {}

--- Appends a new empty spline with a unique name, an Engine.generateUUID() UUID and the default parameters.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:202
function editor_drivePathEditor_splineMgr.addNewDrivePathSpline() end

--- Rebuilds the list of active scene vehicles (activeVehiclesIterator) with vid, veh, name and links reset.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:84
function editor_drivePathEditor_splineMgr.computeActiveVehicles() end

--- Converts paths from an image into splines (see notes for the cases of paths that are too small).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:967
---@param paths table array of {points, widths}
function editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths) end

--- Deep copy of a spline (for history).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:283
---@param spline table spline
---@return table  copy
function editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline) end

--- Deep copy of all splines.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:350
---@return table  array of copies
function editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState() end

--- Rebuilds a spline from a serialized table.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:811
---@param data table table produced by serializeDrivePathSpline
---@return table  spline
function editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data) end

--- Reverses the direction of a spline: nodes, widths, normals, speeds and speed limits are reversed.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:577
---@param spline table spline
function editor_drivePathEditor_splineMgr.flipSpline(spline) end

--- Returns the list of active vehicles; recomputes it if it is empty or if isForce is true.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:94
---@param isForce boolean|nil force recomputation
---@return table  array of {vid, veh, name, isLink, linkSplineId}
function editor_drivePathEditor_splineMgr.getActiveVehicles(isForce) end

--- Returns the default values of the spline parameters.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:183
---@return table  default parameters
function editor_drivePathEditor_splineMgr.getDefaultSliderParams() end

--- Returns the splines table (reference).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:65
---@return table  array of splines
function editor_drivePathEditor_splineMgr.getDrivePathSplines() end

--- Returns the edit mode key ("drivePathSplineEditMode").
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:62
---@return string  key
function editor_drivePathEditor_splineMgr.getEditModeKey() end

--- Returns the map's navgraph data (cache), computing it on the first call if possible.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:141
---@return table|nil  {graph, nodes, widths, lines} or nil if the graph is not yet available
function editor_drivePathEditor_splineMgr.getNavGraph() end

--- Returns the spline id to index table.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:68
---@return table<string, integer>  id to index
function editor_drivePathEditor_splineMgr.getSplineMap() end

--- Returns the tool prefix ("Drive Path Spline").
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:59
---@return string  prefix
function editor_drivePathEditor_splineMgr.getToolPrefixStr() end

--- Looks for a vehicle in the already computed list (without recomputing it).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:102
---@param vid integer vehicle id
---@return table|nil  vehicle entry
function editor_drivePathEditor_splineMgr.getVehicleById(vid) end

--- Joins two non-looped splines: the first receives the concatenated geometry, the second is removed.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:486
---@param splineIdx1 integer spline kept
---@param nodeIdx1 integer end node of the first
---@param splineIdx2 integer spline removed
---@param nodeIdx2 integer end node of the second
function editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Links a spline to a vehicle (isVehicleLink, linkVehId, linkSplineId) and moves the vehicle back to the start.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:635
---@param spline table spline
---@param vehicle table vehicle entry
function editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle) end

--- Relinks all splines to their vehicle (via linkVehId) by searching the computed vehicle list.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:673
function editor_drivePathEditor_splineMgr.relinkAllVehiclesToSplines() end

--- Removes splines. With isIncludeDisabled true, all of them; otherwise only the enabled ones.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:264
---@param isIncludeDisabled boolean include disabled splines
function editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled) end

--- Removes the spline at the given index and updates the index table.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:256
---@param idx integer index (1-based)
function editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx) end

--- Clears all the geometry of a spline (nodes, widths, nmls, vels, velLimits, graphNodes, graphPath) and marks it isDirty.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:186
---@param spline table|nil spline
function editor_drivePathEditor_splineMgr.resetGeometry(spline) end

--- Places the vehicle at the spline's start node (startingNode), oriented along the neighboring nodes, with a 0.3 m vertical offset. Stores its original pose only once. In graph mode, uses the navgraph nodes (requires the cache).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:602
---@param spline table spline
---@param vehicle table vehicle entry {vid, veh...}
function editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle) end

--- Serializes a spline into a table.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:756
---@param spline table spline
---@return table  serialized data
function editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline) end

--- Places a spline at an index and marks it isDirty.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:71
---@param spline table spline
---@param idx integer index (1-based)
function editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx) end

--- Places all splines of an array (each marked isDirty).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:77
---@param splines table array of splines
function editor_drivePathEditor_splineMgr.setDrivePathSplines(splines) end

--- Redoes a single spline edit from drivePathSplineData.new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:724
---@param drivePathSplineData table {old, new}
function editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData) end

--- Undoes a single spline edit from drivePathSplineData.old, then relinks the vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:716
---@param drivePathSplineData table {old, new}
function editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData) end

--- Splits a spline in two at the given node (1.0 m gap between the two parts).
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:360
---@param selectedSplineIdx integer spline index
---@param selectedNodeIdx integer index of the split node
function editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx) end

--- Redoes a global edit with data.new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:744
---@param data table {old, new}
function editor_drivePathEditor_splineMgr.transSplineEditRedo(data) end

--- Undoes a global edit (all splines) with data.old.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:732
---@param data table {old, new}
function editor_drivePathEditor_splineMgr.transSplineEditUndo(data) end

--- Removes the spline-vehicle link and gives the vehicle back its stored original pose.
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:646
---@param spline table spline
---@param vehicle table vehicle entry
function editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle) end

--- Recomputes the geometry of isDirty splines (terrain raycasts, speed bars, ribbon in free mode; graph path in navgraph mode). Called every frame by onEditorGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:913
function editor_drivePathEditor_splineMgr.updateDirtyDrivePathSplines() end

