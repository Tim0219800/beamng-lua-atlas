# `editor_toolUtilities_siteView`

*File: `lua/ge/extensions/editor/toolUtilities/siteView.lua` · VM: Game Engine (GE) · 161 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteView`: `extensions.load("editor_toolUtilities_siteView")`, then the global `editor_toolUtilities_siteView`

Manages the camera of the outline editor tools (open space editor, parking lot editor): which editing step is shown (Footprint or Design) and which of the three cameras (pan, rotate, free) frames the selection. Relies on editor/toolUtilities/toolCamera for movements. Only one tool is active at a time, so the state (step, mode, last selection) is unique at module level. The massing editor keeps its own version, but offers the same buttons.

## Example

```lua
local sv = require('editor/toolUtilities/siteView')
sv.init({ ring = function() return myOutlinePoints end, terrainZ = function(x, y) return core_terrain.getTerrainHeight(vec3(x, y, 0)) end, selIndex = function() return selected end, onStep = function(key) end })
sv.reset()
-- every frame: sv.followSelection(); sv.drive(isDrawing)
```

## Notes

- init(c) expects a table with ring() (list of points with .x/.y), terrainZ(x, y), selIndex() and onStep(key); only ring and selIndex are optional in the code, terrainZ is called without a test as soon as framing happens.
- Without an outline (ring() nil or empty), focus() frames the point (0, 0) with a radius of 24 m.
- The 'pan' mode places the camera at the altitude that makes the outline fit in the field of view (radius / tan(fov/2)) plus 5 m of margin; the 'rotate' mode orbits with a radius of at least 8 m.
- The 'free' mode gives the editor's camera back to the user; clicking it again does nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteView.activate(m)` | Takes over the editor's camera (toolCam.takeOver) then frames the selection. | 65 |
| `editor_toolUtilities_siteView.clickMode(m)` | Action of a camera button: switches to that mode, or reframes if it is already active (except 'free', where nothing happens). This second press serves as "go to site". | 104 |
| `editor_toolUtilities_siteView.drive(blocked)` | Per-frame camera driving (toolCam.drive), except in free mode. | 116 |
| `editor_toolUtilities_siteView.focus(m)` | Sends the active camera (pan or orbit) to the selection, based on the outline supplied by ring(). Also remembers the current selection. | 56 |
| `editor_toolUtilities_siteView.followSelection()` | Reframes if the selection (ctx.selIndex()) has changed since the last framing. No effect in free mode. | 109 |
| `editor_toolUtilities_siteView.getMode()` | Returns the current camera mode. | 133 |
| `editor_toolUtilities_siteView.getStep()` | Returns the current step. | 132 |
| `editor_toolUtilities_siteView.handBack()` | Gives the editor's camera back when leaving the tool (toolCam.handBack(false)). | 121 |
| `editor_toolUtilities_siteView.init(c)` | Binds the module to the host tool by storing the context. `ring` returns the outline to frame, `terrainZ` the ground under a point, `selIndex` the current selection (to reframe when it changes) and `onStep` is called when the step changes. | 32 |
| `editor_toolUtilities_siteView.isShaping()` | True when the current step is 'footprint'. | 131 |
| `editor_toolUtilities_siteView.reset()` | Resets the tool's opening state: design step, rotate mode, then activates and frames the camera in orbit. | 126 |
| `editor_toolUtilities_siteView.setMode(m)` | Changes camera. To 'free': gives the camera back to the editor. From 'free' to another mode: takes over and frames; otherwise, simply reframes. | 71 |
| `editor_toolUtilities_siteView.setStep(key)` | Changes editing step and calls ctx.onStep(key). 'footprint' forces the pan camera (nodes are drawn flat) and remembers whether the user was in free; on leaving, restores free if that was the case, otherwise goes back to rotate. | 86 |

### Parameter details

#### `editor_toolUtilities_siteView.activate(m)`

Takes over the editor's camera (toolCam.takeOver) then frames the selection.

- `m` (*string|nil*) : Mode to activate; defaults to the current mode.

#### `editor_toolUtilities_siteView.clickMode(m)`

Action of a camera button: switches to that mode, or reframes if it is already active (except 'free', where nothing happens). This second press serves as "go to site".

- `m` (*string*) : Mode of the clicked button.

#### `editor_toolUtilities_siteView.drive(blocked)`

Per-frame camera driving (toolCam.drive), except in free mode.

- `blocked` (*boolean*) : Suppresses movement during the tool's modal interactions (drawing, dragging a handle).

#### `editor_toolUtilities_siteView.focus(m)`

Sends the active camera (pan or orbit) to the selection, based on the outline supplied by ring(). Also remembers the current selection.

- `m` (*string|nil*) : 'pan' or other (orbit); defaults to the current mode.

#### `editor_toolUtilities_siteView.getMode()`

Returns the current camera mode.

- **returns**: string 'pan', 'rotate' or 'free'.

#### `editor_toolUtilities_siteView.getStep()`

Returns the current step.

- **returns**: string 'footprint' or 'design'.

#### `editor_toolUtilities_siteView.init(c)`

Binds the module to the host tool by storing the context. `ring` returns the outline to frame, `terrainZ` the ground under a point, `selIndex` the current selection (to reframe when it changes) and `onStep` is called when the step changes.

- `c` (*table*) : Context { ring, terrainZ, selIndex, onStep }.

#### `editor_toolUtilities_siteView.isShaping()`

True when the current step is 'footprint'.

- **returns**: boolean step == 'footprint'.

#### `editor_toolUtilities_siteView.setMode(m)`

Changes camera. To 'free': gives the camera back to the editor. From 'free' to another mode: takes over and frames; otherwise, simply reframes.

- `m` (*string*) : 'pan', 'rotate' or 'free'.

#### `editor_toolUtilities_siteView.setStep(key)`

Changes editing step and calls ctx.onStep(key). 'footprint' forces the pan camera (nodes are drawn flat) and remembers whether the user was in free; on leaving, restores free if that was the case, otherwise goes back to rotate.

- `key` (*string*) : 'footprint' or 'design'.

## Fields

| Field | Type | Description |
|---|---|---|
| `modes` | table | List of camera buttons: { mode = 'pan'\|'rotate'\|'free', icon, tip }. |
| `steps` | table | List of editing steps offered in the interface: { key = 'footprint', label, icon } and { key = 'design', label, icon }. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteView.lua`.*
