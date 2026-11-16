# `flowgraph_nodes_events_customizedTriggerBox`

*File: `lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua` · VM: Game Engine (GE) · 270 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/events/customizedTriggerBox")` (file under extensions/ but not a regular extension)

Flowgraph node "Custom Trigger" (category repeat_instant, event). Creates a trigger zone (box or sphere/ellipsoid) while the project is running. Input pins: position (vec3), rotation (quat), scale (number or vec3), vehId (default: player vehicle). Outputs: enter and exit (pulses), inside, outside, vehId. The zone type (Box/Sphere) is chosen in the editor.

## Notes

- data.highPrecision: tests 4 points of the vehicle's bounding box (instead of its position alone). data.debug: draws the zone with debugDrawer.
- If the vehicle cannot be found, all outputs are set to nil.
- The trigger is recomputed when position, rotation or scale change. The type is serialized (triggerType).
- Code todo: to be merged with onBeamNGTrigger.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the inside/outside states and marks the trigger for recomputation. | 51 |
| `C:_executionStopped()` | Forgets the stored position, scale and points. | 59 |
| `C:_onDeserialized(res)` | Rereads triggerType from res. | 263 |
| `C:_onSerialize(res)` | Saves triggerType in res. | 259 |
| `C:checkIntersections()` | Tests whether any of the vehicle's points is inside the zone (containsOBB_point or containsEllipsoid_Point) and updates enterFlag, exitFlag, vehInside. | 66 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws a colored box with edges via debugDrawer (debug mode). | 178 |
| `C:drawCustomProperties()` | Editor: trigger type dropdown; returns the change reason. | 235 |
| `C:drawMiddle(builder, style)` | Node drawing in the editor. | 255 |
| `C:init(mgr, ...)` | Initializes the flags, triggerType = 'Box', data.highPrecision and data.debug to false. | 40 |
| `C:work(args)` | Recomputes the zone if needed, gets the vehicle's points, calls checkIntersections and fills the output pins. | 93 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua`.*
