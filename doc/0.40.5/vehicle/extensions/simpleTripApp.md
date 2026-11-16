# `simpleTripApp`

*File: `lua/vehicle/extensions/simpleTripApp.lua` · VM: Vehicle · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `simpleTripApp`: `extensions.load (vehicle VM)("simpleTripApp")`, then the global `simpleTripApp`

Feeds the "trip" UI app: accumulates distance and simulation time, estimates fuel consumption and range, and sends the result to the UI about every real second via guihooks.trigger('tripData', data). Reads electrics.values.fuelVolume, wheelspeed and airspeed.

## Notes

- The tripData event contains: totalDistance (m), avgSpeed (m/s), avgFuelConsumptionRate (fuel volume per meter, over the whole trip), fuelConsumptionRate (volume per meter over the last second), range (remaining distance, math.huge if no consumption and speed > 0.1, 0 at standstill).
- The speed used is electrics.values.wheelspeed if the vehicle has wheels (wheels.wheels not empty), otherwise airspeed.
- The send timer is counted down in real time (obj:getRealdt), the accumulations in simulation time (dtSim).
- onExtensionLoaded returns false (which unloads the extension) if the vehicle has neither wheels nor a powertrain device; onPlayersChanged unloads it if no player is seated anymore or if the vehicle is unsuitable.
- Possible division by zero in fuelConsumptionRate/avgFuelConsumptionRate when speed or totalDistance is 0 (inf/nan result sent to the UI).

## Functions

| Function | Description | Line |
|---|---|---|
| `simpleTripApp.onExtensionLoaded()` | Load hook: returns false (unload) if the vehicle has neither wheels nor a powertrain device, otherwise calls reset(). *(internal)* *(hook)* | 66 |
| `simpleTripApp.onPlayersChanged(anyPlayerSeated)` | Hook called by main.lua when the seated players change; unloads the extension (extensions.unload) if there is no player left or if the vehicle is unsuitable. *(internal)* *(hook)* | 73 |
| `simpleTripApp.reset()` | Resets distance, time, send timer (1 s), previous fuel and starting fuel. Called on load; can be used to restart a trip. | 14 |
| `simpleTripApp.updateGFX(dtSim)` | Called every graphics frame via extensions.hook('updateGFX'). Integrates distance and time, then about every real second computes the statistics and calls guihooks.trigger('tripData', data). *(internal)* | 22 |

### Parameter details

#### `simpleTripApp.onExtensionLoaded()`

Load hook: returns false (unload) if the vehicle has neither wheels nor a powertrain device, otherwise calls reset().

- **returns**: boolean|nil false to request unloading, nil otherwise.

#### `simpleTripApp.onPlayersChanged(anyPlayerSeated)`

Hook called by main.lua when the seated players change; unloads the extension (extensions.unload) if there is no player left or if the vehicle is unsuitable.

- `anyPlayerSeated` (*boolean*) : true if at least one player is seated in this vehicle.

#### `simpleTripApp.updateGFX(dtSim)`

Called every graphics frame via extensions.hook('updateGFX'). Integrates distance and time, then about every real second computes the statistics and calls guihooks.trigger('tripData', data).

- `dtSim` (*number*) : Simulation time step in seconds.

**UI events (guihooks.trigger):** `tripData`

## Calls into the engine (C++)

- `obj:` `getRealdt`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/simpleTripApp.lua`.*
