# `util_showroom`

*File: `lua/ge/extensions/util/showroom.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_showroom`: `extensions.load("util_showroom")`, then the global `util_showroom`

Small "showroom" utility: spawns on demand a garage prefab (art/prefabs/garage_simple.prefab) at the fixed position (0, 0, 1000) in the current level and lets you move a vehicle into it. The prefab is loaded at the first call that needs its position (moveInside, getPosRot) and unloaded at the end of the level (onClientEndMission).

## Example

```lua
local veh = getPlayerVehicle(0)
util_showroom.moveInside(veh) -- loads the garage if needed, teleports and places the vehicle
print(util_showroom.isInside(veh:getPosition()))
```

## Notes

- Garage position: vec3(0, 0, 1000), identity rotation; these values are fixed (getSuitablePosition).
- isInside returns nil (not false) if the prefab is not loaded; otherwise true when the position is less than 20 m from the garage center (deliberately simple test, marked TODO in the code).
- If the prefab fails to load, the logged error message displays the position variable, which is still nil at that point; getPosRot does not check the failure and the following function would then do position + pos with position nil (Lua error).
- The code does not detect an already present prefab (TODO comment): a Lua reload can leave several.
- isInside uses core_camera without declaring it as a dependency.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_showroom.getPosRot()` | Returns the position and rotation of the garage interior (loads the prefab if needed). | 39 |
| `util_showroom.isInside(pos)` | Indicates whether a position is in the garage (distance to center < 20 m). With no argument, uses the player vehicle's position or, failing that, the camera's. | 49 |
| `util_showroom.moveInside(veh)` | Loads the garage if needed, places the vehicle at its position (setPosRot) then calls veh:autoplace(false) to set it down. | 42 |
| `util_showroom.onClientEndMission()` | Hook called at the end of the level: removes the prefab and reloads collision (be:reloadCollision). *(internal)* *(hook)* | 26 |

### Parameter details

#### `util_showroom.getPosRot()`

Returns the position and rotation of the garage interior (loads the prefab if needed).

- **returns**: vec3 World position of the garage (0, 0, 1000).
- **returns**: quat Identity rotation (0, 0, 0, 1).

#### `util_showroom.isInside(pos)`

Indicates whether a position is in the garage (distance to center < 20 m). With no argument, uses the player vehicle's position or, failing that, the camera's.

- `pos` (*vec3|nil*) : World position to test.
- **returns**: boolean|nil true if inside; false outside the garage; nil if the prefab is not loaded.

#### `util_showroom.moveInside(veh)`

Loads the garage if needed, places the vehicle at its position (setPosRot) then calls veh:autoplace(false) to set it down.

- `veh` (*table*) : Vehicle object to move.

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/showroom.lua`.*
