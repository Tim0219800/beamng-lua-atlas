# `controller_powertrainControl_combustionEngineGovenor`

*File: `lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua` · VM: Vehicle · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `powertrainControl/combustionEngineGovenor` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary "speed governor" controller of a combustion engine (the file name contains the typo "Govenor"). A PID computes a throttle command so that the engine speed follows a target that varies linearly from rpmTarget0 to rpmTarget1 according to the throttle input; the command is published in electrics.values.throttleGoverned (or jbeam name).

## Notes

- jbeam keys read: controlledEngineName ("mainEngine"), rpmPIDp (0.5), rpmPIDi (0.1), rpmPIDd (0.05), rpmTarget0 (engine idle), rpmTarget1 (engine max RPM), throttleCommandElectricsName ("throttleGoverned"), throttleInputElectricsName ("throttle").
- A missing engine leaves M.updateFixedStep at nil (log E "throttleGovenor").
- updateFixedStep is nil at declaration and only assigned after a successful init.
- The controller only writes the command electrics value: it is up to another element (jbeam/electrics) to use it to drive the engine.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_powertrainControl_combustionEngineGovenor.init(jbeamData)` | Gets the engine, creates the PID, computes the angular speed targets and the electrics names. *(internal)* | 33 |
| `controller_powertrainControl_combustionEngineGovenor.reset(jbeamData)` | Resets the PID if the engine exists. *(internal)* | 27 |

### Parameter details

#### `controller_powertrainControl_combustionEngineGovenor.init(jbeamData)`

Gets the engine, creates the PID, computes the angular speed targets and the electrics names.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_powertrainControl_combustionEngineGovenor.reset(jbeamData)`

Resets the PID if the engine exists.

- `jbeamData` (*table*) : Jbeam data.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateFixedStep` | function|nil | PID loop, assigned in init if the engine is found. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua`.*
