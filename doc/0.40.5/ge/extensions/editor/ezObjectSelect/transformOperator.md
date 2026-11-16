# `editor_ezObjectSelect_transformOperator`

*File: `lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua` · VM: Game Engine (GE) · 421 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_transformOperator`: `extensions.load("editor_ezObjectSelect_transformOperator")`, then the global `editor_ezObjectSelect_transformOperator`

"Modal" translation operator of Easy Object Select, Blender-style: the G key starts moving the selection, X/Y/Z constrain to an axis, Shift+axis to a plane, pressing the same axis twice toggles world/local, typed digits give an exact distance (transformNumericInput), left click or Enter confirm, right click or Esc cancel. Relies on transformSession to apply and commit (undoable history) and on transformGizmo/debug for the guides.

## Notes

- Without a constraint, the move happens in the view plane at the pivot's depth (center of the selection box).
- The grid step (options.gridSize, absolute or relative) is ignored during numeric input.
- The anchor is the last object of editor.selection.object; begin fails if a session is already active.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_transformOperator.begin(options)` | Starts the operation on the current editor selection (anchor = last object): opens a transformSession, stores pivot, camera, start ray, world/local axes, and hides the cursor. | 259 |
| `editor_ezObjectSelect_transformOperator.cancel()` | Cancels the current operation and restores the original transforms. | 332 |
| `editor_ezObjectSelect_transformOperator.drawScreen(options)` | Draws the on-screen tooltip near the cursor: constraint, space, value (distance or typed input), grid, shortcut reminders. | 372 |
| `editor_ezObjectSelect_transformOperator.getObjectIds()` | IDs of the objects manipulated by the session. | 350 |
| `editor_ezObjectSelect_transformOperator.isActive()` | Indicates whether an operation is in progress. | 346 |
| `editor_ezObjectSelect_transformOperator.setLocalSpace(localSpace)` | Sets the default local/world space and applies it to the current constraint. | 338 |
| `editor_ezObjectSelect_transformOperator.status()` | State summary: constraint ("VIEW", "X", "SHIFT+X"...), space ("WORLD"/"LOCAL"), typed numeric text and current delta. | 354 |
| `editor_ezObjectSelect_transformOperator.update(options)` | To be called every frame while the operation is active: handles cancel/confirm, constraints, numeric input, computes the delta and applies it via transformSession.updateDelta, then draws the guides. | 300 |
| `editor_ezObjectSelect_transformOperator.wantsBegin()` | Indicates whether the G key has just been pressed. | 255 |

### Parameter details

#### `editor_ezObjectSelect_transformOperator.begin(options)`

Starts the operation on the current editor selection (anchor = last object): opens a transformSession, stores pivot, camera, start ray, world/local axes, and hides the cursor.

- `options` (*table|nil*) : defaultLocal (boolean): start the constraints in local space.
- **returns**: boolean true if the operation started.

#### `editor_ezObjectSelect_transformOperator.cancel()`

Cancels the current operation and restores the original transforms.

- **returns**: boolean true if an operation was active.

#### `editor_ezObjectSelect_transformOperator.drawScreen(options)`

Draws the on-screen tooltip near the cursor: constraint, space, value (distance or typed input), grid, shortcut reminders.

- `options` (*table|nil*) : gridSize (m), gridRelative (boolean) for the grid display.

#### `editor_ezObjectSelect_transformOperator.getObjectIds()`

IDs of the objects manipulated by the session.

- **returns**: integer[] List of IDs (empty if inactive).

#### `editor_ezObjectSelect_transformOperator.isActive()`

Indicates whether an operation is in progress.

- **returns**: boolean true if active.

#### `editor_ezObjectSelect_transformOperator.setLocalSpace(localSpace)`

Sets the default local/world space and applies it to the current constraint.

- `localSpace` (*boolean*) : true for local.
- **returns**: boolean false if no operation is active.

#### `editor_ezObjectSelect_transformOperator.status()`

State summary: constraint ("VIEW", "X", "SHIFT+X"...), space ("WORLD"/"LOCAL"), typed numeric text and current delta.

- **returns**: table|nil {constraint, space, numeric, delta}, or nil if inactive.

#### `editor_ezObjectSelect_transformOperator.update(options)`

To be called every frame while the operation is active: handles cancel/confirm, constraints, numeric input, computes the delta and applies it via transformSession.updateDelta, then draws the guides.

- `options` (*table|nil*) : gridSize (m), gridRelative (boolean).
- **returns**: string|nil nil if inactive; "active" while in progress; "confirm" or "cancel" at the end.
- **returns**: table|nil On confirm, end information ({anchorDistance} in m) returned by transformSession.finish.

#### `editor_ezObjectSelect_transformOperator.wantsBegin()`

Indicates whether the G key has just been pressed.

- **returns**: boolean true if G pressed this frame.

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/transformOperator.lua`.*
