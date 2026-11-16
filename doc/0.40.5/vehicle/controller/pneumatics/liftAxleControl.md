# `controller_pneumatics_liftAxleControl`

*File: `lua/vehicle/controller/pneumatics/liftAxleControl.lua` · VM: Vehicle · 163 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics/liftAxleControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary pneumatic axle lift controller (trailers/trucks). Two modes: "lift" (axle raised: lift airbags inflated, main airbags emptied) and "drop" (axle lowered: the opposite), driven via two actuator controllers (airbags). In drop mode, the maximum supply pressure of the main airbags can be changed dynamically (load carried by the axle). Publishes the relative average pressures and the mode in electrics.values.

## Example

```lua
local lac = controller.getController("liftAxleControl")
lac.toggleMode()
lac.setMaximumSupplyPressure(500000) -- absolute Pa
```

## Notes

- jbeam keys read: defaultMaximumSupplyPressure (0), liftAirbagsGroupName, mainAirbagsGroupName, minimumSupplyPressure (0), maximumSupplyPressure (1000000), maximumSupplyPressureChangeRate (1000 Pa/s), mainAirbagsPressureEletricsName, liftAirbagsPressureEletricsName, liftAxleControlModeEletricsName (default names derived from M.name: _main_airbags_pressure_avg, _lift_airbags_pressure_avg, _lift_axle_mode), actuatorsControllerNameLift and actuatorsControllerNameMain (read in initLastStage).
- The initial mode is "lift" (setMode called in initLastStage). electrics ...lift_axle_mode is 1 in drop mode, 0 in lift.
- The maximum supply pressure changes every frame by maximumSupplyPressureChangeRate*dt, bounded between max(ambient pressure, minimumSupplyPressure) and maximumSupplyPressure (jbeam).
- If one of the actuator controllers is not found, log E and updateGFX becomes nop.
- reset sets maximumSupplyPressureChangeRate to 0 (and not to the jbeam value): after a reset the pressure no longer moves until setMaximumSupplyPressureChangeRate is called. Probable inconsistency with init (default value 1000).
- Source note: M.initSecondStage does not exist here despite a comment in the code; the function actually exported is initLastStage.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics_liftAxleControl.getState()` | Saveable state: mode, maximum supply pressure, rate of change (keys prefixed by the controller name). | 115 |
| `controller_pneumatics_liftAxleControl.init(jbeamData)` | Reads the jbeam keys, airbag group names and electrics names. *(internal)* | 77 |
| `controller_pneumatics_liftAxleControl.initLastStage(jbeamData)` | Gets the two actuator controllers then switches to "lift" mode. *(internal)* | 95 |
| `controller_pneumatics_liftAxleControl.reset(jbeamData)` | Sets the supply pressure change rate to 0. *(internal)* | 73 |
| `controller_pneumatics_liftAxleControl.setMaximumSupplyPressure(maxSupplyPressure)` | Sets the maximum supply pressure of the main airbags (absolute Pa), applied in drop mode. | 65 |
| `controller_pneumatics_liftAxleControl.setMaximumSupplyPressureChangeRate(maxSupplyPressureChangeRate)` | Sets the rate of change of this maximum pressure (Pa/s, signed). | 69 |
| `controller_pneumatics_liftAxleControl.setMode(mode)` | Chooses the "lift" or "drop" mode and opens/closes the valves of the two airbag groups accordingly. | 46 |
| `controller_pneumatics_liftAxleControl.setState(data)` | Restores pressure, rate and mode (NaN values ignored). | 122 |
| `controller_pneumatics_liftAxleControl.toggleMode()` | Toggles between drop and lift. | 57 |
| `controller_pneumatics_liftAxleControl.updateGFX(dt)` | Every frame: applies the maximum supply pressure in drop mode, makes it evolve and updates the pressure and mode electrics. *(internal)* | 32 |

### Parameter details

#### `controller_pneumatics_liftAxleControl.getState()`

Saveable state: mode, maximum supply pressure, rate of change (keys prefixed by the controller name).

- **returns**: table State table.

#### `controller_pneumatics_liftAxleControl.init(jbeamData)`

Reads the jbeam keys, airbag group names and electrics names.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_liftAxleControl.initLastStage(jbeamData)`

Gets the two actuator controllers then switches to "lift" mode.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_pneumatics_liftAxleControl.reset(jbeamData)`

Sets the supply pressure change rate to 0.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_pneumatics_liftAxleControl.setMaximumSupplyPressure(maxSupplyPressure)`

Sets the maximum supply pressure of the main airbags (absolute Pa), applied in drop mode.

- `maxSupplyPressure` (*number*) : Pressure in Pa.

#### `controller_pneumatics_liftAxleControl.setMaximumSupplyPressureChangeRate(maxSupplyPressureChangeRate)`

Sets the rate of change of this maximum pressure (Pa/s, signed).

- `maxSupplyPressureChangeRate` (*number*) : Change in Pa/s.

#### `controller_pneumatics_liftAxleControl.setMode(mode)`

Chooses the "lift" or "drop" mode and opens/closes the valves of the two airbag groups accordingly.

- `mode` (*string*) : "lift" or "drop".

#### `controller_pneumatics_liftAxleControl.setState(data)`

Restores pressure, rate and mode (NaN values ignored).

- `data` (*table|nil*) : Table produced by getState.

#### `controller_pneumatics_liftAxleControl.updateGFX(dt)`

Every frame: applies the maximum supply pressure in drop mode, makes it evolve and updates the pressure and mode electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics/liftAxleControl.lua`.*
