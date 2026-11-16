# `editor_ezObjectSelect_modalOperatorCommon`

*File: `lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua` · VM: Game Engine (GE) · 317 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_modalOperatorCommon`: `extensions.load("editor_ezObjectSelect_modalOperatorCommon")`, then the global `editor_ezObjectSelect_modalOperatorCommon`

Functions shared by the modal operators (rotate, scale, translate) of the Easy Select tool: starting a transform session on the selection, handling X/Y/Z axis constraints (world/local, exclusion with Shift), numeric input, confirm/cancel (Enter or left click in the viewport = confirm; Esc or right click = cancel), world-to-screen projection, and drawing the HUD and indicators near the mouse.

## Notes

- The session anchor is the last object of editor.selection.object; the pivot is the center of editor.objectSelectionBBox if valid, otherwise the anchor position.
- Pressing the same axis key twice (same exclusion state) toggles local/world space; another axis recreates the constraint with the default space.
- The "state" object returned by begin contains pivot, camera, startRay, startMouse, worldAxes, localAxes, constraint, defaultLocal, numeric; operators add their own fields to it.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_modalOperatorCommon.activeAxis(state)` | Vector of the constrained axis, or nil without constraint. | 117 |
| `editor_ezObjectSelect_modalOperatorCommon.axes(state)` | Current axis set (localAxes if the constraint is in local space, otherwise worldAxes). | 112 |
| `editor_ezObjectSelect_modalOperatorCommon.begin(options)` | Opens the transform session on the selection and creates the operator state. Returns nil if there is no anchor, no camera/ray, or if transformSession.begin fails. | 45 |
| `editor_ezObjectSelect_modalOperatorCommon.currentRay()` | Current camera-mouse ray (getCameraMouseRay). | 28 |
| `editor_ezObjectSelect_modalOperatorCommon.drawHud(prefix, details, help, border)` | Draws a two-line panel near the mouse (line 1: prefix + details; line 2: help), kept within the viewport. | 269 |
| `editor_ezObjectSelect_modalOperatorCommon.drawInteractionHint(kind, pivotScreen)` | Hides the system cursor and draws at the cursor a dot with chevrons (rotate: tangents; scale: radial; translate: 4 directions) and, except for translate, a dotted line from the pivot to the mouse. | 206 |
| `editor_ezObjectSelect_modalOperatorCommon.finish(result)` | Ends the session: confirm calls transformSession.finish (if nothing is committed, returns "cancel"), otherwise transformSession.cancel; restores the cursor. | 137 |
| `editor_ezObjectSelect_modalOperatorCommon.finishRequested()` | Tests the end keys. | 128 |
| `editor_ezObjectSelect_modalOperatorCommon.normalized(vector, fallback)` | Normalizes a vector; returns fallback if its length is <= 0.0001. | 22 |
| `editor_ezObjectSelect_modalOperatorCommon.projectToScreen(camera, point)` | Projects a world point to screen coordinates. nil if the point is behind the camera or nearly in its plane (depth <= 0.0001). | 153 |
| `editor_ezObjectSelect_modalOperatorCommon.rayPlanePoint(ray, planePoint, planeNormal)` | Intersection of a ray with a plane. | 37 |
| `editor_ezObjectSelect_modalOperatorCommon.setInteractionCursorHidden(hidden)` | Hides or re-shows the cursor via the Canvas object (setCursorVisible). | 261 |
| `editor_ezObjectSelect_modalOperatorCommon.setLocalSpace(state, localSpace)` | Sets the default local/world space and applies it to the active constraint; then ignores the top row key 4 for numeric input on the next update. | 104 |
| `editor_ezObjectSelect_modalOperatorCommon.updateConstraint(state, allowExclude)` | Reads the X/Y/Z keys and updates state.constraint = {axis, exclude, localSpace}. | 83 |
| `editor_ezObjectSelect_modalOperatorCommon.updateNumeric(state)` | Updates the numeric input (transformNumericInput) and returns the entered value. | 122 |

### Parameter details

#### `editor_ezObjectSelect_modalOperatorCommon.activeAxis(state)`

Vector of the constrained axis, or nil without constraint.

- `state` (*table*) : State
- **returns**: vec3|nil 

#### `editor_ezObjectSelect_modalOperatorCommon.axes(state)`

Current axis set (localAxes if the constraint is in local space, otherwise worldAxes).

- `state` (*table*) : State
- **returns**: table {x, y, z} of vec3

#### `editor_ezObjectSelect_modalOperatorCommon.begin(options)`

Opens the transform session on the selection and creates the operator state. Returns nil if there is no anchor, no camera/ray, or if transformSession.begin fails.

- `options` (*table|nil*) : {historyName = history transaction name, defaultLocal = boolean}
- **returns**: table|nil operator state

#### `editor_ezObjectSelect_modalOperatorCommon.currentRay()`

Current camera-mouse ray (getCameraMouseRay).

- **returns**: table|nil {origin = vec3, direction = normalized vec3} or nil

#### `editor_ezObjectSelect_modalOperatorCommon.drawHud(prefix, details, help, border)`

Draws a two-line panel near the mouse (line 1: prefix + details; line 2: help), kept within the viewport.

- `prefix` (*string*) : Letter/title (e.g. "R", "S")
- `details` (*string*) : Constraint, space and value
- `help` (*string*) : Key help text
- `border` (*integer*) : imgui U32 color of the border

#### `editor_ezObjectSelect_modalOperatorCommon.drawInteractionHint(kind, pivotScreen)`

Hides the system cursor and draws at the cursor a dot with chevrons (rotate: tangents; scale: radial; translate: 4 directions) and, except for translate, a dotted line from the pivot to the mouse.

- `kind` (*string*) : "rotate", "scale" or "translate"
- `pivotScreen` (*ImVec2|nil*) : Pivot in screen coordinates (nothing is drawn if nil)

#### `editor_ezObjectSelect_modalOperatorCommon.finish(result)`

Ends the session: confirm calls transformSession.finish (if nothing is committed, returns "cancel"), otherwise transformSession.cancel; restores the cursor.

- `result` (*string*) : "confirm" or "cancel"
- **returns**: string effective result
- **returns**: any completion information returned by transformSession.finish

#### `editor_ezObjectSelect_modalOperatorCommon.finishRequested()`

Tests the end keys.

- **returns**: string|nil "cancel" (Esc/right click), "confirm" (Enter, numpad Enter, left click in the viewport) or nil

#### `editor_ezObjectSelect_modalOperatorCommon.normalized(vector, fallback)`

Normalizes a vector; returns fallback if its length is <= 0.0001.

- `vector` (*vec3*) : Vector to normalize
- `fallback` (*vec3*) : Fallback value
- **returns**: vec3 

#### `editor_ezObjectSelect_modalOperatorCommon.projectToScreen(camera, point)`

Projects a world point to screen coordinates. nil if the point is behind the camera or nearly in its plane (depth <= 0.0001).

- `camera` (*table*) : Camera context (pos, forward, right, up, halfTan, aspect, viewportX/Y, width, height)
- `point` (*vec3*) : World point
- **returns**: ImVec2|nil 

#### `editor_ezObjectSelect_modalOperatorCommon.rayPlanePoint(ray, planePoint, planeNormal)`

Intersection of a ray with a plane.

- `ray` (*table|nil*) : {origin, direction}
- `planePoint` (*vec3*) : Point of the plane
- `planeNormal` (*vec3*) : Plane normal
- **returns**: vec3|nil Intersection point, nil if the ray is parallel (|denominator| <= 0.0001) or there is no ray

#### `editor_ezObjectSelect_modalOperatorCommon.setInteractionCursorHidden(hidden)`

Hides or re-shows the cursor via the Canvas object (setCursorVisible).

- `hidden` (*boolean*) : true to hide

#### `editor_ezObjectSelect_modalOperatorCommon.setLocalSpace(state, localSpace)`

Sets the default local/world space and applies it to the active constraint; then ignores the top row key 4 for numeric input on the next update.

- `state` (*table|nil*) : State
- `localSpace` (*boolean*) : true = local
- **returns**: boolean false if state is nil

#### `editor_ezObjectSelect_modalOperatorCommon.updateConstraint(state, allowExclude)`

Reads the X/Y/Z keys and updates state.constraint = {axis, exclude, localSpace}.

- `state` (*table*) : Operator state
- `allowExclude` (*boolean*) : If true, holding Shift means "exclude this axis"
- **returns**: boolean true if the constraint changed this frame

#### `editor_ezObjectSelect_modalOperatorCommon.updateNumeric(state)`

Updates the numeric input (transformNumericInput) and returns the entered value.

- `state` (*table*) : State
- **returns**: number|nil entered value or nil

## Calls into the engine (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua`.*
