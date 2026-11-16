# `controller_hydraulics_hydraulicTrailerFeet`

*File: `lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua` · VM: Vehicle · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulics/hydraulicTrailerFeet` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for a trailer's hydraulic landing legs (type "auxiliary"). It stores the cylinder position when the trailer is attached and detached (by manual adjustment) and automatically brings the legs back to the right position on coupling or uncoupling, by writing the cylinder direction into electrics (the cylinder's directionElectricsName).

## Notes

- jbeam keys (default): powertrainHydroName (cylinder name, required: Lua error if not found), attachedDefaultPosition (0), detachedDefaultPosition (1), startValue (0, initial value of the direction command).
- Internal states: detached, attached, detachedMoveFeet, attachedMoveFeet. Manual movements (|input| > 0.05) store the current position for the current state.
- The onCouplerAttached/onCouplerDetached hooks only react if the other object (obj2id) is different from this vehicle.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulics_hydraulicTrailerFeet.getState()` | Returns the state (stored positions, manual input, coupling state). | 95 |
| `controller_hydraulics_hydraulicTrailerFeet.init(jbeamData)` | Finds the cylinder and initializes the positions and states. *(internal)* | 73 |
| `controller_hydraulics_hydraulicTrailerFeet.moveFeet(input)` | Manual command of the legs: -1 to 1 (the direction is written into electrics). Interrupts an ongoing automatic movement. | 27 |
| `controller_hydraulics_hydraulicTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook called by the engine when a coupler of the vehicle attaches; starts the movement toward the "attached" position if the other object is another vehicle. *(internal)* *(hook)* | 61 |
| `controller_hydraulics_hydraulicTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook called when a coupler detaches; starts the movement toward the "detached" position. *(internal)* *(hook)* | 67 |
| `controller_hydraulics_hydraulicTrailerFeet.setState(data)` | Restores the state returned by getState. | 103 |
| `controller_hydraulics_hydraulicTrailerFeet.updateGFX(dt)` | Writes the cylinder direction (manual or automatic toward the stored position). *(internal)* | 36 |

### Parameter details

#### `controller_hydraulics_hydraulicTrailerFeet.getState()`

Returns the state (stored positions, manual input, coupling state).

- **returns**: table State table (reused).

#### `controller_hydraulics_hydraulicTrailerFeet.init(jbeamData)`

Finds the cylinder and initializes the positions and states.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_hydraulicTrailerFeet.moveFeet(input)`

Manual command of the legs: -1 to 1 (the direction is written into electrics). Interrupts an ongoing automatic movement.

- `input` (*number*) : Direction input -1..1.

#### `controller_hydraulics_hydraulicTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook called by the engine when a coupler of the vehicle attaches; starts the movement toward the "attached" position if the other object is another vehicle.

- `nodeId` (*integer*) : This vehicle's node.
- `obj2id` (*integer*) : Partner vehicle id.
- `obj2nodeId` (*integer*) : Partner's node.

#### `controller_hydraulics_hydraulicTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook called when a coupler detaches; starts the movement toward the "detached" position.

- `nodeId` (*integer*) : This vehicle's node.
- `obj2id` (*integer*) : Partner vehicle id.
- `obj2nodeId` (*integer*) : Partner's node.
- `breakForce` (*number*) : Breaking force (unused).

#### `controller_hydraulics_hydraulicTrailerFeet.setState(data)`

Restores the state returned by getState.

- `data` (*table|nil*) : State table.

#### `controller_hydraulics_hydraulicTrailerFeet.updateGFX(dt)`

Writes the cylinder direction (manual or automatic toward the stored position).

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua`.*
