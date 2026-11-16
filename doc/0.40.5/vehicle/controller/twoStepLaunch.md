# `controller_twoStepLaunch`

*File: `lua/vehicle/controller/twoStepLaunch.lua` · VM: Vehicle · 229 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `twoStepLaunch` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary "two-step" controller (standing-start rev limiter). Once enabled, it arms when the vehicle is almost stopped with throttle AND brake pressed, then imposes a temporary rev limiter on the engine (engine:setTempRevLimiter) at tempRevLimiterRPM. Releasing brake or throttle disarms it. A modder enables it through toggleTwoStep/setTwoStep or via the radial menu it registers. Publishes electrics.values.twoStep (jbeam name electricsName).

## Example

```lua
local ts = controller.getController("twoStepLaunch")
ts.setParameters({isEnabled = true, launchRPM = 4500})
```

## Notes

- jbeam keys read in init: engineName ("mainEngine"), electricsName ("twoStep"), rpmLimit (2000 RPM).
- Internal states: deactivated -> idle -> armed. Arming with keyboard: speed <= 2 m/s, throttle >= 0.2, brake >= 0.2; otherwise (gamepad/wheel): speed <= 0.5 m/s, throttle >= 0.8, brake >= 0.8.
- Without an engine, updateGFX is nop and the command functions do nothing.
- init registers (only once) "Two-Step" quick menu entries (toggle, RPM +/-100) via core_quickAccess; the call assumes core_quickAccess exists in the game VM (no nil check).
- M.updateGFX is nop at declaration then reassigned in init (nop is an engine global not defined in this file).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_twoStepLaunch.changeTwoStepRPM(amount)` | Adds a value to the two-step rev limit and displays a message. | 56 |
| `controller_twoStepLaunch.deserialize(data)` | Restores the state and RPM from the serialize table. | 176 |
| `controller_twoStepLaunch.getState()` | Synchronizable state: <name>_enabled (boolean) and <name>_rpm. | 192 |
| `controller_twoStepLaunch.init(jbeamData)` | Reads the jbeam keys, gets the engine, sets the rev limit and registers the quick menu entries. *(internal)* | 91 |
| `controller_twoStepLaunch.reset()` | Resets the engine's temporary limiter and sets the state back to idle if it was active. *(internal)* | 82 |
| `controller_twoStepLaunch.serialize()` | Returns {state, rpm} for saving. | 169 |
| `controller_twoStepLaunch.setParameters(parameters)` | Applies external parameters: isEnabled (boolean) and launchRPM (RPM). | 183 |
| `controller_twoStepLaunch.setState(data)` | Restores activation and RPM from the getState table (silent). | 198 |
| `controller_twoStepLaunch.setTwoStep(enabled, silent)` | Enables (idle state) or disables the two-step (resets the temporary limiter) and displays a message unless silent. | 28 |
| `controller_twoStepLaunch.toggleTwoStep()` | Toggles the two-step activation. | 42 |
| `controller_twoStepLaunch.updateGFX(dt)` | Every frame: advances the state (idle -> armed) and applies/removes the temporary limiter, publishes the electric. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_twoStepLaunch.changeTwoStepRPM(amount)`

Adds a value to the two-step rev limit and displays a message.

- `amount` (*number*) : Change in RPM.

#### `controller_twoStepLaunch.deserialize(data)`

Restores the state and RPM from the serialize table.

- `data` (*table*) : Table {state, rpm}.

#### `controller_twoStepLaunch.getState()`

Synchronizable state: <name>_enabled (boolean) and <name>_rpm.

- **returns**: table State table.

#### `controller_twoStepLaunch.init(jbeamData)`

Reads the jbeam keys, gets the engine, sets the rev limit and registers the quick menu entries.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_twoStepLaunch.serialize()`

Returns {state, rpm} for saving.

- **returns**: table Current state.

#### `controller_twoStepLaunch.setParameters(parameters)`

Applies external parameters: isEnabled (boolean) and launchRPM (RPM).

- `parameters` (*table*) : Table {isEnabled?, launchRPM?}.

#### `controller_twoStepLaunch.setState(data)`

Restores activation and RPM from the getState table (silent).

- `data` (*table|nil*) : Table produced by getState.

#### `controller_twoStepLaunch.setTwoStep(enabled, silent)`

Enables (idle state) or disables the two-step (resets the temporary limiter) and displays a message unless silent.

- `enabled` (*boolean*) : Enable?
- `silent` (*boolean|nil*) : Do not display a message.

#### `controller_twoStepLaunch.updateGFX(dt)`

Every frame: advances the state (idle -> armed) and applies/removes the temporary limiter, publishes the electric. (dynamically assigned)

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/twoStepLaunch.lua`.*
