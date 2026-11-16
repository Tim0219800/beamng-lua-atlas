# `gameplay_race_startPosition`

*File: `lua/ge/extensions/gameplay/race/startPosition.lua` · VM: Game Engine (GE) · 237 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/race/startPosition")` (file under extensions/ but not a regular extension)

Class of a race start position: position and rotation of a start line, with a group ('start', 'rollingStart', 'recovery' or 'other'). It can place a vehicle on it while keeping its relative offset, copy a vehicle's placement and provide the front corners for crossing tests. The module returns a factory: require('/lua/ge/extensions/gameplay/race/startPosition')(race, name). Unlike the other race classes, its first argument is named race.

## Notes

- The groups' role is the one given by the code comment: start, rollingStart, recovery, other. Without a group in the data, a name containing 'Recovery' gives 'recovery', otherwise 'start'.
- moveResetVehicleTo uses a logTag variable not defined in the file (nil, with no consequence on the log).
- Without repair (repair = false), the vehicle is teleported with spawn.safeTeleport and a corrected rotation.
- calculateVehiclePosRot uses the spawn OOBB bounding box: in lowPrecision (vehicle loaded on the first frame), the vehicle is placed 2 m behind and 0.5 m above the position.
- The vehicle is oriented facing the line (the line's rotation composed with a half turn on Z).
- setToVehicle adjusts the height and slope to the terrain if a TerrainBlock exists.

## Class `C`

Start position. Fields: race, id (race:getNextUniqueIdentifier()), name ("Start Position <id>" by default), group, pos (vec3), rot (quat), sortOrder, routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.

The module returns a constructor: `local obj = require("gameplay_race_startPosition")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateVehiclePosRot(vehId, lowPrecision)` | Computes the position and rotation to give a vehicle so that it keeps its relative offset from its spawn box, centered on the line. | 139 |
| `C:drawDebug(drawMode, clr)` | Draws the start line (filled triangles), a red prism in highlight mode and the name. | 63 |
| `C:getFrontCorners(width, length)` | Corners of the area in front of the position: two lists, one of four points (width and length, toward the back of the line along -Y), the other of two points at 0.4 m. | 52 |
| `C:getRoutePoint()` | Associated road point. | 218 |
| `C:getStaticRoutePoint()` | Static road point. | 227 |
| `C:init(race, name)` | Constructor: id, name, group 'start', null position and rotation. | 7 |
| `C:moveResetVehicleTo(vehId, lowPrecision, repair)` | Moves a vehicle to the start position. By default with repair (setPositionRotation); with repair = false, safe teleport. | 170 |
| `C:onDeserialized(data)` | Restores the position from serialized data (group inferred from the name if absent). | 36 |
| `C:onSerialize()` | Serializes name, group, pos, rot (x,y,z,w) and oldId. | 25 |
| `C:set(pos, rot)` | Sets the position and rotation. | 47 |
| `C:setRoutePoint(rp)` | Stores the associated road point and its original distance to the target (distToTarget). | 211 |
| `C:setStaticRoutePoint(rp)` | Stores the static road point and its original distance. | 222 |
| `C:setToVehicle(vehId)` | Aligns the start position on a vehicle: center of its front, orientation of the vehicle (or of the terrain under it). | 190 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `findClassObjects`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/race/startPosition.lua`.*
