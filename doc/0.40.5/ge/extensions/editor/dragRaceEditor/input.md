# `editor_dragRaceEditor_input`

*File: `lua/ge/extensions/editor/dragRaceEditor/input.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_input`: `extensions.load("editor_dragRaceEditor_input")`, then the global `editor_dragRaceEditor_input`

Handles mouse input of the drag race editor for zone editing: on each update, computes the camera-mouse ray, the scene raycast and the left button click/hold/release states. The result is read by the zone editor via getMouseInfo.

## Notes

- During the raycast, forest collision is disabled and then re-enabled.
- A click is taken into account if ImGui does not capture the mouse, or if the current edit mode is "Edit Drag Zone".
- When nothing is hit, the click position is 100 m in front of the camera, with normal (0,0,1).
- On the click frame (down), hold is forced to false.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_input.getMouseInfo()` | Returns the current mouseInfo table. | 44 |
| `editor_dragRaceEditor_input.updateMouseInfo()` | Recomputes the mouseInfo table: camPos, ray, rayDir, rayCast, valid, down, hold, up and the positions/normals _downPos, _holdPos, _upPos, _downNormal, _holdNormal, _upNormal. | 6 |

### Parameter details

#### `editor_dragRaceEditor_input.getMouseInfo()`

Returns the current mouseInfo table.

- **returns**: table|nil nil until updateMouseInfo has been called at least once.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/input.lua`.*
