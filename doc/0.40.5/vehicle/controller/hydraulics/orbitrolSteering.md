# `controller_hydraulics_orbitrolSteering`

*File: `lua/vehicle/controller/hydraulics/orbitrolSteering.lua` · VM: Vehicle · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulics/orbitrolSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Orbitrol-type hydraulic steering regulator (type "auxiliary"). A PID compares the average position of the steering cylinders (normalized -1..1) to the steering input (electrics.values.steering_input by default) and writes the valve command into electrics.values.

## Notes

- jbeam keys (default): steeringPositionCylinders (list of cylinder names), inputElectricsName ("steering_input"), steeringValveElectricsName ("steerCylinder"), steeringPositionMin (0), steeringPositionMax (1), steeringPIDKp (0.5), steeringPIDKi (0.3), steeringPIDKd (0.01).
- Each cylinder's position is multiplied by cylinder.direction before averaging.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulics_orbitrolSteering.init(jbeamData)` | Creates the PID and finds the cylinders. *(internal)* | 40 |
| `controller_hydraulics_orbitrolSteering.reset(jbeamData)` | Resets the valve and the PID to zero. *(internal)* | 35 |
| `controller_hydraulics_orbitrolSteering.updateFixedStep(dt)` | Computes and writes the steering valve command. *(internal)* | 19 |

### Parameter details

#### `controller_hydraulics_orbitrolSteering.init(jbeamData)`

Creates the PID and finds the cylinders.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_orbitrolSteering.reset(jbeamData)`

Resets the valve and the PID to zero.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_hydraulics_orbitrolSteering.updateFixedStep(dt)`

Computes and writes the steering valve command.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulics/orbitrolSteering.lua`.*
