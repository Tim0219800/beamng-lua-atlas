# `editor_toolUtilities_panCamera`

*File: `lua/ge/extensions/editor/toolUtilities/panCamera.lua` · VM: Game Engine (GE) · 85 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_panCamera`: `extensions.load("editor_toolUtilities_panCamera")`, then the global `editor_toolUtilities_panCamera`

"Pan" camera shared by the editor's spline tools. It takes over the editor's free camera (via toolCamera), switches to a top-down view and allows moving with right-click and zooming with the mouse wheel. A host tool registers it with configure, calls it every frame with drive, and can have it frame the current selection.

## Example

```lua
local pan = extensions.editor_toolUtilities_panCamera
pan.configure({focusProvider = function() return selectedPoints end})
pan.toggle()
-- every frame of the tool:
pan.drive(isDraggingNode)
```

## Notes

- The state (on, focusProvider) is local to the module: only one pan camera at a time.
- gotoPoints returns false if neither the pan camera nor toolCamera is active: the caller must then do its own free-camera jump.
- Framing goes through util.splineFocus then toolCamera.flyPan; the altitude is relative to the terrain.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_panCamera.close()` | Deactivates the pan camera and hands the free camera back to the editor (toolCamera.handBack). | 52 |
| `editor_toolUtilities_panCamera.configure(opts)` | Registers a callback supplying the points of the current selection, used to frame them when the camera opens. | 29 |
| `editor_toolUtilities_panCamera.drive(blocked)` | To be called every frame: applies movement (right-click drag) and zoom (mouse wheel) via toolCamera.drive. | 71 |
| `editor_toolUtilities_panCamera.gotoPoints(points)` | "Go to" routing: if the pan camera (or toolCamera) is active, makes it fly to the given points and returns true; otherwise returns false and the caller does its normal jump. | 63 |
| `editor_toolUtilities_panCamera.isOn()` | Tells whether the pan camera is active. | 33 |
| `editor_toolUtilities_panCamera.open()` | Activates the pan camera (toolCamera.takeOver) and switches to top-down view: frames the selection supplied by focusProvider if there is one, otherwise switches to top-down view at the camera's current position and height. | 39 |
| `editor_toolUtilities_panCamera.toggle()` | Toggle: closes the pan camera if it is active, otherwise opens it. | 57 |

### Parameter details

#### `editor_toolUtilities_panCamera.configure(opts)`

Registers a callback supplying the points of the current selection, used to frame them when the camera opens.

- `opts` (*table|nil*) : Table with the focusProvider field: function with no argument returning a list of {x,y,z} points or nil.

#### `editor_toolUtilities_panCamera.drive(blocked)`

To be called every frame: applies movement (right-click drag) and zoom (mouse wheel) via toolCamera.drive.

- `blocked` (*boolean|nil*) : true to suspend movement during the tool's modal interactions (polygon drawing, node dragging, placement...).

#### `editor_toolUtilities_panCamera.gotoPoints(points)`

"Go to" routing: if the pan camera (or toolCamera) is active, makes it fly to the given points and returns true; otherwise returns false and the caller does its normal jump.

- `points` (*table*) : List of {x,y,z} points to frame.
- **returns**: boolean true if the request was handled by the pan camera.

#### `editor_toolUtilities_panCamera.isOn()`

Tells whether the pan camera is active.

- **returns**: boolean true if the pan camera drives the view.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/panCamera.lua`.*
