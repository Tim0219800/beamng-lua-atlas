# `controller_braking_postCrashBrake`

*File: `lua/vehicle/controller/braking/postCrashBrake.lua` · VM: Vehicle · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/postCrashBrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for automatic braking after a crash. A state machine (idle, braking, holding, disabled) detects a strong acceleration (accelerometers `sensors.gx2`, `gy2`, `gz2`): it switches to full braking, cuts the throttle, turns on the hazard lights, then applies the parking brake at standstill (or in reverse) and releases when the driver accelerates again or the vehicle is moving faster than 5 m/s. Call order: `defaultOrder = 700`.

## Notes

- Jbeam keys read by init: `brakeThreshold` (50 m/s²) and `crashCountThreshold` (3). Beyond `crashCountThreshold` triggers, the state becomes "disabled" and the system no longer triggers (until reset).
- Writes `electrics.values.postCrashBrakeTriggered` (1 during the action, nil otherwise), `electrics.values.brake` and `throttle`; sends `input.event("throttle"|"parkingbrake", ...)` and `electrics.set_warn_signal`.
- There is no `reset` function: controller.reset calls init again, which sets everything back to idle.
- State saved under `<name>_state` and `<name>_crashCounter`. setState on another state (for example coming from another multiplayer peer) calls a "remote" application of the state (lights, parking brake).
- This controller is relocated: the old name `postCrashBrake` is redirected to `braking/postCrashBrake`.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_postCrashBrake.getState()` | Returns the current state and the crash counter for state synchronization. | 103 |
| `controller_braking_postCrashBrake.init(jbeamData)` | Puts the state machine back to idle (turns off the hazard lights if they were commanded by this controller) and reads the jbeam thresholds. *(internal)* | 84 |
| `controller_braking_postCrashBrake.setState(data)` | Restores the crash counter and applies a valid state (idle, braking, holding, disabled) if it differs. | 109 |
| `controller_braking_postCrashBrake.updateGFX(dt)` | Every frame: detects the crash in idle, imposes braking in braking, holds the brake in holding and handles the exit. *(internal)* | 30 |

### Parameter details

#### `controller_braking_postCrashBrake.getState()`

Returns the current state and the crash counter for state synchronization.

- **returns**: table Keys `<name>_state` and `<name>_crashCounter`.

#### `controller_braking_postCrashBrake.init(jbeamData)`

Puts the state machine back to idle (turns off the hazard lights if they were commanded by this controller) and reads the jbeam thresholds.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_postCrashBrake.setState(data)`

Restores the crash counter and applies a valid state (idle, braking, holding, disabled) if it differs.

- `data` (*table|nil*) : State table.

#### `controller_braking_postCrashBrake.updateGFX(dt)`

Every frame: detects the crash in idle, imposes braking in braking, holds the brake in holding and handles the exit.

- `dt` (*number*) : Time step in seconds (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 700: default call rank. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/postCrashBrake.lua`.*
