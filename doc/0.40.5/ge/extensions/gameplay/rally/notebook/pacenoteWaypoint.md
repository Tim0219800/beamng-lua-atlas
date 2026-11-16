# `gameplay_rally_notebook_pacenoteWaypoint`

*File: `lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua` · VM: Game Engine (GE) · 369 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/notebook/pacenoteWaypoint")` (file under extensions/ but not a regular extension)

Waypoint of a rally pacenote: a position, a radius, a normal (direction of a crossing plane) and a type (cornerStart or cornerEnd, see waypointTypes). It can serialize itself, draw itself in the 3D view with debugDrawer (sphere, plane, text, or cylinders in recce mode) and stores the associated route points for distance computation. The module returns a constructor: require(...)(pacenote, name, pos, forceId).

## Example

```lua
local newWp = require('/lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint')
local wp = newWp(pacenote, 'Waypoint 1', vec3(0,0,0))
wp:setManual(vec3(10,5,0), 4, vec3(0,1,0))
```

## Notes

- setPos and setManual copy the received vec3 (vec3(pos)) so as not to share state with the caller.
- Probable bug: setNormal(nil) resets the normal to the default (0,1,0) but then runs normal:length() on nil, which raises an error. A normal with length <= 0.9 is silently ignored.
- The initial radius comes from editor_rallyEditor.getPrefDefaultRadius() if the editor is loaded, otherwise from rallyUtil.default_waypoint_intersect_radius.
- onSerialize writes only oldId, name, waypointType, pos, radius, normal; onDeserialized restores in "manual" mode (oldIdMap unused).
- colorForWpType returns nil if waypointType is neither cornerStart nor cornerEnd.

## Class `C`

Waypoint instance. Fields: pacenote, id, name, waypointType, normal (vec3), pos (vec3), radius, intersectRadius, sortOrder (999999 by default), mode (nil or "manual"), routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.

The module returns a constructor: `local obj = require("gameplay_rally_notebook_pacenoteWaypoint")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:colorForWpType(pn_drawMode)` | Waypoint color according to its type and the drawing mode: normal cs/ce colors, "adjacent" for 'previous' and 'next', "adjacent_bg" for 'background'. | 135 |
| `C:drawDebug(hover, text, clr_shape, alpha_shape, alpha_text, clr_text_fg, clr_text_bg, radius_factor, globalOpacity)` | Draws the waypoint: sphere of radius radius (or radius*radius_factor), optional text and a square prism representing the crossing plane. On hover, the opacity is replaced by the "hover" values. | 155 |
| `C:drawDebugRecce(i, noteText)` | Recce mode drawing: the note's text above, a translucent plane and three cylinders forming a 6 m high gantry. The next waypoint (i == 1) is more opaque. | 225 |
| `C:getOriginalDistToTarget()` | Original distance to the route point's target. | 349 |
| `C:getRoutePoint()` | Returns the stored route point. | 336 |
| `C:getStaticOriginalDistToTarget()` | Original distance to the static route point's target. | 353 |
| `C:getStaticRoutePoint()` | Returns the static route point. | 345 |
| `C:init(pacenote, name, pos, forceId)` | Constructor. The id comes from forceId or pacenote:getNextUniqueIdentifier(), the type from pacenote:getNextWaypointType(), the default name is "Waypoint <id>". | 17 |
| `C:isCe()` | true if the type is cornerEnd. | 324 |
| `C:isCs()` | true if the type is cornerStart. | 320 |
| `C:isLockable()` | true if the type is cornerStart or cornerEnd. | 307 |
| `C:isLocked()` | true if the waypoint is lockable and the preference editor_rallyEditor.getPrefLockWaypoints() is enabled. | 311 |
| `C:nameWithPacenote()` | Text "<pacenote name>[Cs\|Ce]". | 357 |
| `C:onDeserialized(data, oldIdMap)` | Restores type, name, position, radius and normal from the saved data. | 90 |
| `C:onSerialize()` | Returns the table to write as JSON: oldId, name, waypointType, pos, radius, normal (arrays of 3 numbers). | 79 |
| `C:setManual(pos, radius, normal)` | Switches to "manual" mode and sets position, radius and normal. | 59 |
| `C:setNormal(normal)` | Sets the normal, normalized, if its length exceeds 0.9; otherwise unchanged. | 70 |
| `C:setPos(newpos)` | Sets the position (copy of the vec3). | 66 |
| `C:setRoutePoint(rp)` | Stores the route point and its original distToTarget (which changes when the point becomes the first of the route). | 328 |
| `C:setStaticRoutePoint(rp)` | Same as setRoutePoint for the static route. | 340 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua`.*
