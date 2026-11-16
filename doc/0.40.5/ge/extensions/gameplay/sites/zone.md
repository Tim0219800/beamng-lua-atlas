# `gameplay_sites_zone`

*File: `lua/ge/extensions/gameplay/sites/zone.lua` · VM: Game Engine (GE) · 501 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/sites/zone")` (file under extensions/ but not a regular extension)

"Zone" class of a sites set: a 2D polygon (list of vertices in world coordinates) delimiting a map region, optionally with two planes (top and bottom) bounding the zone in height. Used to test whether a point or vehicle is inside the zone (city limits, traffic zones, mission zones) and to draw it in debug. The module returns a constructor.

## Example

```lua
local zone = sites.zones.objects[id]
if zone:containsPoint2D(veh:getPosition()) then print('inside', zone.name) end
print(zone:zoneArea())
```

## Notes

- The containment test is 2D (parity algorithm on x/y): height only matters through the active top/bot planes (pointBetweenPlanes); with no active plane, the zone is infinite in z.
- processVertices sets v.radius = 5 for each vertex and chains the vertices in a loop (v.next / v.prev). It must be called after any manual modification of self.vertices; addVertex, removeVertex and autoPlanes do so.
- A zone with no vertices is marked aabb.invalid = true and logs an error.
- rayIntersectsZone assumes all vertices have a next field (so processVertices has already been called).
- makeHighResolutionFence replaces the vertices with intermediate points (max step 3 m by default), snapped to the terrain if core_terrain exists.
- drawFence modifies the a field of the ColorI passed as an argument.

## Class `C`

Zone object. Fields: sites, id, name, color, vertices (list of {pos, radius, index, next, prev}), center, labelPos, aabb {xMin..zMax, invalid}, top / bot ({pos, normal, active}), fenceDown, fenceHeight, usePlanes, customFields, locations and parkingSpots (filled by finalizeSites).

The module returns a constructor: `local obj = require("gameplay_sites_zone")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:aabbCheck(point)` | Quick x/y test against the bounding box (z ignored). | 197 |
| `C:addVertex(pos, index)` | Inserts a vertex (at the end or at the given index) and recalculates the derived data. | 72 |
| `C:autoPlanes(ignoreTop, ignoreBot)` | Automatically creates horizontal planes 5 m above the highest vertex and 5 m below the lowest, centered on the zone. | 143 |
| `C:changedPlanes()` | To call after modifying the top/bot planes; reruns processVertices. | 132 |
| `C:containsPoint2D(point)` | Tests whether a point is inside the polygon (x/y) and between the planes. | 252 |
| `C:containsVehicle(veh, basic)` | Tests whether a vehicle is inside the zone, based on its spawn bounding box: center only in basic mode, otherwise the four bottom/top corners used (points 0, 3, 4 and 7) must all be inside the zone. | 275 |
| `C:drawDebug(drawMode, clr, customHeight, customDown, nearCam, drawDistance)` | Draws the zone in debug (translucent fence, name, planes depending on the mode). Only draws if the camera is close enough. | 291 |
| `C:drawFence(from, to, clrI, down, up, usePlanes, nearCam, drawDistance, shapeAlpha)` | Draws a fence panel (two triangles, double-sided) between two points. | 393 |
| `C:drawMinimap(td)` | Draws the zone outline on the UI minimap (white lines). | 380 |
| `C:drawPlane(plane, clrF)` | Draws a plane (top or bottom) with lines linking its anchor point to the projected vertices, and its normal. | 369 |
| `C:init(sites, name, forceId)` | Constructor. sites may be nil (identifier -1). Default values: fenceDown 0, fenceHeight 5, planes inactive. | 7 |
| `C:makeHighResolutionFence(maxStep)` | Replaces the vertices with a version sampled every maxStep meters (at least 1), snapped to the terrain height. | 446 |
| `C:onDeserialized(data)` | Restores the zone from the data and calls processVertices. | 51 |
| `C:onSerialize()` | Serializes name, vertices, color, custom fields and top/bot planes. | 26 |
| `C:pointBetweenPlanes(point)` | Indicates whether a point is between the active planes (an inactive plane is ignored). | 167 |
| `C:processVertices()` | Precomputations: bounding box (aabb), center, label position, vertex chaining, aabb extension by the planes. If a plane is not active, the corresponding z bound is infinite. | 83 |
| `C:rayIntersectsZone(rayPos, rayDir)` | Intersection distance of a ray with the "fence" (vertical walls along the outline, bounded by fenceDown/fenceHeight or by the planes). | 214 |
| `C:removeVertex(index)` | Removes the vertex at the given index and recalculates. | 77 |
| `C:validPlanes()` | Tests that both planes are active and that their normals point up (top) and down (bot) respectively. | 137 |
| `C:vertexPlaneIntersection(vertex, plane)` | Vertically projects (z axis) a vertex onto a plane. Returns the vertex unchanged if the plane is inactive or aligned with the z axis (error logged). | 181 |
| `C:zoneArea()` | Polygon area in m² (shoelace formula, x/y). 0 if fewer than 3 vertices. | 476 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/sites/zone.lua`.*
