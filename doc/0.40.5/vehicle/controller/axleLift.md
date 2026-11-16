# `controller_axleLift`

*File: `lua/vehicle/controller/axleLift.lua` · VM: Vehicle · 176 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `axleLift` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that raises or lowers axles (typically a truck's liftable axles) to gain ground clearance. It writes a target position into two `electrics.values` (front and rear) that the jbeam reads. Three modes: auto (raises unless speed is too high, speed is too low, the parking brake is applied or lateral acceleration is too strong), manual (always raised) and off (always lowered).

## Example

```lua
controller.getControllerSafe("axleLift").setMode("manual", true)
controller.getControllerSafe("axleLift").setParameters({velocityThresholdDisable = 10})
```

## Notes

- Jbeam keys read by init: `velocityThresholdDisable` (14 m/s, above it the axle comes back down), `velocityThresholdEnable` (0.1 m/s, below it it comes back down), `accelerationThreshold` (3 m/s², on |sensors.gy2|), `frontLoweredPosition`/`rearLoweredPosition` (0), `frontRaisedPosition`/`rearRaisedPosition` (1), `frontAxleLiftElectricsName` ("strut_F_axleLift"), `rearAxleLiftElectricsName` ("strut_R_axleLift").
- The mode state is saved under the key `<controller name>Mode` in getState/setState.
- After `reset`, the electrics are set back to 0 but the mode is not reinitialized (init is not called again because `reset` exists).
- The radial menu is added only once (hasBuiltPie).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_axleLift.getState()` | Returns the current mode under the key `<name>Mode`. | 148 |
| `controller_axleLift.init(jbeamData)` | Reads the jbeam parameters, sets the electrics to 0, switches to auto mode and adds the radial menu entry. *(internal)* | 90 |
| `controller_axleLift.reset()` | Resets the two axle electrics values to 0. *(internal)* | 85 |
| `controller_axleLift.setMode(mode, silent)` | Changes the mode ("auto", "manual" or "off"). An unknown mode is ignored. Displays a UI message unless silent. | 60 |
| `controller_axleLift.setParameters(parameters)` | Modifies the thresholds and the mode on the fly; only the fields present are applied. | 133 |
| `controller_axleLift.setState(data)` | Restores the mode from a state table (silently) if the value is valid. | 153 |
| `controller_axleLift.toggleMode()` | Switches to the next mode in the order auto, manual, off, auto. | 81 |
| `controller_axleLift.updateGFX(dt)` | Every frame: chooses the raised or lowered position depending on the mode (in auto: smoothed speed, wheel speed, parking brake, lateral acceleration) and writes it to the two axle electrics. *(internal)* | 34 |

### Parameter details

#### `controller_axleLift.getState()`

Returns the current mode under the key `<name>Mode`.

- **returns**: table<string, string> State table.

#### `controller_axleLift.init(jbeamData)`

Reads the jbeam parameters, sets the electrics to 0, switches to auto mode and adds the radial menu entry.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_axleLift.setMode(mode, silent)`

Changes the mode ("auto", "manual" or "off"). An unknown mode is ignored. Displays a UI message unless silent.

- `mode` (*string*) : "auto", "manual" or "off".
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_axleLift.setParameters(parameters)`

Modifies the thresholds and the mode on the fly; only the fields present are applied.

- `parameters` (*table*) : Optional fields: mode, accelerationThreshold, velocityThresholdDisable, velocityThresholdEnable.

#### `controller_axleLift.setState(data)`

Restores the mode from a state table (silently) if the value is valid.

- `data` (*table|nil*) : Table containing the key `<name>Mode`.

#### `controller_axleLift.updateGFX(dt)`

Every frame: chooses the raised or lowered position depending on the mode (in auto: smoothed speed, wheel speed, parking brake, lateral acceleration) and writes it to the two axle electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/axleLift.lua`.*
