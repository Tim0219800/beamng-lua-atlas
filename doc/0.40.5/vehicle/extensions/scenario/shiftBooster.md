# `scenario_shiftBooster`

*File: `lua/vehicle/extensions/scenario/shiftBooster.lua` · VM: Vehicle · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_shiftBooster`: `extensions.load (vehicle VM)("scenario_shiftBooster")`, then the global `scenario_shiftBooster`

Demo scenario extension: gives the vehicle a boost by applying a constant wind directed along its forward axis via obj:setWind. Can be triggered on each upshift (listenToShift) or manually (manualBoost). The boost lasts `boostTime` seconds, counted down in updateGFX.

## Example

```lua
scenario_shiftBooster.manualBoost(1.0, 500) -- boost 1 s, force 500
scenario_shiftBooster.listenToShift()  -- boost 0.4 s on each shiftUp
```

## Notes

- listenToShift replaces drivetrain.shiftUp; but drivetrain.lua (loaded as the global `drivetrain` by main.lua) contains no shiftUp function in 0.40.5. up_for_real is therefore nil and the replacement will crash on the first call: obsolete code (inconsistency spotted).
- The default force is 300 (obj:setWind wind unit, inferred from code); the direction vector is multiplied by the force.
- When boostTime drops below 0.01, updateGFX resets the wind to (0,0,0) every frame, which overwrites any other wind set by the vehicle.
- applyBoost prints on every call (noisy in the logs).

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_shiftBooster.listenToShift()` | Wraps drivetrain.shiftUp: after the actual gear change, sets boostTime to 0.4 s, shows a UI message "Boooooost!" (5 s) and applies a boost with the default force. | 27 |
| `scenario_shiftBooster.manualBoost(duration, strength)` | Starts a manual boost: sets boostTime to the given duration and applies the boost immediately. | 68 |
| `scenario_shiftBooster.onDebugDraw(focusPos)` | Debug draw hook: if a boost is active, draws a sphere of radius boostTime 2 m above the vehicle, with a varying color. *(internal)* *(hook)* | 58 |
| `scenario_shiftBooster.onVehicleScenarioData(data)` | Scenario configuration hook; empty body, no data is read. *(internal)* *(hook)* | 65 |
| `scenario_shiftBooster.updateGFX(dt)` | Called every graphics frame by the main loop (extensions.hook('updateGFX')). While boostTime > 0.01: decrements it by dt and reapplies the boost; otherwise resets the wind to zero. *(internal)* | 46 |

### Parameter details

#### `scenario_shiftBooster.manualBoost(duration, strength)`

Starts a manual boost: sets boostTime to the given duration and applies the boost immediately.

- `duration` (*number*) : Boost duration in seconds.
- `strength` (*number|nil*) : Intensity multiplied by the direction vector; 300 if nil.

#### `scenario_shiftBooster.onDebugDraw(focusPos)`

Debug draw hook: if a boost is active, draws a sphere of radius boostTime 2 m above the vehicle, with a varying color.

- `focusPos` (*vec3*) : Camera focus position (unused).

#### `scenario_shiftBooster.onVehicleScenarioData(data)`

Scenario configuration hook; empty body, no data is read.

- `data` (*table*) : Scenario data (ignored).

#### `scenario_shiftBooster.updateGFX(dt)`

Called every graphics frame by the main loop (extensions.hook('updateGFX')). While boostTime > 0.01: decrements it by dt and reapplies the boost; otherwise resets the wind to zero.

- `dt` (*number*) : Simulation time step in seconds.

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getPosition`, `setWind`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/scenario/shiftBooster.lua`.*
