# `input`

*File: `lua/vehicle/input.lua` · VM: Vehicle · 858 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `input`

Reception and filtering of the vehicle's driving inputs (steering, throttle, brake, parking brake, clutch, and any vehicle-specific input). Control actions (keyboard, gamepad, wheel, AI, scripts) call input.event(type, value, filter, …); the value is stored in input.state[type]. Every frame, input.updateGFX applies the chosen filter (keyboard/gamepad smoothing, wheel angle mapping, steering assists), clamps the value and writes it into input[type] (e.g. input.throttle) and into electrics.values[type .. '_input']. The vehicle modules (controller, hydros, wheels, powertrain) then read electrics.values.* or input.*.

## Example

```lua
-- drive the steering from an extension (like straightLine):
input.event('steering', -0.3, FILTER_DIRECT)   -- value -1..1, direct filter
input.event('throttle', 1, FILTER_PAD)
local gaz = input.throttle                       -- filtered value from the last frame
input.toggleEvent('parkingbrake')
```

## Notes

- Filter constants (common/inputFilters.lua): FILTER_KBD = 0 (keyboard, smoothing with dynamic rates), FILTER_PAD = 1 (gamepad, smoothing without autocenter), FILTER_DIRECT = 2 (value taken as is, for physical wheel/scripts), FILTER_KBD2 = 3 (keyboard, variant), FILTER_AI = "FILTER_AI" (AI).
- Default input types in input.state: steering (-1..1), throttle (0..1), brake (0..1), parkingbrake (0..1), clutch (0..1). Each input is a table {val, filter, smootherKBD, smootherPAD, minLimit, maxLimit} + angle, lockType, osClockHP, source after an event. A vehicle-specific input (other name) is accepted by event but with a default state (limits -1..1, smoothing 10/10) and a warning log; the vehicle creator should define input.state[name] = {minLimit, maxLimit, smootherKBD, smootherPAD, val=0, filter=0} in their init.
- The filtered values are published both as module fields (input.steering, input.throttle, input.brake, input.parkingbrake, input.clutch, input.<name>) and in electrics.values.<name>_input (steering_input, throttle_input…). electrics.values.steeringUnassisted contains the steering before assists. If osClockHP is provided, electrics.values.<name>_timestamp is also written.
- Steering wheel angle mapping (direct filter, or angle > 0 for steering which forces FILTER_DIRECT): lockType 0 = disabled, 1 = normal (value x angle/(2 x steeringWheelLock)), 2 = progressive (faster after mid-travel to guarantee the end stop), 3 = disabled while the wheel angle < vehicle angle. vehicleSteeringWheelLock comes from v.data.input.steeringWheelLock or from the steering_input hydro, default 450 (degrees).
- Steering assists (settings: steeringStabilization*, steeringUndersteerReduction*, steeringSlowdown*, steeringLimit*, steeringAutocenterEnabled): oversteer countersteer, understeer reduction according to grip, slowdown and limiting of steering at high speed. Each has a *Direct variant to also apply to the direct filter. Speeds are in m/s.
- setAllowedInputSource filters the sources: as long as an input has a list of allowed sources, only an event whose `source` is in it is taken into account. The default source of an event is "local". The values received are still stored in input.lastInputs[source][type].
- When the human player is driving (anyPlayerSeated and no AI), a change of steering filter triggers extensions.hook('onSteeringFilterChanged', filterName) on the GE side.
- The parking brake plays the sounds handbrakeEngaging/Disengaging/Disengaged (if a wheel has parkingTorque > 0) when the value changes.
- Inconsistencies spotted: M.keys is a compatibility leftover (access logged as obsolete only once); M.lowspeedCoef is always nil (only M.lowspeedCoefFFB is assigned, in initSecondStage, when a steering_input hydro defines lowspeedCoefFFB); reset calls `M:settingsChanged()` with a colon (M passed as an unused argument); updateUIAppDebugging uses undefined globals (smExtra2, dt) but is never called.

## Functions

| Function | Description | Line |
|---|---|---|
| `input.event(itype, ivalue, filter, angle, lockType, osClockHP, source)` | Records an input value for the next frame. Filtering and publication into electrics happen in updateGFX. Ignored (but stored in lastInputs) if sources are restricted for this type and `source` is not among them. | 717 |
| `input.init()` | First initialization stage (main.lua: initSystems): recreates input.state with the five default inputs and their smoothers. *(internal)* | 88 |
| `input.initSecondStage()` | Second stage (after sounds/electrics): determines the vehicle's wheel angle (steering_input hydro or v.data.input.steeringWheelLock), autocenter and lowspeedCoefFFB requested by the hydro, creates the parking brake sounds, identifies front/rear wheels for the assists, computes the keyboard smoothing rates, then calls reset(). *(internal)* | 144 |
| `input.kbdSteer(isRight, val, filter)` | Multi-key keyboard compatibility: stores the value of the left or right key and sends event('steering', right - left, filter). | 753 |
| `input.neutralizeControls()` | Resets all inputs to 0 (keyboard filter) except the parking brake, and resets the kbdSteer left/right keys. | 773 |
| `input.padAccelerateBrake(val, filter)` | Single-axis gamepad compatibility: val > 0 goes to throttle (brake at 0), val <= 0 goes to brake with -val (throttle at 0). | 763 |
| `input.reset()` | Resets the smoothers, lastInputs and the assists state, rereads the settings. Called by main.lua on vehicle reset and by initSecondStage. *(internal)* | 694 |
| `input.setAllowedInputSource(itype, source, enabled)` | Restricts or releases the accepted sources for an input type. source == nil removes the restriction; otherwise marks the source as allowed (enabled true) or denied (false). As soon as a table exists for a type, only sources set to true are accepted. | 834 |
| `input.settingsChanged()` | Rereads the settings (settings.getValue) of the steering assists: oversteer stabilization, understeer reduction, slowdown and limiting at high speed, autocenter at low speed. Called by reset() and by onSettingsChanged in main.lua. Swaps the start/end speeds if they are inverted. *(internal)* | 783 |
| `input.toggleEvent(itype)` | Toggles an input: sets val to 0 if it exceeds 0.5, otherwise to 1, with filter 0 (keyboard). Ignored if the type does not exist in state. Does not take allowed sources into account. | 738 |
| `input.updateGFX(dt)` | Called every graphics frame by main.lua, very early (after sensors and ai, before electrics). For each input: applies the filter (direct/pad/keyboard/AI), the angle mapping and the steering assists, clamps the value, plays the parking brake sounds and publishes the result in input[name] and electrics.values[name_input]. *(internal)* | 574 |

### Parameter details

#### `input.event(itype, ivalue, filter, angle, lockType, osClockHP, source)`

Records an input value for the next frame. Filtering and publication into electrics happen in updateGFX. Ignored (but stored in lastInputs) if sources are restricted for this type and `source` is not among them.

- `itype` (*string*) : Input type: "steering", "throttle", "brake", "parkingbrake", "clutch" or vehicle-specific input.
- `ivalue` (*number*) : Raw value (steering -1..1, others 0..1; clamped by minLimit/maxLimit after filtering).
- `filter` (*integer|string*) : FILTER_KBD (0), FILTER_PAD (1), FILTER_DIRECT (2), FILTER_KBD2 (3) or FILTER_AI.
- `angle` (*number|nil*) : Physical wheel angle in degrees for the mapping (steering only).
- `lockType` (*integer|nil*) : Angle lock type: 0 disabled, 1 normal, 2 faster if needed, 3 disabled if needed.
- `osClockHP` (*number|nil*) : High-precision timestamp of the event, published in electrics.values.<type>_timestamp.
- `source` (*string|nil*) : Origin of the event; "local" if nil.

#### `input.kbdSteer(isRight, val, filter)`

Multi-key keyboard compatibility: stores the value of the left or right key and sends event('steering', right - left, filter).

- `isRight` (*boolean*) : true for the right key, false for the left.
- `val` (*number*) : Key value (0..1).
- `filter` (*integer*) : Filter to use.

#### `input.padAccelerateBrake(val, filter)`

Single-axis gamepad compatibility: val > 0 goes to throttle (brake at 0), val <= 0 goes to brake with -val (throttle at 0).

- `val` (*number*) : Axis -1..1 (positive = acceleration).
- `filter` (*integer*) : Filter to use.

#### `input.setAllowedInputSource(itype, source, enabled)`

Restricts or releases the accepted sources for an input type. source == nil removes the restriction; otherwise marks the source as allowed (enabled true) or denied (false). As soon as a table exists for a type, only sources set to true are accepted.

- `itype` (*string*) : Input type.
- `source` (*string|nil*) : Source name; nil to remove any restriction on this type.
- `enabled` (*boolean|nil*) : true to allow the source, false to deny it.

#### `input.toggleEvent(itype)`

Toggles an input: sets val to 0 if it exceeds 0.5, otherwise to 1, with filter 0 (keyboard). Ignored if the type does not exist in state. Does not take allowed sources into account.

- `itype` (*string*) : Existing input type (e.g. "parkingbrake").

#### `input.updateGFX(dt)`

Called every graphics frame by main.lua, very early (after sensors and ai, before electrics). For each input: applies the filter (direct/pad/keyboard/AI), the angle mapping and the steering assists, clamps the value, plays the parking brake sounds and publishes the result in input[name] and electrics.values[name_input].

- `dt` (*number*) : Simulation time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `allowedInputSources` | table<string, table<string, boolean>> | Allowed sources by input type; absent = all. Managed by setAllowedInputSource. |
| `keys` | table | Legacy compatibility: any read of input.keys[x] is logged as obsolete (use vehicle-specific bindings instead). |
| `lastFilterType` | integer|string | Last steering filter seen by updateGFX (-1 at start). |
| `lastInputs` | table<string, table<string, number>> | Last raw value received by source then by input type (cleared on reset). |
| `lowspeedCoef` | nil | Always nil (declared but never assigned, see notes). |
| `state` | table<string, table> | One state per input type (steering, throttle, brake, parkingbrake, clutch, + vehicle inputs): raw val, filter, angle, lockType, osClockHP, source, minLimit/maxLimit, smoothers. Recreated by init(). |

## Class `MT`

Metatable set on input.keys, for compatibility only: its __index logs an error (only once) saying that access to input.keys is obsolete, then returns rawget(M.keys, key).

| Method | Description | Line |
|---|---|---|
| `MT.__index(tbl, key)` | Logs the obsolete use of input.keys[key] then returns the raw value. | 12 |

## Calls into the engine (C++)

- `obj:` `getDirectionVectorRightXYZ`, `getDirectionVectorXYZ`, `getGravity`, `getSmoothRefVelocityXYZ`, `getStaticFrictionCoef`, `queueGameEngineLua`, `wheelTurnRadius`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/input.lua`.*
