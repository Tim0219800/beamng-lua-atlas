# `controller_hydraulics_hydraulicsCombustionEngineControl`

*File: `lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua` · VM: Vehicle · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulics/hydraulicsCombustionEngineControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that raises the idle of a combustion engine and connects the hydraulic pump when a hydraulic function is commanded ("electricsRaiseAndConnect" mode). It watches electrics values, imposes idleAVOverwrite/maxIdleThrottleOverwrite on the engine, connects the pump (setConnected) once the RPM is high enough and writes a state electrics value. A manual idle raise is also possible.

## Notes

- jbeam keys (default): mode (only handled value: "electricsRaiseAndConnect"; otherwise the controller does nothing), controlledEngine ("mainEngine"), relevantPump ("pump1"), relevantElectrics (list of names), actOnPositiveElectric (true), actOnNegativeElectric (true), raisedIdleRPM (1800 RPM, converted to rad/s), raisedIdleElectricsName ("raisedIdle").
- The automatic raise is canceled if electrics.values.wheelspeed > 2 m/s. The pump is only connected if an electrics value is active and the engine RPM exceeds 70% of the raised idle.
- M.updateGFX = nop at export; it is replaced by the active version at init if the mode is valid.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulics_hydraulicsCombustionEngineControl.getState()` | Returns the state (manual raise). | 113 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.init(jbeamData)` | Reads the configuration, finds the engine and the pump and enables the control loop. *(internal)* | 72 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.reset(jbeamData)` | Disables the manual raise. *(internal)* | 68 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.setIdleRaise(enabled)` | Enables/disables the manual idle raise. | 60 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.setState(data)` | Restores the state returned by getState. | 118 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.toggleIdleRaise()` | Toggles the manual idle raise. | 64 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.updateGFX(dt)` | Applies the idle raise and the pump connection (dynamically defined at init). (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_hydraulics_hydraulicsCombustionEngineControl.getState()`

Returns the state (manual raise).

- **returns**: table State table.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.init(jbeamData)`

Reads the configuration, finds the engine and the pump and enables the control loop.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.reset(jbeamData)`

Disables the manual raise.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.setIdleRaise(enabled)`

Enables/disables the manual idle raise.

- `enabled` (*boolean*) : True to raise.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.setState(data)`

Restores the state returned by getState.

- `data` (*table|nil*) : State table.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.updateGFX(dt)`

Applies the idle raise and the pump connection (dynamically defined at init). (dynamically assigned)

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua`.*
