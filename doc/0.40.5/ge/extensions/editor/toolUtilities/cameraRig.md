# `editor_toolUtilities_cameraRig`

*File: `lua/ge/extensions/editor/toolUtilities/cameraRig.lua` · VM: Game Engine (GE) · 252 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_cameraRig`: `extensions.load("editor_toolUtilities_cameraRig")`, then the global `editor_toolUtilities_cameraRig`

Reusable camera rig for editor tools: pan state (pan, near-aerial view with north up) and orbit state with inertia, which produces a pose (pos, yaw, pitch, roll) for a script-driven camera (scriptedFree). Pure state and math module, with no engine coupling: the host tool reads the inputs, calls update() every frame and pushes the returned pose. Timed transitions between focuses remain the host's responsibility.

## Notes

- Angles are in degrees; yaw 0 looks toward +Y, a positive pitch looks downward.
- The returned position is a shared vec3 reused on every call: copy it to keep it.
- The pan uses pitch 89.9 (not 90) and roll 0 to avoid degeneracy of the quaternion basis.
- Constants: pan height 15 to 3000 m (default 220), zoom x0.86 per notch; orbit distance 6 to 2500 m (default 130), pitch -30 to 88, ground margin 2 m; mouse deltas > 250 px are rejected (hidden cursor recentering).
- update() clamps dt to 0.05 s.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height)` | Switches to PAN mode centered on the origin of a footprint and returns its target top-down pose. | 196 |
| `editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg)` | Switches to ORBIT mode centered on the centroid of a building and returns its 3/4 target pose. The distance is radius*2.4 (clamped), otherwise 130 m. | 209 |
| `editor_toolUtilities_cameraRig.getMode()` | Current mode of the rig. | 241 |
| `editor_toolUtilities_cameraRig.recenter(centroid)` | Moves the orbit PIVOT to `centroid` while keeping yaw/pitch/distance, and returns the pose that preserves the framing. Switches to orbit mode and cancels inertia. | 223 |
| `editor_toolUtilities_cameraRig.settle()` | Cancels any residual inertia (pan and orbit) and the drag state; to be called when a timed transition ends before handing control back to interaction. | 234 |
| `editor_toolUtilities_cameraRig.update(dt, input)` | Advances the interactive camera by one frame and returns the pose to push. In pan, a drag grabs the ground (with inertia); in orbit it rotates around the pivot (with inertia); the wheel zooms/dollies. | 98 |

### Parameter details

#### `editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height)`

Switches to PAN mode centered on the origin of a footprint and returns its target top-down pose.

- `originXY` (*table|nil*) : {x=,y=} center (0,0 if nil).
- `terrainH` (*number|nil*) : Ground altitude; if nil the last known one is kept.
- `height` (*number|nil*) : Camera height above the ground (clamped to 15-3000 m).
- **returns**: vec3 Position
- **returns**: number yaw
- **returns**: number pitch
- **returns**: number roll

#### `editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg)`

Switches to ORBIT mode centered on the centroid of a building and returns its 3/4 target pose. The distance is radius*2.4 (clamped), otherwise 130 m.

- `centroid` (*vec3|nil*) : Pivot (origin if nil).
- `radius` (*number|nil*) : Bounding radius; used only if > 1.
- `yawDeg` (*number|nil*) : Initial yaw (default 30).
- `pitchDeg` (*number|nil*) : Initial pitch (default 32, clamped -30..88).
- **returns**: vec3 Position
- **returns**: number yaw
- **returns**: number pitch
- **returns**: number roll (0)

#### `editor_toolUtilities_cameraRig.getMode()`

Current mode of the rig.

- **returns**: string 'pan' (footprint) or 'orbit' (volume).

#### `editor_toolUtilities_cameraRig.recenter(centroid)`

Moves the orbit PIVOT to `centroid` while keeping yaw/pitch/distance, and returns the pose that preserves the framing. Switches to orbit mode and cancels inertia.

- `centroid` (*vec3|nil*) : New pivot (each missing component keeps the old one).
- **returns**: vec3 Position
- **returns**: number yaw
- **returns**: number pitch
- **returns**: number roll (0)

#### `editor_toolUtilities_cameraRig.update(dt, input)`

Advances the interactive camera by one frame and returns the pose to push. In pan, a drag grabs the ground (with inertia); in orbit it rotates around the pivot (with inertia); the wheel zooms/dollies.

- `dt` (*number|nil*) : Frame duration in seconds (capped at 0.05).
- `input` (*table|nil*) : { dragActive:boolean, dragDX:number, dragDY:number (screen pixels), wheel:number (notches), groundZAt:function(x,y[,heightAbove])->number|nil (ground altitude; average over the view if heightAbove), limitXY:function(x,y)->x,y (bounds the pan center) }
- **returns**: vec3 Camera position (shared vec3).
- **returns**: number yaw in degrees
- **returns**: number pitch in degrees
- **returns**: number roll in degrees

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/cameraRig.lua`.*
