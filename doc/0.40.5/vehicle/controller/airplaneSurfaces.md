# `controller_airplaneSurfaces`

*File: `lua/vehicle/controller/airplaneSurfaces.lua` · VM: Vehicle · 130 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `airplaneSurfaces` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for airplanes: combines the pilot's inputs (rudder, ailerons, elevator) with the trims, and handles flaps and slats. It writes the results to `electrics.values` (rudder, aileron, elevator, slat, flap), which the jbeam actuators then use, and displays UI messages when a value changes.

## Notes

- Jbeam keys read by init: `flapStart`, `slatStart`, `rudderTrimmingStart`, `aileronTrimmingStart`, `elevatorTrimmingStart` (start values, 0 by default), `trimSpeed` (0.05), `flapSpeed` (0.1), `slatSpeed` (0.1); speeds expressed as a fraction per second.
- Inputs read from `input`: rudder, aileron, elevator, trimChange, trimRudder, trimAileron, trimElevator, flap, slat, flapChange, slatChange. The relative trim (`trimChange`) acts on the axis chosen by toggleTrimMode (elevator, aileron, rudder, cycling in that order).
- Outputs: rudder/aileron/elevator = input + trim (not limited to [-1,1] in this file); trim, flap and slat are clamped (trim -1..1, flap and slat 0..1 for relative inputs).
- No `reset` function exists: controller.reset calls init again. updateGFX assumes init has already initialized `trimming`.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_airplaneSurfaces.init(jbeamData)` | Initializes the electrics, the start values of flaps/slats/trims and the speeds from the jbeam. *(internal)* | 91 |
| `controller_airplaneSurfaces.setTrimValue(input, value)` | Directly sets the trim value of an axis (no effect if the axis is unknown). | 85 |
| `controller_airplaneSurfaces.toggleTrimMode()` | Switches to the next trim axis (elevator, aileron, rudder) and announces it with a UI message. | 75 |
| `controller_airplaneSurfaces.updateGFX(dt)` | Every frame: applies the inputs and trims to the electrics rudder, aileron, elevator, updates flap and slat (absolute input value if it changed, otherwise relative adjustment), and displays a UI message when a trim, the flaps or the slats vary by more than 0.005. *(internal)* | 32 |

### Parameter details

#### `controller_airplaneSurfaces.init(jbeamData)`

Initializes the electrics, the start values of flaps/slats/trims and the speeds from the jbeam.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_airplaneSurfaces.setTrimValue(input, value)`

Directly sets the trim value of an axis (no effect if the axis is unknown).

- `input` (*string*) : "rudder", "aileron" or "elevator".
- `value` (*number*) : Trim value (normally -1 to 1).

#### `controller_airplaneSurfaces.updateGFX(dt)`

Every frame: applies the inputs and trims to the electrics rudder, aileron, elevator, updates flap and slat (absolute input value if it changed, otherwise relative adjustment), and displays a UI message when a trim, the flaps or the slats vary by more than 0.005.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary" (mandatory controller parameter). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/airplaneSurfaces.lua`.*
