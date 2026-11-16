# `controller_dragTimer`

*File: `lua/vehicle/controller/dragTimer.lua` · VM: Vehicle · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `dragTimer` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary drag (acceleration) timing controller. State machine ready, countdown, measuring, done: when the transbrake is active and the throttle pressed, a 3 s countdown starts; at the end, it releases the transbrake (controller named "transbrake") and measures the times at 60 feet (18.288 m), 1/8 mile (201.168 m) and 1/4 mile (402.336 m) as well as the speeds at these last two marks, then displays the results in the console (in mph). Order tied to the `gearbox` device.

## Notes

- `M.relevantDevice = "gearbox"`. No jbeam key is read.
- Uses `electrics.values.transbrake` and `electrics.values.throttle`. Releasing during the countdown (throttle released or transbrake cut) goes back to `ready`.
- Depends on the existence of a controller named exactly "transbrake": `controller.getController("transbrake").setTransbrake(false)` is called without a test (error if it does not exist).
- Measurement stops after 25 s even without having reached the quarter mile. The results are only printed (print) and a UI message "Results are in!" is displayed; they are not stored in electrics.
- No `reset` function: controller.reset calls init again (ready state).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_dragTimer.init(jbeamData)` | Puts the state machine back to ready and all times to 0. *(internal)* | 93 |
| `controller_dragTimer.update(dt)` | Physics step: advances the state machine (arming, countdown, measurement, results display). *(internal)* | 28 |
| `controller_dragTimer.updateGFX(dt)` | Empty (the work is done in update). *(internal)* | 25 |

### Parameter details

#### `controller_dragTimer.init(jbeamData)`

Puts the state machine back to ready and all times to 0.

- `jbeamData` (*table*) : Jbeam data (unused).

#### `controller_dragTimer.update(dt)`

Physics step: advances the state machine (arming, countdown, measurement, results display).

- `dt` (*number*) : Physics step in seconds.

#### `controller_dragTimer.updateGFX(dt)`

Empty (the work is done in update).

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `relevantDevice` | string | "gearbox": powertrain device used for the call order. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getPosition`, `getVelocity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/dragTimer.lua`.*
