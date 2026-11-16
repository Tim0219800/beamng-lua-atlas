# `controller_lights_taxiLights`

*File: `lua/vehicle/controller/lights/taxiLights.lua` · VM: Vehicle · 85 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `lights/taxiLights` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for the taxi sign (type "auxiliary"). It stores a state among available, occupied, reserved, offDuty (default), driverDistress and exposes each state as an electrics value named "<controllerName>_<state>" equal to 1 for the active state and 0 for the others.

## Notes

- No jbeam key is read. The electrics names depend on the controller name (M.name).
- setTaxiState does not validate the state passed: an unknown value turns off all outputs.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_lights_taxiLights.getState()` | Returns the state for saving. | 57 |
| `controller_lights_taxiLights.getTaxiState()` | Returns the current state. | 35 |
| `controller_lights_taxiLights.init(jbeamData)` | Initializes the offDuty state and the electrics names. *(internal)* | 43 |
| `controller_lights_taxiLights.reset(jbeamData)` | Resets to the offDuty state. *(internal)* | 39 |
| `controller_lights_taxiLights.setState(data)` | Restores the state returned by getState (if valid). | 62 |
| `controller_lights_taxiLights.setTaxiState(state)` | Changes the sign's state. | 31 |
| `controller_lights_taxiLights.updateGFX(dt)` | Writes the 0/1 electrics values of each state. *(internal)* | 24 |

### Parameter details

#### `controller_lights_taxiLights.getState()`

Returns the state for saving.

- **returns**: table State table (reused).

#### `controller_lights_taxiLights.getTaxiState()`

Returns the current state.

- **returns**: string Sign state.

#### `controller_lights_taxiLights.init(jbeamData)`

Initializes the offDuty state and the electrics names.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_lights_taxiLights.reset(jbeamData)`

Resets to the offDuty state.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_lights_taxiLights.setState(data)`

Restores the state returned by getState (if valid).

- `data` (*table|nil*) : State table.

#### `controller_lights_taxiLights.setTaxiState(state)`

Changes the sign's state.

- `state` (*string*) : "available", "occupied", "reserved", "offDuty" or "driverDistress".

#### `controller_lights_taxiLights.updateGFX(dt)`

Writes the 0/1 electrics values of each state.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/lights/taxiLights.lua`.*
