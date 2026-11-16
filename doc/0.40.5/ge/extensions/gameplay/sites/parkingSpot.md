# `gameplay_sites_parkingSpot`

*File: `lua/ge/extensions/gameplay/sites/parkingSpot.lua` · VM: Game Engine (GE) · 479 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/sites/parkingSpot")` (file under extensions/ but not a regular extension)

"ParkingSpot" class of a sites set: an oriented rectangle (position, rotation, dimensions scl = width X, length Y, height Z) representing a parking spot. Allows testing whether a vehicle fits in it, whether it is parked in it, whether it is occupied, and teleporting a vehicle into it. Can generate several side-by-side spots ("multi-spot"). The module returns a constructor.

## Example

```lua
local ok, corners = spot:checkParking(vehId, 0.8, 5, 1)
if spot:vehicleFits(vehId) and not spot:hasAnyVehicles(vehId) then
  spot:moveResetVehicleTo(vehId, false, false, nil, nil, true)
end
```

## Notes

- Local axes: X = width, Y = direction of the spot (front), Z = height; scl holds the total dimensions.
- Multiple spots (isMultiSpot) are expanded by generateMultiSpots during finalizeSites: the copies are marked isProcedural and have no debug drawing of their own.
- multiSpotData.spotDirection is 'Left', 'Right', 'Front' or 'Back'. If another value is given, the offset stays that of the last computation (shared temporary variable).
- checkParking: speeds are compared to the square of the speed norm (m/s). Defaults: drivingSpeed 5 m/s, parkingSpeed 1 m/s, precision 0.8.
- moveResetVehicleTo in non-safeTeleport mode always multiplies the final quaternion by backwardsQuat (180° rotation around Z), even if backwards is false; the returned quaternion is modified in place by this multiplication.

## Class `C`

Parking spot object. Fields: sites, id, name, color, vertices (4 2D corners), pos, rot, scl, isMultiSpot, multiSpotData {spotAmount, spotOffset, spotDirection, spotRotation}, wasGenerated, isProcedural, customFields.

The module returns a constructor: `local obj = require("gameplay_sites_parkingSpot")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:boxFits(extentsX, extentsY, extentsZ)` | Tests whether a box of given dimensions fits in the spot's dimensions (per-axis comparison, no rotation). | 347 |
| `C:calcVerts()` | Recalculates the 4 2D corners (vertices) from pos, rot and scl. | 244 |
| `C:checkParking(vehId, precision, drivingSpeed, parkingSpeed)` | Checks whether a vehicle is correctly parked: low speed, aligned with the spot's axis (\|cos\| >= 0.707) and the corners of its bounding box inside. With precision <= 0, only the vehicle's center is tested. | 294 |
| `C:containsPoint(pos)` | Tests whether a point is inside the spot's volume (oriented box, with a quick radius check). | 257 |
| `C:drawDebug(drawMode, clr, customHeight, drawDirection)` | Draws the spot in debug (surface, direction, name depending on the mode). Ignores procedural spots. | 87 |
| `C:drawSide(a, b, z, clrI)` | Draws a vertical side of the spot between two points (debug aid). | 176 |
| `C:generateMultiSpots(parkingSpotList, skipSort)` | For a multi-spot, creates the additional spots (name "<name>.<n>") offset according to spotDirection/spotOffset, with the spotRotation rotation, and copies tags and custom fields. Acts only once (wasGenerated). | 198 |
| `C:getPath()` | Text identifier of the spot: folder + file of the sites set + "#" + name. | 83 |
| `C:hasAnyVehicles(playerId)` | Indicates whether an active vehicle occupies the spot (bounding box center inside it; for vehicles tracked by map, edges are also tested). | 359 |
| `C:init(sites, name, forceId)` | Constructor. Default name "Parking <id>". | 17 |
| `C:moveResetVehicleTo(vehId, lowPrecision, backwards, addedOffsetPos, addedOffsetRot, useSafeTeleport, removeTraffic, resetVehicleInSafeTeleport, options)` | Places a vehicle on the spot, aligned to its rotation. With useSafeTeleport, goes through spawn.safeTeleport; otherwise computes the bounding box offset, positions the vehicle, resets the flexmesh and calls autoplace. | 399 |
| `C:onDeserialized(data)` | Restores the spot from the data and recalculates the corners. | 55 |
| `C:onSerialize()` | Serializes the spot (position, original rotation, dimensions, multi-spot parameters, color, custom fields). | 35 |
| `C:set(pos, rot, scl)` | Changes position, rotation and/or dimensions (nil values ignored) and recalculates the corners. | 70 |
| `C:vehicleFits(vehId)` | Tests whether the vehicle fits (initial node bounding box, initialNodePosBB). | 351 |

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`
- `debugDrawer:` `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/sites/parkingSpot.lua`.*
