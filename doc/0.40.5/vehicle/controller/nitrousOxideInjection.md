# `controller_nitrousOxideInjection`

*File: `lua/vehicle/controller/nitrousOxideInjection.lua` · VM: Vehicle · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `nitrousOxideInjection` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for nitrous oxide (N2O) control (type "auxiliary", relevantDevice "mainEngine"). It arms/disarms the system via electrics.values (arming electrics value), purges the lines on arming and adds an "N2O" button to the simplified control panel and an entry to the radial menu. The injection itself is handled by the engine (engine.nitrousOxideInjection); this controller only handles the interface and the arming.

## Example

```lua
local n2o = controller.getControllerSafe('nitrousOxideInjection')
n2o.toggleActive()      -- arms/disarms
n2o.setOverride(true)   -- forces the injection (override electrics value)
```

## Notes

- jbeam keys (default): name (controller name for the radial menu), engineName ("mainEngine"), electricsArmName ("nitrousOxideArm"), electricsOverrideName ("nitrousOxideOverride"), purgeTime (1, s).
- The controller is only active (updateGFX) if the engine has an existing nitrousOxideInjection subsystem; otherwise M.updateGFX stays nop.
- toggleActive: when arming (electrics value 0 -> 1) the line purge is started for purgeTime seconds; an Armed/Disarmed interface message is displayed.
- serialize/deserialize/getState/setState handle the arming state (serialize) or the remaining purge time (getState).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_nitrousOxideInjection.deserialize(data)` | Restores the arming state. | 71 |
| `controller_nitrousOxideInjection.getState()` | Returns the remaining purge time. | 77 |
| `controller_nitrousOxideInjection.init(jbeamData)` | Reads the configuration, finds the engine, registers the radial menu and displays the state. *(internal)* | 104 |
| `controller_nitrousOxideInjection.reset(jbeamData)` | Clears the interface state data. *(internal)* | 100 |
| `controller_nitrousOxideInjection.serialize()` | Returns the arming state. | 65 |
| `controller_nitrousOxideInjection.setOverride(active)` | Enables/disables the injection override electrics value. | 53 |
| `controller_nitrousOxideInjection.setState(data)` | Restores the remaining purge time (bounded 0..purgeTime). | 84 |
| `controller_nitrousOxideInjection.toggleActive()` | Arms or disarms the system (line purge on arming) and displays a message. | 57 |
| `controller_nitrousOxideInjection.updateGFX(dt)` | Updates the simplified panel button when the tank, the arming or the activity change (nop if no N2O) (dynamically assigned) *(internal)* | dyn |
| `controller_nitrousOxideInjection.updateSimpleControlButtons()` | (Re)creates the "N2O" button of the simplified panel with the color (inactive, armed, active) and the tank level. | 25 |

### Parameter details

#### `controller_nitrousOxideInjection.deserialize(data)`

Restores the arming state.

- `data` (*table|nil*) : Table returned by serialize.

#### `controller_nitrousOxideInjection.getState()`

Returns the remaining purge time.

- **returns**: table State table (reused).

#### `controller_nitrousOxideInjection.init(jbeamData)`

Reads the configuration, finds the engine, registers the radial menu and displays the state.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_nitrousOxideInjection.reset(jbeamData)`

Clears the interface state data.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_nitrousOxideInjection.serialize()`

Returns the arming state.

- **returns**: table {isArmed = electrics value}

#### `controller_nitrousOxideInjection.setOverride(active)`

Enables/disables the injection override electrics value.

- `active` (*boolean*) : True to force the injection.

#### `controller_nitrousOxideInjection.setState(data)`

Restores the remaining purge time (bounded 0..purgeTime).

- `data` (*table|nil*) : State table.

#### `controller_nitrousOxideInjection.updateGFX(dt)`

Updates the simplified panel button when the tank, the arming or the activity change (nop if no N2O) (dynamically assigned)

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `relevantDevice` | string | "mainEngine": concerned powertrain device (default value). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/nitrousOxideInjection.lua`.*
