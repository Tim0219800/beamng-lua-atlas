# `controller_braking_brakedDifferentialSteering`

*File: `lua/vehicle/controller/braking/brakedDifferentialSteering.lua` · VM: Vehicle · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/brakedDifferentialSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary differential-braking steering controller (tracked machines or skid-steer): depending on the steering wheel input `steering_input`, it brakes the left wheel (wheel turned left) or the right wheel (wheel turned right) by adding braking torque to the wheel rotators' `desiredBrakingTorque`, without exceeding their `brakeTorque`.

## Notes

- Jbeam keys read by init: `steeringPlay` (steering wheel dead zone, 0..1, default 0), `leftBrakeName` ("brake_L"), `rightBrakeName` ("brake_R"): names of rotators in `wheels.wheelRotators`, `maxSteeringBrakeTorque` (optional limit, capped by the wheel's brakeTorque).
- The effect is attenuated at very low speed: linear coefficient from 0 to 1 for `wheelspeed` from 0 to 0.2 m/s.
- If one of the two wheels cannot be found, init logs an error and replaces updateGFX and updateWheelsIntermediate with `nop` (the controller is inert).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_brakedDifferentialSteering.init(jbeamData)` | Finds the left/right wheels, computes the maximum steering braking torques. *(internal)* | 40 |
| `controller_braking_brakedDifferentialSteering.reset(jbeamData)` | Resets the braking levels to 0. *(internal)* | 35 |
| `controller_braking_brakedDifferentialSteering.updateGFX(dt)` | Every frame: computes the left/right braking level from `steering_input` and speed. *(internal)* | 26 |
| `controller_braking_brakedDifferentialSteering.updateWheelsIntermediate(dt)` | Intermediate physics step: adds the steering braking torque (brake × max torque) to each wheel's requested torque, capped at its brakeTorque. *(internal)* | 21 |

### Parameter details

#### `controller_braking_brakedDifferentialSteering.init(jbeamData)`

Finds the left/right wheels, computes the maximum steering braking torques.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_brakedDifferentialSteering.reset(jbeamData)`

Resets the braking levels to 0.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_braking_brakedDifferentialSteering.updateGFX(dt)`

Every frame: computes the left/right braking level from `steering_input` and speed.

- `dt` (*number*) : Time step in seconds.

#### `controller_braking_brakedDifferentialSteering.updateWheelsIntermediate(dt)`

Intermediate physics step: adds the steering braking torque (brake × max torque) to each wheel's requested torque, capped at its brakeTorque.

- `dt` (*number*) : Time step in seconds (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/brakedDifferentialSteering.lua`.*
