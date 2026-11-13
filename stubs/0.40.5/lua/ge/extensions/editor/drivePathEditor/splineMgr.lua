---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_drivePathEditor_splineMgr` : `extensions.load("editor_drivePathEditor_splineMgr")`, puis la globale `editor_drivePathEditor_splineMgr`
---@class editor_drivePathEditor_splineMgr
editor_drivePathEditor_splineMgr = {}

--- Adds a new drive path spline.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:202
function editor_drivePathEditor_splineMgr.addNewDrivePathSpline() end

--- Computes the active vehicles in the scene.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:84
function editor_drivePathEditor_splineMgr.computeActiveVehicles() end

--- Converts the given paths (traced from a bitmap) to drive path splines.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:967
---@param paths any
function editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths) end

--- Deep copies the given drive path spline.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:283
---@param spline any
function editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline) end

--- Deep copies the full drive path spline state.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:350
function editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState() end

--- Deserializes a drive path spline from a table.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:811
---@param data any
function editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data) end

--- Flips the geometry of the given drive path spline, such that the nodes are reversed (and so are the widths, normals, velocities and velocity limits).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:577
---@param spline any
function editor_drivePathEditor_splineMgr.flipSpline(spline) end

--- Returns the active vehicles.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:94
---@param isForce any
function editor_drivePathEditor_splineMgr.getActiveVehicles(isForce) end

--- Returns the default slider parameters.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:183
function editor_drivePathEditor_splineMgr.getDefaultSliderParams() end

--- Fetches the drive path splines.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:65
function editor_drivePathEditor_splineMgr.getDrivePathSplines() end

--- Fetches the edit mode key.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:62
function editor_drivePathEditor_splineMgr.getEditModeKey() end

--- Gets the nav graph.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:141
function editor_drivePathEditor_splineMgr.getNavGraph() end

--- Fetches the drive path spline map.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:68
function editor_drivePathEditor_splineMgr.getSplineMap() end

--- Fetches the tool prefix string.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:59
function editor_drivePathEditor_splineMgr.getToolPrefixStr() end

--- Returns the vehicle with the given Id.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:102
---@param vid any
function editor_drivePathEditor_splineMgr.getVehicleById(vid) end

--- Joins two unlooped Drive Path Splines into one, modifying spline1 and deleting spline2.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:486
---@param splineIdx1 any
---@param nodeIdx1 any
---@param splineIdx2 any
---@param nodeIdx2 any
function editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Links the given drive path spline to the given vehicle.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:635
---@param spline any
---@param vehicle any
function editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle) end

--- Re-link all the vehicles to the drive path splines.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:673
function editor_drivePathEditor_splineMgr.relinkAllVehiclesToSplines() end

--- Removes all drive path splines.
---  [If isIncludeDisabled is true, then all drive path splines will be removed, including disabled ones.]
---  [If isIncludeDisabled is false, then only enabled drive path splines will be removed.]
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:264
---@param isIncludeDisabled any
function editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled) end

--- Removes the drive path spline with the given index.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:256
---@param idx any
function editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx) end

--- Resets all the geometry of the given drive path spline.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:186
---@param spline any
function editor_drivePathEditor_splineMgr.resetGeometry(spline) end

--- Sets the pose of the given vehicle to the first node of the given drive path spline, pointing towards the second node.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:602
---@param spline any
---@param vehicle any
function editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle) end

--- Serializes a drive path spline to a table.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:756
---@param spline any
function editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline) end

--- Sets the drive path spline with the given index.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:71
---@param spline any
---@param idx any
function editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx) end

--- Sets the drive path splines (full table).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:77
---@param splines any
function editor_drivePathEditor_splineMgr.setDrivePathSplines(splines) end

--- Handles the redo for a single drive path spline.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:724
---@param drivePathSplineData any
function editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData) end

--- Handles the undo for a single drive path spline.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:716
---@param drivePathSplineData any
function editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData) end

--- Splits the selected drive path spline into two, at the selected node.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:360
---@param selectedSplineIdx any
---@param selectedNodeIdx any
function editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx) end

--- Handles the redo for trans drive path spline edits.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:744
---@param data any
function editor_drivePathEditor_splineMgr.transSplineEditRedo(data) end

--- Handles the undo for trans drive path spline edits.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:732
---@param data any
function editor_drivePathEditor_splineMgr.transSplineEditUndo(data) end

--- Unlinks the given drive path spline from its vehicle.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:646
---@param spline any
---@param vehicle any
function editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle) end

--- Updates the geometry of any dirty drive path splines.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:913
function editor_drivePathEditor_splineMgr.updateDirtyDrivePathSplines() end

