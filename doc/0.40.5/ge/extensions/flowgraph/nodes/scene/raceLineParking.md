# `flowgraph_nodes_scene_raceLineParking`

*File: `lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua` · VM: Game Engine (GE) · 337 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/raceLineParking")` (file under extensions/ but not a regular extension)

Flowgraph node "Raceline Parking" (repeat_instant, author BeamNG). Checks that a vehicle is parked in a spot defined by position/rotation/scale (the scale gives half-width x, length y and depth z). Computes dotAngle, forward, sideDistance, forwardDistance (based on the center of the two front wheels) and detects stopping (speed <= 0.05 m/s for stop_timer seconds). Draws a colored debug volume in the world and, if the imgui pin is true, a 2D imgui preview.

## Notes

- Bug: checkParking reads self.pinIn.vehicleID whereas the pin is named vehId: this pin is ignored and the player's vehicle (getPlayerVehicle(0)) is always the one tracked. drawImgui also always uses the player's vehicle.
- getTwoSmallestValues returns the same wheel twice if the number of wheels is odd.
- drawDebug references the global variable drawMode, probably nil (alpha 0.25).
- Default rotation values quat(0,0,0,0) (invalid) if the pin is not connected.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets stopTimer to nil when the graph starts. | 44 |
| `C:_executionStopped()` | Resets stopTimer to nil when the graph stops. | 48 |
| `C:_onDeserialized(res)` | Restores nothing. | 268 |
| `C:_onSerialize(res)` | Saves nothing. | 264 |
| `C:checkParking()` | Computes the outputs (dotAngle, forward, sideDistance, forwardDistance, inside, stopping, stoppedPercent, stopped) for the tracked vehicle. | 151 |
| `C:drawDebug()` | Draws with debugDrawer semi-transparent triangles (spot box, left/right sides) colored according to the state. | 272 |
| `C:drawImgui()` | Draws the 280x300 imgui preview: spot edges (green/yellow/red), vehicle outline, front axle and stop progress circle. | 110 |
| `C:drawLine(line, color, thickness)` | Draws a 2D polyline in the current ImDrawList. | 90 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 260 |
| `C:getVehicleFrontwheelsCenterPosition(vehicle, pos)` | Returns the center of the two frontmost wheels, then the position of each wheel (vec3), or nothing if vehicle/pos is nil. | 236 |
| `C:init(mgr, ...)` | Nothing to initialize. | 40 |
| `C:onClientEndMission()` | Mission end hook: calls _executionStopped. | 52 |
| `C:toInternal2d(pos)` | Converts a world position into 2D coordinates of the imgui preview, relative to the spot. | 77 |
| `C:work(args)` | On clear, resets the outputs to nil; on flow, calls checkParking, drawDebug and optionally drawImgui. | 58 |
| `C:worldLineToMapLine(line)` | Converts a list of world points into 2D preview points (table reused between calls). | 101 |

## Calls into the engine (C++)

- `debugDrawer:` `drawTriSolid`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua`.*
