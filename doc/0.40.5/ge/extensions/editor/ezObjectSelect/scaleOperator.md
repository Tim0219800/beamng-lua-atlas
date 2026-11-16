# `editor_ezObjectSelect_scaleOperator`

*File: `lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua` · VM: Game Engine (GE) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_scaleOperator`: `extensions.load("editor_ezObjectSelect_scaleOperator")`, then the global `editor_ezObjectSelect_scaleOperator`

"Scale" modal operator (S key) of the Easy Select tool. On start it opens a transform session (modalOperatorCommon.begin, history "EasySelectScale"); the scale factor is the screen mouse-pivot distance divided by the initial distance (or a value typed on the keyboard), clamped to [0.0001, 100000]. X/Y/Z axis constraints, Shift+axis to exclude an axis, double press for local space. Left click/Enter confirms, right click/Esc cancels.

## Notes

- Radial tracking is only active after the mouse has moved at least 10 px (x uiscale) away from the pivot; before that the factor is 1.
- Refuses to start if an operator or a transformSession is already active.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_scaleOperator.begin(options)` | Starts the operator on the selection. Returns false if already active, if the session could not start or if the pivot is not projectable on screen (the session is then cancelled). | 46 |
| `editor_ezObjectSelect_scaleOperator.cancel()` | Cancels the current operator (restores the objects). | 97 |
| `editor_ezObjectSelect_scaleOperator.drawScreen()` | Draws the indicator near the pivot and the HUD (UNIFORM/axis constraint, WORLD/LOCAL, factor "1.000x", key help). | 115 |
| `editor_ezObjectSelect_scaleOperator.getObjectIds()` | Ids of the objects manipulated by the session ({} if inactive). | 111 |
| `editor_ezObjectSelect_scaleOperator.isActive()` | Indicates whether the operator is in progress. | 107 |
| `editor_ezObjectSelect_scaleOperator.setLocalSpace(localSpace)` | Toggles local/world space for the current constraint. | 103 |
| `editor_ezObjectSelect_scaleOperator.update()` | To be called every frame: handles the requested end, constraints, numeric input, computes the factor, applies it via transformSession.updateScale and draws the gizmo. | 67 |
| `editor_ezObjectSelect_scaleOperator.wantsBegin()` | Returns true if the S key has just been pressed. | 42 |

### Parameter details

#### `editor_ezObjectSelect_scaleOperator.begin(options)`

Starts the operator on the selection. Returns false if already active, if the session could not start or if the pivot is not projectable on screen (the session is then cancelled).

- `options` (*table|nil*) : {defaultLocal = boolean}: default local space
- **returns**: boolean true if started

#### `editor_ezObjectSelect_scaleOperator.cancel()`

Cancels the current operator (restores the objects).

- **returns**: boolean true if an operator was active

#### `editor_ezObjectSelect_scaleOperator.getObjectIds()`

Ids of the objects manipulated by the session ({} if inactive).

- **returns**: table list of ids

#### `editor_ezObjectSelect_scaleOperator.isActive()`

Indicates whether the operator is in progress.

- **returns**: boolean 

#### `editor_ezObjectSelect_scaleOperator.setLocalSpace(localSpace)`

Toggles local/world space for the current constraint.

- `localSpace` (*boolean*) : true for local space
- **returns**: boolean result of modalOperatorCommon.setLocalSpace

#### `editor_ezObjectSelect_scaleOperator.update()`

To be called every frame: handles the requested end, constraints, numeric input, computes the factor, applies it via transformSession.updateScale and draws the gizmo.

- **returns**: string|nil "active" while the operator runs; otherwise result of finish (resolved value and completion); nil if inactive

#### `editor_ezObjectSelect_scaleOperator.wantsBegin()`

Returns true if the S key has just been pressed.

- **returns**: boolean S key pressed this frame

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua`.*
