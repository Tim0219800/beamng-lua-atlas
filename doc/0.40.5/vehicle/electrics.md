# `electrics`

*File: `lua/vehicle/electrics.lua` · VM: Vehicle · 1114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `electrics`

Table of vehicle electrical values (`electrics.values`) shared by all controllers, the UI and extensions, plus the logic of lights, turn signals, warning, light bar, horn and ignition level. A modder reads `electrics.values.xxx` to know the vehicle state (RPM, speed, lights...) and calls the `toggle_*`/`set_*` functions to act on the lights or the ignition key. Controllers and the jbeam (`electrics`/`components.electrics` sections) write their own keys in this table.

## Example

```lua
-- In a controller or a vehicle extension
local rpm = electrics.values.rpm
electrics.setIgnitionLevel(2)      -- ignition on, starter not engaged
electrics.set_warn_signal(true)     -- hazard lights
electrics.values.myCustomValue = 1 -- value then read by the UI / streams
```

## Notes

- Update loop: electrics.updateGFX(dt) (1st step) -> controllers write their values -> electrics.updateGFXSecondStep(dt) (2nd step: brakelights, values imported from the network, override by ignition level, jbeam custom values, smoothers).
- At the end of updateGFX, all booleans in electrics.values are converted to 0/1 (the keys listed in M.disabledState are set to nil). Values written afterwards (second step, controllers) may remain booleans: testing with `== 1` or `> 0` does not work for true.
- Keys initialized in the file: throttle, brake, steering, clutch, wheelspeed, odometer, avgWheelAV, airspeed, horn, rpmspin, rpm, boost, boostMax. init/reset also add airflowspeed and electricalLoadCoef (=1) and ignitionLevel.
- Keys written by updateGFX: accXSmooth/accYSmooth/accZSmooth (sensors.gx2/gy2/gz2), odometer and trip (partCondition, see that module for the unit), nop (=0), parkingbrake (copy of parkingbrake_input), parkingbrakelight, lights and lights_state (0 off, 1 low beam, 2 high beam), turnsignal (-1 left, 0, 1 right), airspeed (obj:getGroundSpeed(), misleading name: ground speed), airflowspeed (obj:getAirflowSpeed()), altitude (obj:getAltitude()), parking (always 0, TODO in the code), reverse (gearIndex < 0), signal_L/signal_R (turn signal on during the pulse), hazard, hazard_enabled, lightbar (0 off, 1 lights, 2 lights+siren), lowpressure (beamstate.lowpressure), oil (oiltemp >= 130), lowhighbeam, lowbeam, highbeam, fog, horn, lowhighbeam_signal_R/L (US style), highbeam_wigwag_R/L, reverse_wigwag_R/L, rpmTacho (rpm smoothed by a temporal sigmoid), rpmspin (angle in degrees of the RPM 'wheel', modulo 360), signal_right_input/signal_left_input (turn signal command state), boost (turboBoost + superchargerBoost), boostMax (max of turboBoostMax and superchargerBoostMax).
- Keys written by updateGFXSecondStep: brakelights (ceil(brake) if not provided by a controller), brakelight_signal_R/L.
- Keys READ but written elsewhere: ignitionLevel (also written here), gearIndex, oiltemp, watertemp, fuel, wigwag_R, wigwag_L, parkingbrake_input, turboBoost, turboBoostMax, superchargerBoost, superchargerBoostMax, steering (raw steering wheel degrees: thresholds 60 and 10 for the turn signal auto-cancel), rpm. Keys reset to 0 by the 'european' override when ignitionLevel == 0: brakelights, parkingbrakelight, brakelight_signal_R/L, parking, reverse, lights, lights_state, turnsignal, signal_L/R, hazard, hazard_enabled, lowpressure, oil, lowhighbeam, lowbeam, highbeam, fog, horn, lowhighbeam_signal_R/L, highbeam_wigwag_R/L, reverse_wigwag_R/L, signal_right_input, signal_left_input, fuel, lowfuel, abs, esc, tcs, oiltemp, watertemp, checkengine, ignition, running, engineRunning.
- Default smoothers (exponential): wheelspeed, gear_A, rpm, lights, turnsignal, airspeed, airflowspeed, altitude (parameter 10); fuel, oiltemp, watertemp (parameter 100). The jbeam can replace them via electrics.smoothers (types exponential, temporal, temporalNonLinear). The smoothers are applied last, after the custom values.
- Ignition levels: 0 off, 1 accessories, 2 run (engine allowed to run), 3 starter. Levels forbidden by jbeam (allowedIgnitionLevels, default {0,1,2,3}) are replaced by the nearest allowed higher level, otherwise lower. The initial level comes from the spawnVehicleIgnitionLevel setting (default 3) or from config.additionalVehicleData.spawnWithEngineRunning (true => 3, false => 0).
- Jbeam: electrics.indicatorCycleTime (default 0.8 s, a half-cycle = duration of an on/off state), electrics.ignitionLevelOverrideType (only 'european' exists), electrics.allowedIgnitionLevels, electrics.smoothers, electrics.customValues (see electricsCustomValueParser).
- The turn signal stops by itself (autoCancel) when the steering wheel has gone beyond 60 in the direction of the turn then returned toward neutral (threshold 10), for toggle_left/right_signal and for set_*_signal(state, true).
- Inconsistency: M.resetLastStage points to the same function as M.initLastStage (which forces level 3 to 2).
- Error risk: updateGFX evaluates `vals.parkingbrake > 0`; if parkingbrake_input was never written by a controller/input, the comparison is made on nil (Lua error).
- toggle_lights cycles lightsState 0 -> 1 -> 2 -> 0; setLightsState has no validation.

## Functions

| Function | Description | Line |
|---|---|---|
| `electrics.horn(state)` | Enables or cuts the horn (electrics.values.horn) and plays/stops the 'horn' sound (two alternating slots to avoid an abrupt cut). | 1034 |
| `electrics.init()` | Called at vehicle creation: reads the jbeam config (smoothers, custom values, ignition levels, turn signal cycle), compiles the custom values, sets the starting ignition level and registers the radial menu entries (core_quickAccess). *(internal)* | 824 |
| `electrics.initLastStage()` | Called at the end of initialization: if the ignition level is 3, brings it back to 2 (storing 3 as the previous level) so as not to stay in starter. *(internal)* | 948 |
| `electrics.light_flash_highbeams(enabled)` | Headlight flash: at true, stores the current state and switches to high beam; at false, restores the stored state. | 996 |
| `electrics.reset()` | Called at vehicle reset: clears disabledState, resets the smoothers and base values to 0, restores the default custom values, the turn signal pulse and the spawn ignition level. *(internal)* | 774 |
| `electrics.resetLastStage()` | Same function as initLastStage (see notes). *(internal)* | 948 |
| `electrics.setAllowedIgnitionLevels(newAllowedIgnitionLevels)` | Defines the list of allowed ignition levels and rebuilds the substitution table (forbidden level -> nearest allowed higher level, otherwise lower). An empty list becomes {0}. | 740 |
| `electrics.setIgnitionLevel(ignitionLevel)` | Sets the ignition level after filtering by the allowed levels, displays a UI message (levels 0 to 2) and commands the main controller: levels 0/1 cut ignition and starter, 2 turns ignition on without starter, 3 turns ignition on and engages the starter. Updates the values override. | 348 |
| `electrics.setLightsState(newval)` | Directly sets the headlight state without validation (used by the radial menu). | 1022 |
| `electrics.set_fog_lights(state)` | Sets the fog light state (value stored as is then read in electrics.values.fog). | 1030 |
| `electrics.set_left_signal(state, autoCancel)` | Explicitly turns the left turn signal on or off (cuts right and warning on activation). | 187 |
| `electrics.set_lightbar_signal(state)` | Sets the light bar state. The value is taken modulo 3 (modulo 2 if the vehicle has no 'siren' sound). State 2 plays the siren. | 1005 |
| `electrics.set_right_signal(state, autoCancel)` | Explicitly turns the right turn signal on or off. | 242 |
| `electrics.set_warn_signal(value)` | Enables or cuts the hazard lights; also sets the left and right states to the same value and disables auto-cancel. | 955 |
| `electrics.stop_turn_signal()` | Turns off both turn signals (unless the warning is active, in which case does nothing) and plays the off sound. | 143 |
| `electrics.toggleIgnitionLevelOnDown()` | Start of the ignition key press: arms the counter; beyond 0.5 s held, goes to level 3 (starter). | 1054 |
| `electrics.toggleIgnitionLevelOnUp()` | Ignition key release: advances the level 0 -> 1 -> 2, then 2 -> 1, 1 -> 0 (depending on the previous direction); level 3 falls back to 2. | 1058 |
| `electrics.toggle_fog_lights()` | Toggles the fog lights. | 1026 |
| `electrics.toggle_highbeams()` | Toggles between low beam (1) and high beam (2). No effect if the headlights are off. | 983 |
| `electrics.toggle_left_signal()` | Toggles the left turn signal (user input). Cuts the right one and the warning when it activates; if the warning is active, forces the left to true. Plays the sounds if ignitionLevel > 0 and enables auto-cancel. | 159 |
| `electrics.toggle_lightbar_signal()` | Moves to the next light bar state (0 off, 1 lights, 2 lights + siren if the 'siren' sound exists; otherwise 0/1). | 1018 |
| `electrics.toggle_lights()` | Cycles the headlight state: 0 off -> 1 low beam -> 2 high beam -> 0, with on/off sound. | 968 |
| `electrics.toggle_right_signal()` | Toggles the right turn signal (same logic as toggle_left_signal). | 214 |
| `electrics.toggle_warn_signal()` | Toggles the hazard lights (warning). | 964 |
| `electrics.updateGFX(dt)` | 1st update step per frame: handles the held starter, the turn signal pulse, computes derived values (lights, ground speed, altitude, smoothed RPM...), injects remote electrics (beamstate.updateRemoteElectrics(true)), then converts booleans to 0/1 and clears the disabledState keys. *(internal)* | 384 |
| `electrics.updateGFXSecondStep(dt)` | 2nd step, called after the controllers: computes brakelights, brakelight_signal_R/L, reinjects remote electrics, applies the override according to the ignition level (values set to 0 if ignitionLevel == 0), runs the jbeam custom values then the smoothers. *(internal)* | 476 |

### Parameter details

#### `electrics.horn(state)`

Enables or cuts the horn (electrics.values.horn) and plays/stops the 'horn' sound (two alternating slots to avoid an abrupt cut).

- `state` (*boolean*) : true sounds the horn.

#### `electrics.light_flash_highbeams(enabled)`

Headlight flash: at true, stores the current state and switches to high beam; at false, restores the stored state.

- `enabled` (*boolean*) : true starts the headlight flash, false ends it.

#### `electrics.setAllowedIgnitionLevels(newAllowedIgnitionLevels)`

Defines the list of allowed ignition levels and rebuilds the substitution table (forbidden level -> nearest allowed higher level, otherwise lower). An empty list becomes {0}.

- `newAllowedIgnitionLevels` (*table<integer, integer>*) : List of levels among 0 to 3.

#### `electrics.setIgnitionLevel(ignitionLevel)`

Sets the ignition level after filtering by the allowed levels, displays a UI message (levels 0 to 2) and commands the main controller: levels 0/1 cut ignition and starter, 2 turns ignition on without starter, 3 turns ignition on and engages the starter. Updates the values override.

- `ignitionLevel` (*integer*) : 0 off, 1 accessories, 2 run, 3 starter.

#### `electrics.setLightsState(newval)`

Directly sets the headlight state without validation (used by the radial menu).

- `newval` (*integer*) : 0 off, 1 low beam, 2 high beam.

#### `electrics.set_fog_lights(state)`

Sets the fog light state (value stored as is then read in electrics.values.fog).

- `state` (*boolean*) : true turns on.

#### `electrics.set_left_signal(state, autoCancel)`

Explicitly turns the left turn signal on or off (cuts right and warning on activation).

- `state` (*boolean*) : true turns on, false turns off.
- `autoCancel` (*boolean|nil*) : If true (on activation), the turn signal stops when the steering wheel has returned to neutral after turning.

#### `electrics.set_lightbar_signal(state)`

Sets the light bar state. The value is taken modulo 3 (modulo 2 if the vehicle has no 'siren' sound). State 2 plays the siren.

- `state` (*integer*) : 0 off, 1 lights, 2 lights + siren.

#### `electrics.set_right_signal(state, autoCancel)`

Explicitly turns the right turn signal on or off.

- `state` (*boolean*) : true turns on, false turns off.
- `autoCancel` (*boolean|nil*) : Auto-cancel after a turn, like set_left_signal.

#### `electrics.set_warn_signal(value)`

Enables or cuts the hazard lights; also sets the left and right states to the same value and disables auto-cancel.

- `value` (*boolean*) : true enables the warning.

#### `electrics.updateGFX(dt)`

1st update step per frame: handles the held starter, the turn signal pulse, computes derived values (lights, ground speed, altitude, smoothed RPM...), injects remote electrics (beamstate.updateRemoteElectrics(true)), then converts booleans to 0/1 and clears the disabledState keys.

- `dt` (*number*) : Time step in seconds.

#### `electrics.updateGFXSecondStep(dt)`

2nd step, called after the controllers: computes brakelights, brakelight_signal_R/L, reinjects remote electrics, applies the override according to the ignition level (values set to 0 if ignitionLevel == 0), runs the jbeam custom values then the smoothers.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `disabledState` | table<string, any> | Set of electrics.values keys to force to nil at each updateGFX (presence of the key is enough). Reset to {} by init and reset. |
| `values` | table<string, number|boolean|nil> | Table of current electrical values (see notes for the usual keys). Read by the UI, streams, sensors. Booleans are converted to 0/1 at the end of the 1st step. |

## Calls into the engine (C++)

- `obj:` `getAirflowSpeed`, `getAltitude`, `getGroundSpeed`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/electrics.lua`.*
