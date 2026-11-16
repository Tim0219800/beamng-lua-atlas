# `controller_hydraulics_truckCabTiltControl`

*File: `lua/vehicle/controller/hydraulics/truckCabTiltControl.lua` · VM: Vehicle · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulics/truckCabTiltControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for a truck's cab tilt: when at least one cab latch (group controller) is "attached", the tilt cylinders are in "float" valve mode; otherwise "closed" (adjustable modes).

## Notes

- jbeam keys (default): cabLatchControllers (names of controllers exposing getGroupState()), cabTiltCylinders (names of hydraulic cylinders), tiltCylinderValveModeLatched ("float"), tiltCylinderValveModeUnlatched ("closed").

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulics_truckCabTiltControl.init(jbeamData)` | Reads the latch controller names, the cylinder names and the valve modes. *(internal)* | 43 |
| `controller_hydraulics_truckCabTiltControl.reset(jbeamData)` | Does nothing. *(internal)* | 40 |
| `controller_hydraulics_truckCabTiltControl.updateGFX(dt)` | Every frame: sets the valve type of the cylinders according to the latch state. *(internal)* | 16 |

### Parameter details

#### `controller_hydraulics_truckCabTiltControl.init(jbeamData)`

Reads the latch controller names, the cylinder names and the valve modes.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_truckCabTiltControl.reset(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_hydraulics_truckCabTiltControl.updateGFX(dt)`

Every frame: sets the valve type of the cylinders according to the latch state.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulics/truckCabTiltControl.lua`.*
