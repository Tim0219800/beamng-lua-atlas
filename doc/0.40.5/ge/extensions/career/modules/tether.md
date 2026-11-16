# `career_modules_tether`

*File: `lua/ge/extensions/career/modules/tether.lua` · VM: Game Engine (GE) · 287 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tether`: `extensions.load("career_modules_tether")`, then the global `career_modules_tether`

Career mode "tether" system: a zone (box, sphere, capsule, gate or vehicle) the player must stay around. When the player (player vehicle 0, or unicycle on foot) leaves the zone, the callback is called once and the tether is removed. The extension's onUpdate hook is wired only while at least one tether is active.

## Example

```lua
local t = career_modules_tether.startSphereTether(vec3(100,200,50), 30, function(tether) log('I','','too far') end)
-- later, to cancel without triggering the callback:
career_modules_tether.removeTether(t)
```

## Notes

- Distances in meters. Tethers are tested on each onUpdate; the callback receives the tether table.
- Bug: startCapsuleTetherBetweenStaticAndVehicle uses checkfun = checkWalkawayCapsuleTether, which is not defined in the file (nil); the checkCapsuleTetherWithVeh function, which seems intended for this use, is never used. Such a tether would cause an error in onUpdate.
- Minor bug: startVehicleTether reads a nonexistent global variable `data` (data = data or {}): data is always {}; the callback parameter is used correctly but no data parameter exists.
- If the target vehicle of a vehicle tether no longer exists, the tether triggers (callback called).
- The check* functions return nil (no trigger) if no player vehicle exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tether.addTether(t)` | Adds a tether table (with checkfun and callback) to the active list and enables the onUpdate hook if it is the first. | 205 |
| `career_modules_tether.drawAxisBox(corner, x, y, z, clr)` | Draws a translucent box with debugDrawer (faces as triangles, black edges), useful to visualize a box tether. | 228 |
| `career_modules_tether.removeTether(t)` | Removes a tether from the list without calling its callback. No effect if t is nil or absent. | 213 |
| `career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data)` | Creates an oriented box tether: triggers when the player leaves the box defined by corner p1 and edge vectors x1, y1, z1. | 27 |
| `career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data)` | Intended for a capsule between a fixed point and a vehicle (p2 follows the vehicle). See notes: checkfun references an undefined function. | 112 |
| `career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data)` | Creates a conical capsule tether between two fixed points, with the radius varying linearly from r1 to r2 along the segment. | 94 |
| `career_modules_tether.startDoorTether(door, bufferLength, callback, data)` | Creates a box tether from a zone object in the scene (door[1] = object name), enlarged by bufferLength meters on each axis. Returns nothing if the object is not found. | 38 |
| `career_modules_tether.startSphereTether(p1, r1, callback, data)` | Creates a spherical tether: triggers when the player's vehicle is more than r1 meters from p1. | 63 |
| `career_modules_tether.startVehicleTether(vehId, radius, inverse, callback)` | Creates a tether around a vehicle: triggers when the player is more than radius meters from the vehicle, or, if inverse is true, when they are less than radius meters away. | 156 |

### Parameter details

#### `career_modules_tether.addTether(t)`

Adds a tether table (with checkfun and callback) to the active list and enables the onUpdate hook if it is the first.

- `t` (*table*) : Tether with checkfun(t) and callback(t).

#### `career_modules_tether.drawAxisBox(corner, x, y, z, clr)`

Draws a translucent box with debugDrawer (faces as triangles, black edges), useful to visualize a box tether.

- `corner` (*vec3*) : Corner of the box.
- `x` (*vec3*) : X edge vector.
- `y` (*vec3*) : Y edge vector.
- `z` (*vec3*) : Z edge vector.
- `clr` (*any*) : Face color, default color(128,64,64,32).

#### `career_modules_tether.removeTether(t)`

Removes a tether from the list without calling its callback. No effect if t is nil or absent.

- `t` (*table|nil*) : Tether returned by a start*Tether.

#### `career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data)`

Creates an oriented box tether: triggers when the player leaves the box defined by corner p1 and edge vectors x1, y1, z1.

- `p1` (*vec3*) : Corner of the box.
- `x1` (*vec3*) : X edge vector.
- `y1` (*vec3*) : Y edge vector.
- `z1` (*vec3*) : Z edge vector.
- `callback` (*function*) : Called with the tether when the player has left.
- `data` (*any*) : Free-form data kept in the tether (t.data).
- **returns**: table The tether table (to pass to removeTether).

#### `career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data)`

Intended for a capsule between a fixed point and a vehicle (p2 follows the vehicle). See notes: checkfun references an undefined function.

- `p1` (*vec3*) : Fixed point.
- `r1` (*number*) : Radius at the fixed point.
- `vehId` (*integer*) : Vehicle id.
- `r2` (*number*) : Radius on the vehicle side.
- `callback` (*function*) : Called when the player leaves.
- `data` (*any*) : Free-form data.
- **returns**: table The tether.

#### `career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data)`

Creates a conical capsule tether between two fixed points, with the radius varying linearly from r1 to r2 along the segment.

- `p1` (*vec3*) : First point.
- `r1` (*number*) : Radius at the first point.
- `p2` (*vec3*) : Second point.
- `r2` (*number*) : Radius at the second point.
- `callback` (*function*) : Called when the player leaves.
- `data` (*any*) : Free-form data.
- **returns**: table The tether.

#### `career_modules_tether.startDoorTether(door, bufferLength, callback, data)`

Creates a box tether from a zone object in the scene (door[1] = object name), enlarged by bufferLength meters on each axis. Returns nothing if the object is not found.

- `door` (*table*) : Table whose first element is the scene object name.
- `bufferLength` (*number|nil*) : Margin added to each axis, default 1.
- `callback` (*function*) : Called when the player leaves.
- `data` (*any*) : Free-form data.
- **returns**: table|nil The tether, or nil if the object is not found.

#### `career_modules_tether.startSphereTether(p1, r1, callback, data)`

Creates a spherical tether: triggers when the player's vehicle is more than r1 meters from p1.

- `p1` (*vec3*) : Center.
- `r1` (*number*) : Radius in meters.
- `callback` (*function*) : Called when the player leaves.
- `data` (*any*) : Free-form data.
- **returns**: table The tether.

#### `career_modules_tether.startVehicleTether(vehId, radius, inverse, callback)`

Creates a tether around a vehicle: triggers when the player is more than radius meters from the vehicle, or, if inverse is true, when they are less than radius meters away.

- `vehId` (*integer*) : Id of the tracked vehicle.
- `radius` (*number*) : Radius in meters.
- `inverse` (*boolean|nil*) : If true, triggers on approach rather than on moving away.
- `callback` (*function*) : Called on trigger.
- **returns**: table The tether.

## Fields

| Field | Type | Description |
|---|---|---|
| `onUpdate` | function | Is nop at the start; replaced by the real checking loop as soon as a tether is added, set back to nil when the last one is removed (with extensions.hookUpdate to (un)register the hook). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tether.lua`.*
