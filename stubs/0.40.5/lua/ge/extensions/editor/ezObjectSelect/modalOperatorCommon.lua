---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Functions shared by the modal operators (rotate, scale, translate) of the Easy Select tool: starting a transform session on the selection, handling X/Y/Z axis constraints (world/local, exclusion with Shift), numeric input, confirm/cancel (Enter or left click in the viewport = confirm; Esc or right click = cancel), world-to-screen projection, and drawing the HUD and indicators near the mouse.
--- Access: extension `editor_ezObjectSelect_modalOperatorCommon`: `extensions.load("editor_ezObjectSelect_modalOperatorCommon")`, then the global `editor_ezObjectSelect_modalOperatorCommon`
---@class editor_ezObjectSelect_modalOperatorCommon
editor_ezObjectSelect_modalOperatorCommon = {}

--- Vector of the constrained axis, or nil without constraint.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:117
---@param state table State
---@return vec3|nil
function editor_ezObjectSelect_modalOperatorCommon.activeAxis(state) end

--- Current axis set (localAxes if the constraint is in local space, otherwise worldAxes).
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:112
---@param state table State
---@return table  {x, y, z} of vec3
function editor_ezObjectSelect_modalOperatorCommon.axes(state) end

--- Opens the transform session on the selection and creates the operator state. Returns nil if there is no anchor, no camera/ray, or if transformSession.begin fails.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:45
---@param options table|nil {historyName = history transaction name, defaultLocal = boolean}
---@return table|nil  operator state
function editor_ezObjectSelect_modalOperatorCommon.begin(options) end

--- Current camera-mouse ray (getCameraMouseRay).
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:28
---@return table|nil  {origin = vec3, direction = normalized vec3} or nil
function editor_ezObjectSelect_modalOperatorCommon.currentRay() end

--- Draws a two-line panel near the mouse (line 1: prefix + details; line 2: help), kept within the viewport.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:269
---@param prefix string Letter/title (e.g. "R", "S")
---@param details string Constraint, space and value
---@param help string Key help text
---@param border integer imgui U32 color of the border
function editor_ezObjectSelect_modalOperatorCommon.drawHud(prefix, details, help, border) end

--- Hides the system cursor and draws at the cursor a dot with chevrons (rotate: tangents; scale: radial; translate: 4 directions) and, except for translate, a dotted line from the pivot to the mouse.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:206
---@param kind string "rotate", "scale" or "translate"
---@param pivotScreen ImVec2|nil Pivot in screen coordinates (nothing is drawn if nil)
function editor_ezObjectSelect_modalOperatorCommon.drawInteractionHint(kind, pivotScreen) end

--- Ends the session: confirm calls transformSession.finish (if nothing is committed, returns "cancel"), otherwise transformSession.cancel; restores the cursor.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:137
---@param result string "confirm" or "cancel"
---@return string  effective result
---@return any  completion information returned by transformSession.finish
function editor_ezObjectSelect_modalOperatorCommon.finish(result) end

--- Tests the end keys.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:128
---@return string|nil  "cancel" (Esc/right click), "confirm" (Enter, numpad Enter, left click in the viewport) or nil
function editor_ezObjectSelect_modalOperatorCommon.finishRequested() end

--- Normalizes a vector; returns fallback if its length is <= 0.0001.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:22
---@param vector vec3 Vector to normalize
---@param fallback vec3 Fallback value
---@return vec3
function editor_ezObjectSelect_modalOperatorCommon.normalized(vector, fallback) end

--- Projects a world point to screen coordinates. nil if the point is behind the camera or nearly in its plane (depth <= 0.0001).
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:153
---@param camera table Camera context (pos, forward, right, up, halfTan, aspect, viewportX/Y, width, height)
---@param point vec3 World point
---@return ImVec2|nil
function editor_ezObjectSelect_modalOperatorCommon.projectToScreen(camera, point) end

--- Intersection of a ray with a plane.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:37
---@param ray table|nil {origin, direction}
---@param planePoint vec3 Point of the plane
---@param planeNormal vec3 Plane normal
---@return vec3|nil  Intersection point, nil if the ray is parallel (|denominator| <= 0.0001) or there is no ray
function editor_ezObjectSelect_modalOperatorCommon.rayPlanePoint(ray, planePoint, planeNormal) end

--- Hides or re-shows the cursor via the Canvas object (setCursorVisible).
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:261
---@param hidden boolean true to hide
function editor_ezObjectSelect_modalOperatorCommon.setInteractionCursorHidden(hidden) end

--- Sets the default local/world space and applies it to the active constraint; then ignores the top row key 4 for numeric input on the next update.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:104
---@param state table|nil State
---@param localSpace boolean true = local
---@return boolean  false if state is nil
function editor_ezObjectSelect_modalOperatorCommon.setLocalSpace(state, localSpace) end

--- Reads the X/Y/Z keys and updates state.constraint = {axis, exclude, localSpace}.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:83
---@param state table Operator state
---@param allowExclude boolean If true, holding Shift means "exclude this axis"
---@return boolean  true if the constraint changed this frame
function editor_ezObjectSelect_modalOperatorCommon.updateConstraint(state, allowExclude) end

--- Updates the numeric input (transformNumericInput) and returns the entered value.
---Source: lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua:122
---@param state table State
---@return number|nil  entered value or nil
function editor_ezObjectSelect_modalOperatorCommon.updateNumeric(state) end

