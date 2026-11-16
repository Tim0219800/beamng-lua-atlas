# `controller_linearActuators_linearActuatorTrailerFeet`

*File: `lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua` · VM: Vehicle · 154 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `linearActuators/linearActuatorTrailerFeet` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for the landing legs of a trailer with an electric linear actuator (type "auxiliary"). Same logic as hydraulics/hydraulicTrailerFeet: it stores the cylinder positions in the attached and detached states and automatically brings the legs back on coupling or uncoupling, by writing the motor command into electrics. The difference: the actuator is a powertrain device and one can filter on a specific coupler node.

## Notes

- jbeam keys (default): linearActuatorName (device name, required), motorThrottleElectricsName (name of the command electrics value; otherwise inferred from motorName or from the actuator's propulsion device via motor.electricsThrottleName), motorName, attachedDefaultPosition (0), detachedDefaultPosition (1), couplerNodeName (name of the coupler node to listen to; without it, no coupler hook triggers because nodeId == nil fails), startValue (0).
- Positions as an extension ratio 0..1 (actuator.currentExtendPercent). The command is -1/0/1.
- The onCouplerAttached/onCouplerDetached hooks only react if the other object is another vehicle AND if nodeId matches couplerNodeName.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_linearActuators_linearActuatorTrailerFeet.getState()` | Returns the state (positions, manual input, coupling state). | 110 |
| `controller_linearActuators_linearActuatorTrailerFeet.init(jbeamData)` | Finds the actuator and the command electrics name, initializes positions and states. *(internal)* | 74 |
| `controller_linearActuators_linearActuatorTrailerFeet.moveFeet(input)` | Manual command of the legs, -1 to 1; interrupts an automatic movement. | 28 |
| `controller_linearActuators_linearActuatorTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook called by the engine on coupling; starts the movement toward the "attached" position. *(internal)* *(hook)* | 62 |
| `controller_linearActuators_linearActuatorTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook called on uncoupling; starts the movement toward the "detached" position. *(internal)* *(hook)* | 68 |
| `controller_linearActuators_linearActuatorTrailerFeet.setState(data)` | Restores the state returned by getState. | 118 |
| `controller_linearActuators_linearActuatorTrailerFeet.updateGFX(dt)` | Writes the motor command (manual or automatic toward the stored position). *(internal)* | 37 |

### Parameter details

#### `controller_linearActuators_linearActuatorTrailerFeet.getState()`

Returns the state (positions, manual input, coupling state).

- **returns**: table State table (reused).

#### `controller_linearActuators_linearActuatorTrailerFeet.init(jbeamData)`

Finds the actuator and the command electrics name, initializes positions and states.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_linearActuators_linearActuatorTrailerFeet.moveFeet(input)`

Manual command of the legs, -1 to 1; interrupts an automatic movement.

- `input` (*number*) : Direction input -1..1.

#### `controller_linearActuators_linearActuatorTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook called by the engine on coupling; starts the movement toward the "attached" position.

- `nodeId` (*integer*) : This vehicle's node.
- `obj2id` (*integer*) : Partner vehicle id.
- `obj2nodeId` (*integer*) : Partner's node.

#### `controller_linearActuators_linearActuatorTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook called on uncoupling; starts the movement toward the "detached" position.

- `nodeId` (*integer*) : This vehicle's node.
- `obj2id` (*integer*) : Partner vehicle id.
- `obj2nodeId` (*integer*) : Partner's node.
- `breakForce` (*number*) : Breaking force (unused).

#### `controller_linearActuators_linearActuatorTrailerFeet.setState(data)`

Restores the state returned by getState.

- `data` (*table|nil*) : State table.

#### `controller_linearActuators_linearActuatorTrailerFeet.updateGFX(dt)`

Writes the motor command (manual or automatic toward the stored position).

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua`.*
