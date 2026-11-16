# `controller_hydraulics_electricHydraulics`

*File: `lua/vehicle/controller/hydraulics/electricHydraulics.lua` · VM: Vehicle · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulics/electricHydraulics` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Small auxiliary controller for an electric hydraulic unit: sets the electrics value motorThrottleElectricsName to 1 as soon as one of the listed command values is non-zero, otherwise to 0 (to power the pump motor only when a hydraulic function is requested).

## Notes

- jbeam keys: controlElectricsName (name or list of names of electrics values to watch), motorThrottleElectricsName (name of the output electrics value; no default value: nil would cause an error).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulics_electricHydraulics.init(jbeamData)` | Reads the electrics names. *(internal)* | 26 |
| `controller_hydraulics_electricHydraulics.reset(jbeamData)` | Does nothing. *(internal)* | 23 |
| `controller_hydraulics_electricHydraulics.updateGFX(dt)` | Updates the 0/1 output value. *(internal)* | 13 |

### Parameter details

#### `controller_hydraulics_electricHydraulics.init(jbeamData)`

Reads the electrics names.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_electricHydraulics.reset(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_electricHydraulics.updateGFX(dt)`

Updates the 0/1 output value.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulics/electricHydraulics.lua`.*
