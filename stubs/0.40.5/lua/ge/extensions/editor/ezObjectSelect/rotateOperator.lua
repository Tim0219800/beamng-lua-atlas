---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Rotate" modal operator (R key) of the Easy Select tool. Opens a transform session (history "EasySelectRotate") and rotates the selection around the pivot: without constraint the axis is the camera view direction, with an X/Y/Z constraint it is the chosen axis (world or local). The angle comes from the mouse-pivot screen angle or from a numeric input in degrees, with optional snapping. Left click/Enter confirms, right click/Esc cancels.
--- Access: extension `editor_ezObjectSelect_rotateOperator`: `extensions.load("editor_ezObjectSelect_rotateOperator")`, then the global `editor_ezObjectSelect_rotateOperator`
---@class editor_ezObjectSelect_rotateOperator
editor_ezObjectSelect_rotateOperator = {}

--- Starts the rotation. Returns false if already active, session impossible or pivot not projectable.
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:66
---@param options table|nil {defaultLocal = boolean}
---@return boolean  true if started
function editor_ezObjectSelect_rotateOperator.begin(options) end

--- Cancels the current rotation.
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:105
---@return boolean  true if an operator was active
function editor_ezObjectSelect_rotateOperator.cancel() end

--- Draws the indicator and the HUD (VIEW/axis constraint, space, angle in degrees or typed text).
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:125
function editor_ezObjectSelect_rotateOperator.drawScreen() end

--- Ids of the session objects ({} if inactive).
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:121
---@return table
function editor_ezObjectSelect_rotateOperator.getObjectIds() end

--- Indicates whether the operator is in progress.
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:117
---@return boolean
function editor_ezObjectSelect_rotateOperator.isActive() end

--- Toggles local/world space and resets the mouse reference.
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:111
---@param localSpace boolean true for local
---@return boolean  false if the change did not happen
function editor_ezObjectSelect_rotateOperator.setLocalSpace(localSpace) end

--- Every frame: handles end, constraint, input, computes the angle (rad), applies transformSession.updateRotation and draws the gizmo.
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:86
---@param options table|nil {rotateSnapEnabled = boolean, rotateSnapSize = degrees}
---@return string|nil  "active" during the operation, result of finish at the end, nil if inactive
function editor_ezObjectSelect_rotateOperator.update(options) end

--- True if the R key has just been pressed.
---Source: lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua:62
---@return boolean
function editor_ezObjectSelect_rotateOperator.wantsBegin() end

