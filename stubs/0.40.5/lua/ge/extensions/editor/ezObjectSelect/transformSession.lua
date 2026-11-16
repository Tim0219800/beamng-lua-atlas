---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformSession.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transform session (move, rotate, scale) of the selected objects for Easy Object Select. begin() stores the initial transform and scale of each selected object; the update* functions reposition the objects from the initial state (not cumulative); finish() records the result in the editor history (SetObjectTransform / SetObjectScale, undoable, in a transaction); cancel() restores everything. Also handles prefab offset updates and reset to upright.
--- Access: extension `editor_ezObjectSelect_transformSession`: `extensions.load("editor_ezObjectSelect_transformSession")`, then the global `editor_ezObjectSelect_transformSession`
---@class editor_ezObjectSelect_transformSession
editor_ezObjectSelect_transformSession = {}

--- Opens a session on all objects of editor.selection.object. Returns false if a session already exists, if the anchor is not selected or if an object cannot be manipulated.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:133
---@param anchorObject userdata Anchor object (its position is the reference for surface grabbing and distance).
---@param options table|nil historyName (string, name of the history transaction, default "EasySelectDrag").
---@return boolean  true if the session is open.
function editor_ezObjectSelect_transformSession.begin(anchorObject, options) end

--- Cancels the session and restores the initial transform and scale of each object.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:458
---@return boolean  true if a session was active.
function editor_ezObjectSelect_transformSession.cancel() end

--- Ends the session: if there is a net change, opens a history transaction and records a SetObjectTransform and/or SetObjectScale action per object; otherwise restores the initial state.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:364
---@return boolean|nil  true if change committed, false if no change (or no session), nil if the transaction could not be opened.
---@return table|nil  {anchorDistance} (m) when there is a change.
function editor_ezObjectSelect_transformSession.finish() end

--- Computes the desired anchor position for a surface point (surface - grabOffset), with optional grid snapping.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:191
---@param surfacePosition vec3 Surface point under the cursor.
---@param options table|nil gridSize (m), gridRelative (boolean), snapZ (boolean).
---@return vec3|boolean  Anchor position, or false if no session / no grabOffset / no point.
function editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options) end

--- IDs of the session's objects.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:557
---@return integer[]  List of IDs (empty without a session).
function editor_ezObjectSelect_transformSession.getObjectIds() end

--- Indicates whether a session is open.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:539
---@return boolean  true if active.
function editor_ezObjectSelect_transformSession.isActive() end

--- Resets the objects to upright (world Z axis) while keeping their heading, in a "ResetObjectRotation" history transaction. Refuses if a session is active.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:497
---@param objectIds integer[] IDs of the objects to straighten.
---@return boolean  true if at least one object changed.
function editor_ezObjectSelect_transformSession.resetRotation(objectIds) end

--- Checks that the editor selection is still exactly the session's selection and that the objects remain manipulable.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:543
---@return boolean  true without a session or if the selection matches.
function editor_ezObjectSelect_transformSession.selectionMatches() end

--- Sets the offset between the grabbed surface point and the anchor position.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:162
---@param surfacePosition vec3 Grabbed surface point.
---@param maintainRelativeZ boolean|nil If false, the vertical offset is set to 0.
---@param verticalOffset number|nil If provided, forces the vertical offset (takes precedence over maintainRelativeZ).
---@return boolean  false without a session or without surfacePosition.
function editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset) end

--- Moves the selection so that the anchor follows a surface point; can align each object to the surface normal and use an individual position/normal provider.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:331
---@param surfacePosition vec3 Surface point under the cursor.
---@param surfaceNormal vec3|nil Surface normal.
---@param options table gridSize, gridRelative, snapZ, followRotation (boolean), rotateSnapSize (degrees), rotateRelative (boolean), individualProvider (function(entry, position) -> {position, normal}|nil). The parameter must be a table (inferred from code: options.followRotation is read without a guard).
---@return boolean  false if no session or no grabOffset.
function editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options) end

--- Translates all objects by delta relative to their initial position, with optional grid snapping (per-axis mask, absolute or relative).
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:198
---@param delta vec3 Displacement in meters, world space.
---@param options table|nil gridSize (m), gridPivot (vec3), gridMask ({x,y,z} booleans), gridRelative (boolean), snapZ (boolean).
---@return boolean  false without a session or without delta.
function editor_ezObjectSelect_transformSession.updateDelta(delta, options) end

--- Rotates all objects (orientation and position) around the pivot, from the initial state.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:245
---@param pivot vec3 Center of rotation.
---@param axis vec3 Axis (normalized internally; zero length is rejected).
---@param angle number Angle in radians.
---@return boolean  true if applied.
function editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle) end

--- Scales the objects around the pivot along the given axes; positions are stretched relative to the pivot.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:268
---@param pivot vec3 Scale center.
---@param axes table<string, vec3> Axes x, y, z used to stretch the positions.
---@param factors table<string, number> Factors {x, y, z}; an axis is "edited" if its factor differs from 1.
---@return boolean  true if applied.
---@return number  Effective factor after clamping.
function editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors) end

