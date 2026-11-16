---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Modal" translation operator of Easy Object Select, Blender-style: the G key starts moving the selection, X/Y/Z constrain to an axis, Shift+axis to a plane, pressing the same axis twice toggles world/local, typed digits give an exact distance (transformNumericInput), left click or Enter confirm, right click or Esc cancel. Relies on transformSession to apply and commit (undoable history) and on transformGizmo/debug for the guides.
--- Access: extension `editor_ezObjectSelect_transformOperator`: `extensions.load("editor_ezObjectSelect_transformOperator")`, then the global `editor_ezObjectSelect_transformOperator`
---@class editor_ezObjectSelect_transformOperator
editor_ezObjectSelect_transformOperator = {}

--- Starts the operation on the current editor selection (anchor = last object): opens a transformSession, stores pivot, camera, start ray, world/local axes, and hides the cursor.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:259
---@param options table|nil defaultLocal (boolean): start the constraints in local space.
---@return boolean  true if the operation started.
function editor_ezObjectSelect_transformOperator.begin(options) end

--- Cancels the current operation and restores the original transforms.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:332
---@return boolean  true if an operation was active.
function editor_ezObjectSelect_transformOperator.cancel() end

--- Draws the on-screen tooltip near the cursor: constraint, space, value (distance or typed input), grid, shortcut reminders.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:372
---@param options table|nil gridSize (m), gridRelative (boolean) for the grid display.
function editor_ezObjectSelect_transformOperator.drawScreen(options) end

--- IDs of the objects manipulated by the session.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:350
---@return integer[]  List of IDs (empty if inactive).
function editor_ezObjectSelect_transformOperator.getObjectIds() end

--- Indicates whether an operation is in progress.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:346
---@return boolean  true if active.
function editor_ezObjectSelect_transformOperator.isActive() end

--- Sets the default local/world space and applies it to the current constraint.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:338
---@param localSpace boolean true for local.
---@return boolean  false if no operation is active.
function editor_ezObjectSelect_transformOperator.setLocalSpace(localSpace) end

--- State summary: constraint ("VIEW", "X", "SHIFT+X"...), space ("WORLD"/"LOCAL"), typed numeric text and current delta.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:354
---@return table|nil  {constraint, space, numeric, delta}, or nil if inactive.
function editor_ezObjectSelect_transformOperator.status() end

--- To be called every frame while the operation is active: handles cancel/confirm, constraints, numeric input, computes the delta and applies it via transformSession.updateDelta, then draws the guides.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:300
---@param options table|nil gridSize (m), gridRelative (boolean).
---@return string|nil  nil if inactive; "active" while in progress; "confirm" or "cancel" at the end.
---@return table|nil  On confirm, end information ({anchorDistance} in m) returned by transformSession.finish.
function editor_ezObjectSelect_transformOperator.update(options) end

--- Indicates whether the G key has just been pressed.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua:255
---@return boolean  true if G pressed this frame.
function editor_ezObjectSelect_transformOperator.wantsBegin() end

