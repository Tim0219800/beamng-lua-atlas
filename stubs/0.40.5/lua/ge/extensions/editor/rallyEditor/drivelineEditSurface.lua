---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editing toolbox for the driveline spline (rally driving line) for the rally editor. All functions take a "host" (the window that owns host.drivelineV3, host.selectedNodeIdx, host.dragState, host.path) and an optional opts table of callbacks (onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked/isInputBlocked, generateFinal). handleSplineInteraction handles the mouse: hover/move a node (click-drag), insert a node on the curve, add a node at the start or end (the nearest), delete the selected node with the Delete key (if more than 2 nodes). Each change is recorded in editor.history with a deep before/after copy of the spline (nodes, widths, nmls).
--- Access: extension `editor_rallyEditor_drivelineEditSurface`: `extensions.load("editor_rallyEditor_drivelineEditSurface")`, then the global `editor_rallyEditor_drivelineEditSurface`
---@class editor_rallyEditor_drivelineEditSurface
editor_rallyEditor_drivelineEditSurface = {}

--- Records in editor.history an action with the old spline and a copy of the current one; undo and redo call onHistoryRestore(host, actionName, 'undo'|'redo') if provided. Then calls opts.onCommit.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:82
---@param host table Object carrying drivelineV3.
---@param actionName string History action name.
---@param oldSpline table Copy of the spline before modification.
---@param opts table|nil Optional callbacks.
function editor_rallyEditor_drivelineEditSurface.commitSplineEdit(host, actionName, oldSpline, opts) end

--- Generates the final driveline from the spline (drivelineV3:createDrivelineFromSpline).
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:135
---@param host table Object carrying drivelineV3.
---@return boolean  Generation result; false if host.drivelineV3 is missing.
function editor_rallyEditor_drivelineEditSurface.createFinalDriveline(host) end

--- Call every frame: handles the mouse on the spline (hover, node drag, insertion, addition, deletion with Delete). Does nothing if ImGui captures the mouse, if input is blocked or if the mouse is not over the map.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:162
---@param host table Object carrying drivelineV3 (spline.nodes/widths/nmls, updateSplineGeometry...), selectedNodeIdx, dragState, deletePressed.
---@param opts table|nil Callbacks: onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked, isInputBlocked, generateFinal.
function editor_rallyEditor_drivelineEditSurface.handleSplineInteraction(host, opts) end

--- Redoes an edit: restores data.new.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:77
---@param host table Object carrying drivelineV3.
---@param data table|nil Action data {old, new}.
function editor_rallyEditor_drivelineEditSurface.redoSplineEdit(host, data) end

--- If the spline is dirty and has at least 2 nodes, recomputes its geometry, regenerates the final driveline (unless opts.generateFinal == false) and calls onSplineMutated.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:100
---@param host table Object carrying drivelineV3.
---@param opts table|nil Optional callbacks.
---@return boolean  true if the geometry was updated.
function editor_rallyEditor_drivelineEditSurface.refreshSplineGeometry(host, opts) end

--- Replaces the host spline's content (nodes, widths, nmls) with a saved copy, marks it dirty then recomputes the geometry and the final driveline.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:48
---@param host table Object carrying drivelineV3.
---@param saved table Saved spline {nodes, widths, nmls} (by drivelineV3:deepCopySpline).
function editor_rallyEditor_drivelineEditSurface.restoreSpline(host, saved) end

--- Saves the spline to a file in the notebook's mission folder (drivelineV3:saveSplineToFile) after checking the prerequisites.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:140
---@param host table Object carrying drivelineV3 and path (with getMissionDir()).
---@return boolean  true if the save succeeded.
function editor_rallyEditor_drivelineEditSurface.saveFinalDriveline(host) end

--- Simplifies the spline (Ramer-Douglas-Peucker algorithm on nodes, widths and normals) with a tolerance, updates the geometry and records the "Simplify Spline" action. No effect with 2 nodes or fewer.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:115
---@param host table Object carrying drivelineV3.
---@param tolerance number Simplification tolerance (meters, inferred from code).
---@param opts table|nil Optional callbacks.
---@return boolean  true if the spline was simplified.
function editor_rallyEditor_drivelineEditSurface.simplifySpline(host, tolerance, opts) end

--- Undoes an edit: restores data.old.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:72
---@param host table Object carrying drivelineV3.
---@param data table|nil Action data {old, new}.
function editor_rallyEditor_drivelineEditSurface.undoSplineEdit(host, data) end

