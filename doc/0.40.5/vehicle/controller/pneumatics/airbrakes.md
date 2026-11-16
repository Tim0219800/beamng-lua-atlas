# `controller_pneumatics_airbrakes`

*File: `lua/vehicle/controller/pneumatics/airbrakes.lua` · VM: Vehicle · 439 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics/airbrakes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for pneumatic brakes (heavy trucks). Simulates the pressure of the service brake cylinders and spring (parking) brakes fed by an air tank (energyStorage), converts the pressure into brake torque via jbeam curves and replaces the brake update of the wheels listed in brakedWheels (with or without ABS). Automatically applies the parking brake if the supply pressure drops below a threshold. Plays a purge sound on release. Publishes the cylinder pressure in electrics.values.<name>_pressure_service and <name>_pressure_parking.

## Notes

- jbeam keys read in init: airTankName ("mainAirTank"), brakeTorque (header table {pressure, torqueCoef}, required), springBrakeTorque (same, required), springBrakeAutoApplyThresholdPressure (275790 Pa = 40 psi), springBrakeAutoReleaseThresholdPressure (413685 Pa = 60 psi), brakePipeRadius (0.0075 m), brakeValveRadius (0.2 x brakePipeRadius), brakeActuatorDiameter (0.16 m), brakeActuatorStroke (0.0635 m), numBrakeActuators (4), quickReleaseFlowRate (0.01 m3/s), brakedWheels (list of wheel names), serviceBrakeElectricsName ("brake"), parkingBrakeElectricsName ("parkingbrake"), soundNode_nodes (first element = sound node), soundEvent ("event:>Vehicle>Pneumatics>Air_Brakes"), soundCoolDown (0.75 s).
- Pressures in pascals. The curves are indexed by integer pressure in kPa (floor(p/1000)).
- If the tank does not exist, a dummy tank (isDummy) is used: the parking brake is then applied permanently and no sound is played.
- The automatic application of the parking brake goes through controller.mainController.smartParkingBrake(1, FILTER_DIRECT, true) or, failing that, input.event("parkingbrake", 1, FILTER_KBD).
- M.name is used to build the electrics names; it is provided by the controller loader (not defined in this file).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics_airbrakes.init(jbeamData)` | Reads the jbeam keys, builds the pressure -> torque coefficient curves, computes the circuit volumes/cross-sections, installs the brake functions on the listed wheels and initializes the sound. *(internal)* | 328 |
| `controller_pneumatics_airbrakes.reset()` | Brings the pressures back to ambient pressure, reinstalls the wheels' brake functions and resets the sound states to zero. *(internal)* | 303 |
| `controller_pneumatics_airbrakes.updateFixedStep(dt)` | Physics step: updates the pressure of the service cylinders (according to electrics brake and the regulator) and of the spring brakes (according to parkingbrake and the supply pressure), draws energy from the tank. *(internal)* | 286 |
| `controller_pneumatics_airbrakes.updateGFX(dt)` | Every frame: detects a rapid release of the service or parking brake and plays the purge sound. *(internal)* | 291 |

### Parameter details

#### `controller_pneumatics_airbrakes.init(jbeamData)`

Reads the jbeam keys, builds the pressure -> torque coefficient curves, computes the circuit volumes/cross-sections, installs the brake functions on the listed wheels and initializes the sound.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_airbrakes.updateFixedStep(dt)`

Physics step: updates the pressure of the service cylinders (according to electrics brake and the regulator) and of the spring brakes (according to parkingbrake and the supply pressure), draws energy from the tank.

- `dt` (*number*) : Physics step in seconds.

#### `controller_pneumatics_airbrakes.updateGFX(dt)`

Every frame: detects a rapid release of the service or parking brake and plays the purge sound.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `playSFXOnce`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics/airbrakes.lua`.*
