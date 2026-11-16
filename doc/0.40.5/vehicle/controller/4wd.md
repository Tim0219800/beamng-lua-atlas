# `controller_4wd`

*File: `lua/vehicle/controller/4wd.lua` · VM: Vehicle · 216 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `4wd` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that gives the driver control of the selectable 4WD: 4WD shaft (connected/disconnected), range box (high/low) and differentials. It acts either via `driveModes` controllers (if their names are listed in the jbeam), or directly via the `powertrain` API for old vehicles. It writes `electrics.values.mode4WD` and `modeRangeBox` (1 or 0) and adds entries to the radial menu.

## Example

```lua
controller.getControllerSafe("4wd").toggle4WD()
controller.getControllerSafe("4wd").setRangeMode("low")
```

## Notes

- Jbeam keys read by init: `shaftName` (transfer shaft, powertrain device whose `mode` is "connected" or "disconnected"), `rangeBoxName` (range box, mode "low" or "high"). Read by initLastStage: `driveModesRangeNames`, `driveModesTransfercaseNames`, `driveModesDifferentialNames` (tables of driveModes controller names).
- `M.relevantDevice = "transfercase"`: used to sort this controller relative to the powertrain device of the same name.
- The input action calls toggleDiffs/toggle4WD/toggleRange if a 4wd controller exists; otherwise it calls the powertrain API directly (compatibility code cited in the file).
- The radial menu is built only once (hasBuiltPie flag); it captures the `shaft`/`rangeBox` object from the first init.
- There is no `reset` function: controller.reset therefore calls init again on every reset.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_4wd.deserialize(data)` | Restores the 4WD and range modes from the serialize data. *(internal)* | 81 |
| `controller_4wd.init(jbeamData)` | Finds the powertrain devices (`shaftName`, `rangeBoxName`), initializes the electrics values and adds the radial menu entries (only once). *(internal)* | 92 |
| `controller_4wd.initLastStage(jbeamData)` | Finds the driveModes controllers named in `driveModesRangeNames`, `driveModesTransfercaseNames` and `driveModesDifferentialNames` (those that exist). *(internal)* | 171 |
| `controller_4wd.serialize()` | Returns the saved state: {mode4WD, modeRange}. *(internal)* | 74 |
| `controller_4wd.set4WDMode(mode)` | Forces the 4WD shaft mode, unless it is physically disconnected. | 68 |
| `controller_4wd.setRangeMode(mode)` | Forces the range box mode (powertrain.setDeviceMode). No effect if there is no range box. | 49 |
| `controller_4wd.toggle4WD()` | Switches to the next mode of the transfer driveModes controllers; otherwise toggles the 4WD shaft, unless it is physically disconnected (`isPhysicallyDisconnected`). | 55 |
| `controller_4wd.toggleDiffs()` | Switches to the next mode of each differential driveModes controller; otherwise calls powertrain.toggleDefaultDiffs(). | 24 |
| `controller_4wd.toggleRange()` | Switches to the next mode of the range driveModes controllers; otherwise toggles the range box mode via powertrain.toggleDeviceMode. | 36 |
| `controller_4wd.updateGFX(dt)` | Every frame: writes electrics.values.modeRangeBox (1 if low range) and mode4WD (1 if shaft connected). *(internal)* | 19 |

### Parameter details

#### `controller_4wd.deserialize(data)`

Restores the 4WD and range modes from the serialize data.

- `data` (*table|nil*) : Data returned by serialize.

#### `controller_4wd.init(jbeamData)`

Finds the powertrain devices (`shaftName`, `rangeBoxName`), initializes the electrics values and adds the radial menu entries (only once).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_4wd.initLastStage(jbeamData)`

Finds the driveModes controllers named in `driveModesRangeNames`, `driveModesTransfercaseNames` and `driveModesDifferentialNames` (those that exist).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_4wd.serialize()`

Returns the saved state: {mode4WD, modeRange}.

- **returns**: table {mode4WD = string|nil, modeRange = string|nil}.

#### `controller_4wd.set4WDMode(mode)`

Forces the 4WD shaft mode, unless it is physically disconnected.

- `mode` (*string*) : "connected" or "disconnected".

#### `controller_4wd.setRangeMode(mode)`

Forces the range box mode (powertrain.setDeviceMode). No effect if there is no range box.

- `mode` (*string*) : "low" or "high" (values seen in the code).

#### `controller_4wd.updateGFX(dt)`

Every frame: writes electrics.values.modeRangeBox (1 if low range) and mode4WD (1 if shaft connected).

- `dt` (*number*) : Time step in seconds (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `relevantDevice` | string | "transfercase": name of the powertrain device used for the call order. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/4wd.lua`.*
