---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Scale" modal operator (S key) of the Easy Select tool. On start it opens a transform session (modalOperatorCommon.begin, history "EasySelectScale"); the scale factor is the screen mouse-pivot distance divided by the initial distance (or a value typed on the keyboard), clamped to [0.0001, 100000]. X/Y/Z axis constraints, Shift+axis to exclude an axis, double press for local space. Left click/Enter confirms, right click/Esc cancels.
--- Access: extension `editor_ezObjectSelect_scaleOperator`: `extensions.load("editor_ezObjectSelect_scaleOperator")`, then the global `editor_ezObjectSelect_scaleOperator`
---@class editor_ezObjectSelect_scaleOperator
editor_ezObjectSelect_scaleOperator = {}

--- Starts the operator on the selection. Returns false if already active, if the session could not start or if the pivot is not projectable on screen (the session is then cancelled).
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:46
---@param options table|nil {defaultLocal = boolean}: default local space
---@return boolean  true if started
function editor_ezObjectSelect_scaleOperator.begin(options) end

--- Cancels the current operator (restores the objects).
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:97
---@return boolean  true if an operator was active
function editor_ezObjectSelect_scaleOperator.cancel() end

--- Draws the indicator near the pivot and the HUD (UNIFORM/axis constraint, WORLD/LOCAL, factor "1.000x", key help).
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:115
function editor_ezObjectSelect_scaleOperator.drawScreen() end

--- Ids of the objects manipulated by the session ({} if inactive).
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:111
---@return table  list of ids
function editor_ezObjectSelect_scaleOperator.getObjectIds() end

--- Indicates whether the operator is in progress.
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:107
---@return boolean
function editor_ezObjectSelect_scaleOperator.isActive() end

--- Toggles local/world space for the current constraint.
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:103
---@param localSpace boolean true for local space
---@return boolean  result of modalOperatorCommon.setLocalSpace
function editor_ezObjectSelect_scaleOperator.setLocalSpace(localSpace) end

--- To be called every frame: handles the requested end, constraints, numeric input, computes the factor, applies it via transformSession.updateScale and draws the gizmo.
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:67
---@return string|nil  "active" while the operator runs; otherwise result of finish (resolved value and completion); nil if inactive
function editor_ezObjectSelect_scaleOperator.update() end

--- Returns true if the S key has just been pressed.
---Source: lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua:42
---@return boolean  S key pressed this frame
function editor_ezObjectSelect_scaleOperator.wantsBegin() end

