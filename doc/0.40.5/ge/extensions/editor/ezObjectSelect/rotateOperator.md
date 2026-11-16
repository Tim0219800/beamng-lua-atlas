# `editor_ezObjectSelect_rotateOperator`

*File: `lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua` · VM: Game Engine (GE) · 141 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_rotateOperator`: `extensions.load("editor_ezObjectSelect_rotateOperator")`, then the global `editor_ezObjectSelect_rotateOperator`

"Rotate" modal operator (R key) of the Easy Select tool. Opens a transform session (history "EasySelectRotate") and rotates the selection around the pivot: without constraint the axis is the camera view direction, with an X/Y/Z constraint it is the chosen axis (world or local). The angle comes from the mouse-pivot screen angle or from a numeric input in degrees, with optional snapping. Left click/Enter confirms, right click/Esc cancels.

## Notes

- Snapping is only applied to the mouse angle (not to numeric input) and if options.rotateSnapEnabled is true and rotateSnapSize > 0 (in degrees).
- Changing axis or space resets the mouse reference and the angle to 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_rotateOperator.begin(options)` | Starts the rotation. Returns false if already active, session impossible or pivot not projectable. | 66 |
| `editor_ezObjectSelect_rotateOperator.cancel()` | Cancels the current rotation. | 105 |
| `editor_ezObjectSelect_rotateOperator.drawScreen()` | Draws the indicator and the HUD (VIEW/axis constraint, space, angle in degrees or typed text). | 125 |
| `editor_ezObjectSelect_rotateOperator.getObjectIds()` | Ids of the session objects ({} if inactive). | 121 |
| `editor_ezObjectSelect_rotateOperator.isActive()` | Indicates whether the operator is in progress. | 117 |
| `editor_ezObjectSelect_rotateOperator.setLocalSpace(localSpace)` | Toggles local/world space and resets the mouse reference. | 111 |
| `editor_ezObjectSelect_rotateOperator.update(options)` | Every frame: handles end, constraint, input, computes the angle (rad), applies transformSession.updateRotation and draws the gizmo. | 86 |
| `editor_ezObjectSelect_rotateOperator.wantsBegin()` | True if the R key has just been pressed. | 62 |

### Parameter details

#### `editor_ezObjectSelect_rotateOperator.begin(options)`

Starts the rotation. Returns false if already active, session impossible or pivot not projectable.

- `options` (*table|nil*) : {defaultLocal = boolean}
- **returns**: boolean true if started

#### `editor_ezObjectSelect_rotateOperator.cancel()`

Cancels the current rotation.

- **returns**: boolean true if an operator was active

#### `editor_ezObjectSelect_rotateOperator.getObjectIds()`

Ids of the session objects ({} if inactive).

- **returns**: table 

#### `editor_ezObjectSelect_rotateOperator.isActive()`

Indicates whether the operator is in progress.

- **returns**: boolean 

#### `editor_ezObjectSelect_rotateOperator.setLocalSpace(localSpace)`

Toggles local/world space and resets the mouse reference.

- `localSpace` (*boolean*) : true for local
- **returns**: boolean false if the change did not happen

#### `editor_ezObjectSelect_rotateOperator.update(options)`

Every frame: handles end, constraint, input, computes the angle (rad), applies transformSession.updateRotation and draws the gizmo.

- `options` (*table|nil*) : {rotateSnapEnabled = boolean, rotateSnapSize = degrees}
- **returns**: string|nil "active" during the operation, result of finish at the end, nil if inactive

#### `editor_ezObjectSelect_rotateOperator.wantsBegin()`

True if the R key has just been pressed.

- **returns**: boolean 

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua`.*
