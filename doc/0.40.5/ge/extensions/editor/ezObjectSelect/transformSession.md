# `editor_ezObjectSelect_transformSession`

*File: `lua/ge/extensions/editor/ezObjectSelect/transformSession.lua` · VM: Game Engine (GE) · 565 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_transformSession`: `extensions.load("editor_ezObjectSelect_transformSession")`, then the global `editor_ezObjectSelect_transformSession`

Transform session (move, rotate, scale) of the selected objects for Easy Object Select. begin() stores the initial transform and scale of each selected object; the update* functions reposition the objects from the initial state (not cumulative); finish() records the result in the editor history (SetObjectTransform / SetObjectScale, undoable, in a transaction); cancel() restores everything. Also handles prefab offset updates and reset to upright.

## Notes

- Only one session at a time (local upvalue). begin fails if the anchor is not selected or if an object cannot be manipulated (editor.canManipulateObject).
- Scale is clamped to [0.01, 1000] per component; the factor is identical for all edited axes and bounded so that all objects stay within that range.
- finish() creates no history action if there is no net change: the objects are then restored.
- The onEditorObjectSelectionTransformChanged hook is emitted only on undo/redo of the actions (applyHistoryTransform/Scale), not during the session.
- finish() returns false without a session, nil if the history transaction could not be opened, otherwise hasNetChange (boolean) then completion.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_transformSession.begin(anchorObject, options)` | Opens a session on all objects of editor.selection.object. Returns false if a session already exists, if the anchor is not selected or if an object cannot be manipulated. | 133 |
| `editor_ezObjectSelect_transformSession.cancel()` | Cancels the session and restores the initial transform and scale of each object. | 458 |
| `editor_ezObjectSelect_transformSession.finish()` | Ends the session: if there is a net change, opens a history transaction and records a SetObjectTransform and/or SetObjectScale action per object; otherwise restores the initial state. | 364 |
| `editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options)` | Computes the desired anchor position for a surface point (surface - grabOffset), with optional grid snapping. | 191 |
| `editor_ezObjectSelect_transformSession.getObjectIds()` | IDs of the session's objects. | 557 |
| `editor_ezObjectSelect_transformSession.isActive()` | Indicates whether a session is open. | 539 |
| `editor_ezObjectSelect_transformSession.resetRotation(objectIds)` | Resets the objects to upright (world Z axis) while keeping their heading, in a "ResetObjectRotation" history transaction. Refuses if a session is active. | 497 |
| `editor_ezObjectSelect_transformSession.selectionMatches()` | Checks that the editor selection is still exactly the session's selection and that the objects remain manipulable. | 543 |
| `editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset)` | Sets the offset between the grabbed surface point and the anchor position. | 162 |
| `editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options)` | Moves the selection so that the anchor follows a surface point; can align each object to the surface normal and use an individual position/normal provider. | 331 |
| `editor_ezObjectSelect_transformSession.updateDelta(delta, options)` | Translates all objects by delta relative to their initial position, with optional grid snapping (per-axis mask, absolute or relative). | 198 |
| `editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle)` | Rotates all objects (orientation and position) around the pivot, from the initial state. | 245 |
| `editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors)` | Scales the objects around the pivot along the given axes; positions are stretched relative to the pivot. | 268 |

### Parameter details

#### `editor_ezObjectSelect_transformSession.begin(anchorObject, options)`

Opens a session on all objects of editor.selection.object. Returns false if a session already exists, if the anchor is not selected or if an object cannot be manipulated.

- `anchorObject` (*userdata*) : Anchor object (its position is the reference for surface grabbing and distance).
- `options` (*table|nil*) : historyName (string, name of the history transaction, default "EasySelectDrag").
- **returns**: boolean true if the session is open.

#### `editor_ezObjectSelect_transformSession.cancel()`

Cancels the session and restores the initial transform and scale of each object.

- **returns**: boolean true if a session was active.

#### `editor_ezObjectSelect_transformSession.finish()`

Ends the session: if there is a net change, opens a history transaction and records a SetObjectTransform and/or SetObjectScale action per object; otherwise restores the initial state.

- **returns**: boolean|nil true if change committed, false if no change (or no session), nil if the transaction could not be opened.
- **returns**: table|nil {anchorDistance} (m) when there is a change.

#### `editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options)`

Computes the desired anchor position for a surface point (surface - grabOffset), with optional grid snapping.

- `surfacePosition` (*vec3*) : Surface point under the cursor.
- `options` (*table|nil*) : gridSize (m), gridRelative (boolean), snapZ (boolean).
- **returns**: vec3|boolean Anchor position, or false if no session / no grabOffset / no point.

#### `editor_ezObjectSelect_transformSession.getObjectIds()`

IDs of the session's objects.

- **returns**: integer[] List of IDs (empty without a session).

#### `editor_ezObjectSelect_transformSession.isActive()`

Indicates whether a session is open.

- **returns**: boolean true if active.

#### `editor_ezObjectSelect_transformSession.resetRotation(objectIds)`

Resets the objects to upright (world Z axis) while keeping their heading, in a "ResetObjectRotation" history transaction. Refuses if a session is active.

- `objectIds` (*integer[]*) : IDs of the objects to straighten.
- **returns**: boolean true if at least one object changed.

#### `editor_ezObjectSelect_transformSession.selectionMatches()`

Checks that the editor selection is still exactly the session's selection and that the objects remain manipulable.

- **returns**: boolean true without a session or if the selection matches.

#### `editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset)`

Sets the offset between the grabbed surface point and the anchor position.

- `surfacePosition` (*vec3*) : Grabbed surface point.
- `maintainRelativeZ` (*boolean|nil*) : If false, the vertical offset is set to 0.
- `verticalOffset` (*number|nil*) : If provided, forces the vertical offset (takes precedence over maintainRelativeZ).
- **returns**: boolean false without a session or without surfacePosition.

#### `editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options)`

Moves the selection so that the anchor follows a surface point; can align each object to the surface normal and use an individual position/normal provider.

- `surfacePosition` (*vec3*) : Surface point under the cursor.
- `surfaceNormal` (*vec3|nil*) : Surface normal.
- `options` (*table*) : gridSize, gridRelative, snapZ, followRotation (boolean), rotateSnapSize (degrees), rotateRelative (boolean), individualProvider (function(entry, position) -> {position, normal}|nil). The parameter must be a table (inferred from code: options.followRotation is read without a guard).
- **returns**: boolean false if no session or no grabOffset.

#### `editor_ezObjectSelect_transformSession.updateDelta(delta, options)`

Translates all objects by delta relative to their initial position, with optional grid snapping (per-axis mask, absolute or relative).

- `delta` (*vec3*) : Displacement in meters, world space.
- `options` (*table|nil*) : gridSize (m), gridPivot (vec3), gridMask ({x,y,z} booleans), gridRelative (boolean), snapZ (boolean).
- **returns**: boolean false without a session or without delta.

#### `editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle)`

Rotates all objects (orientation and position) around the pivot, from the initial state.

- `pivot` (*vec3*) : Center of rotation.
- `axis` (*vec3*) : Axis (normalized internally; zero length is rejected).
- `angle` (*number*) : Angle in radians.
- **returns**: boolean true if applied.

#### `editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors)`

Scales the objects around the pivot along the given axes; positions are stretched relative to the pivot.

- `pivot` (*vec3*) : Scale center.
- `axes` (*table<string, vec3>*) : Axes x, y, z used to stretch the positions.
- `factors` (*table<string, number>*) : Factors {x, y, z}; an axis is "edited" if its factor differs from 1.
- **returns**: boolean true if applied.
- **returns**: number Effective factor after clamping.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectSelectionTransformChanged`

## Calls into the engine (C++)

- `Sim.` `findObjectById`, `upcast`
- `obj:` `getScale`, `getTransform`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/transformSession.lua`.*
