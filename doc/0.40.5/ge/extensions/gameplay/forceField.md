# `gameplay_forceField`

*File: `lua/ge/extensions/gameplay/forceField.lua` · VM: Game Engine (GE) · 113 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_forceField`: `extensions.load("gameplay_forceField")`, then the global `gameplay_forceField`

"Force field" mode of the Fun Stuff radial menu: creates a gravity "planet" (obj:setPlanets) around player 0's vehicle, sent to all other vehicles, which are thus pushed away (multiplier > 0) or attracted (< 0). Updated every 0.05 s of simulated time. Disables itself on vehicle change, at level end, when switching to career and before serialization.

## Example

```lua
extensions.load('gameplay_forceField')
gameplay_forceField.setForceMultiplier(-1) -- attraction
gameplay_forceField.activate()
```

## Notes

- Hardcoded parameters: range 100 (unused), planet radius 5, base mass -6e13 (negative = repulsion), multiplied by the vehicle size (longest half-side / 3) and by forceMultiplier.
- Command sent to each vehicle (vehicle VM): obj:setPlanets({x, y, z, radius, mass}). Deactivation sends obj:setPlanets({}) to all vehicles.
- active is nil (not false) as long as the mode has never been activated: isActive can return nil.
- Bug: longestHalfExtent = math.max(math.max(halfExtents.x, halfExtents.y), halfExtents.y) repeats y and ignores z. Also, the call vehicle:getID() is used for the comparison while the rest of the code uses getId().
- The variable range is declared but never used.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_forceField.activate()` | Activates the force field (no effect if already active) and displays a UI message indicating repulsion or attraction depending on the sign of forceMultiplier. | 17 |
| `gameplay_forceField.deactivate(silent)` | Deactivates the field: sends obj:setPlanets({}) to all vehicles and displays a "deactivated" message unless silent. No effect if inactive. | 24 |
| `gameplay_forceField.getForceMultiplier()` | Returns the current force multiplier. | 95 |
| `gameplay_forceField.isActive()` | Returns whether the force field is active. | 74 |
| `gameplay_forceField.onCareerActive(enabled)` | Hook: career activation; deactivates the field if enabled is true. *(internal)* *(hook)* | 85 |
| `gameplay_forceField.onClientEndMission()` | Hook: level end; deactivates the field. *(internal)* *(hook)* | 66 |
| `gameplay_forceField.onDeserialized()` | Hook: after a Lua reload; does nothing. *(internal)* *(hook)* | 82 |
| `gameplay_forceField.onSerialize()` | Hook: before a Lua reload; deactivates the field (returns nothing). *(internal)* *(hook)* | 78 |
| `gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: if active, every 0.05 s (dtSim) computes the planet from the bounding box of player 0's vehicle and sends it to the other vehicles. *(internal)* *(hook)* | 45 |
| `gameplay_forceField.onVehicleSwitched()` | Hook: player vehicle change; deactivates the field. *(internal)* *(hook)* | 70 |
| `gameplay_forceField.setForceMultiplier(factor)` | Sets the force multiplier: positive = repulsion, negative = attraction. Taken into account at the next update. | 91 |
| `gameplay_forceField.toggleActive()` | Toggles between active and inactive. | 36 |

### Parameter details

#### `gameplay_forceField.deactivate(silent)`

Deactivates the field: sends obj:setPlanets({}) to all vehicles and displays a "deactivated" message unless silent. No effect if inactive.

- `silent` (*boolean|nil*) : true to not display a message.

#### `gameplay_forceField.getForceMultiplier()`

Returns the current force multiplier.

- **returns**: number Multiplier.

#### `gameplay_forceField.isActive()`

Returns whether the force field is active.

- **returns**: boolean|nil true if active, false or nil otherwise.

#### `gameplay_forceField.onCareerActive(enabled)`

Hook: career activation; deactivates the field if enabled is true.

- `enabled` (*boolean*) : Career enabled.

#### `gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: if active, every 0.05 s (dtSim) computes the planet from the bounding box of player 0's vehicle and sends it to the other vehicles.

- `dtReal` (*number*) : Real time delta (unused).
- `dtSim` (*number*) : Simulated delta time, accumulated for the rate.
- `dtRaw` (*number*) : Raw time delta (unused).

#### `gameplay_forceField.setForceMultiplier(factor)`

Sets the force multiplier: positive = repulsion, negative = attraction. Taken into account at the next update.

- `factor` (*number*) : Multiplier (1 by default).

## Calls into the engine (C++)

- `be:` `getObject`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/forceField.lua`.*
