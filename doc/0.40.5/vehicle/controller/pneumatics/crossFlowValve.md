# `controller_pneumatics_crossFlowValve`

*File: `lua/vehicle/controller/pneumatics/crossFlowValve.lua` · VM: Vehicle · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics/crossFlowValve` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller simulating an air transfer valve between two tanks (energyStorage): air passes from the source tank to the target tank as long as the source pressure exceeds a minimum and that of the target. The flow depends on the valve cross-section and the pressure difference (orifice equation).

## Notes

- jbeam keys read in init: sourceTankName ("mainAirTank"), targetTankName ("auxAirTank"), flowPipeRadius (0.0075 m), flowValveRadius (0.2 x flowPipeRadius), sourceTankMinPressure (Pa, 0) or sourceTankMinPressurePSI (converted to absolute Pa: psi x 6894.757 + 101325), pressureDiffForFullFlow (34473.8 Pa = 5 psi) or pressureDiffForFullFlowPSI (difference, without atmospheric pressure).
- If one of the two tanks is not found, a D log is written and updateFixedStep is replaced by nop (the valve does nothing).
- The transfer is one-way source -> target.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics_crossFlowValve.init(jbeamData)` | Gets the source/target tanks and computes the cross-sections and pressure thresholds from the jbeam keys. *(internal)* | 66 |
| `controller_pneumatics_crossFlowValve.reset()` | Does nothing. *(internal)* | 62 |
| `controller_pneumatics_crossFlowValve.updateFixedStep(dt)` | Physics step: computes the air flow between the tanks and transfers the stored energy from the source to the target, updating currentPressure of both. *(internal)* | 34 |

### Parameter details

#### `controller_pneumatics_crossFlowValve.init(jbeamData)`

Gets the source/target tanks and computes the cross-sections and pressure thresholds from the jbeam keys.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_crossFlowValve.updateFixedStep(dt)`

Physics step: computes the air flow between the tanks and transfers the stored energy from the source to the target, updating currentPressure of both.

- `dt` (*number*) : Physics step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics/crossFlowValve.lua`.*
