# `flowgraph_nodes_scene_rectMarker`

*File: `lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua` · VM: Game Engine (GE) · 409 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/rectMarker")` (file under extensions/ but not a regular extension)

Flowgraph node "Parking Markers" (repeat_instant, author BeamNG). Creates a rectangular parking spot: a Box-type BeamNGTrigger and 4 corner markers (TSStatic art/shapes/interface/position_marker.dae) placed on the ground, colored depending on whether the vehicle is inside. Outputs: inside, outside, partlyInside, stopped, stopping, stoppedPercent, dotAngle, forward, sideDistance, forwardDistance (and relative versions, hidden). Detects stopping (speed <= 0.15 m/s for stop_timer s).

## Notes

- Bug: in checkParking, sc is filled from self.pinIn.position (instead of scale): sideDistanceRelative and forwardDistanceRelative are divided by the position, not by the size.
- updateMarkerPositions overwrites the color of each marker with "1 0 0 1" on every change; checkParking then recolors it.
- Old pin name reset -> clear (legacyPins).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets stopTimer to 1 and marks the state as changed. | 91 |
| `C:_executionStopped()` | Calls clear when the graph stops. | 96 |
| `C:_onDeserialized(res)` | Restores nothing. | 404 |
| `C:_onSerialize(res)` | Saves nothing. | 400 |
| `C:checkParking()` | Tests whether the 8 corners of the vehicle's bounding box are inside the trigger, colors the markers and computes the outputs (inside, partlyInside, distances, stopping). | 132 |
| `C:clear()` | Deletes the created trigger and markers and resets the state to zero. | 66 |
| `C:createCornerMarker(markerName)` | Creates a corner-marker TSStatic registered under the given name and adds it to the MissionGroup. | 240 |
| `C:createMarkers()` | Creates the 4 corner markers. | 266 |
| `C:drawCustomProperties()` | Editor properties panel (empty). | 227 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 232 |
| `C:init(mgr, ...)` | Initializes trigger, markers, debug=false and stopTimer=1. | 56 |
| `C:manageTrigger()` | Creates the BeamNGTrigger (position, scale, rotation) on the first call, then updates it if the pins change. | 331 |
| `C:onClientEndMission()` | End-of-mission hook: calls clear. | 100 |
| `C:updateMarkerPositions()` | If the spot changed, repositions each marker on the ground (raycast) aligning its normal, or flat if staticMarkers. | 273 |
| `C:work(args)` | On clear, deletes everything and empties the outputs; on flow, handles the trigger, repositions the markers and checks the parking. | 105 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `Sim.` `upcast`
- `debugDrawer:` `drawTriSolid`
- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua`.*
