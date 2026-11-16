# `controller_controlModes`

*File: `lua/vehicle/controller/controlModes.lua` · VM: Vehicle · 149 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `controlModes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that remaps the driver's inputs (steering, throttle, brake, or combined throttle-brake) to custom `electrics.values` values, according to a chosen "control mode" (for example to drive a crane or cylinders). Each mode lists the active electrics; each electric is configured with a source input, smoothings, a speed and bounds. Adds a radial menu to choose the mode.

## Notes

- Jbeam keys read by init: `modes` (header table with `name`, `electrics`: list of electrics names active in the mode), `config` (header table with `electric`, `input`, `smoothIn`, `smoothOut`, `speed`, `min`, `max`), `defaultControlModeIndex` (1).
- Possible inputs in `config.input`: steering, throttle, brake, throttlebrake (= throttle - brake), or a name defined via setInputValue.
- Computation every frame: value = clamp(value + smoothing(input) × speed × dt, min, max): the input therefore drives a rate of change, not the position (integrator effect).
- controlModeName and controlModeIndex are nil until init has run; they are filled by init.
- There is no `reset` function: controller.reset calls init again.
- State saved under the key `<name>_modeIndex`.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_controlModes.getState()` | Returns the active mode index under the key `<name>_modeIndex`. | 123 |
| `controller_controlModes.init(jbeamData)` | Reads the modes and the configuration from the jbeam, creates the smoothers, sets the electrics to 0 and registers the radial menu (only once). *(internal)* | 65 |
| `controller_controlModes.setControlModeIndex(index, silent)` | Chooses the mode by its index (ignored if it does not exist) and displays its name unless silent. | 38 |
| `controller_controlModes.setInputValue(name, value)` | Defines a custom input usable in `config.input`. | 61 |
| `controller_controlModes.setState(data)` | Restores the mode index if it is valid (silently). | 128 |
| `controller_controlModes.toggleControlMode(value)` | Shifts the mode index by `value` with cyclic wrap-around (beyond the last: first; below the first: last). | 50 |
| `controller_controlModes.updateGFX(dt)` | Every frame: reads the inputs and updates the electrics of the active mode (bounded smoothed integration). *(internal)* | 25 |

### Parameter details

#### `controller_controlModes.getState()`

Returns the active mode index under the key `<name>_modeIndex`.

- **returns**: table State table.

#### `controller_controlModes.init(jbeamData)`

Reads the modes and the configuration from the jbeam, creates the smoothers, sets the electrics to 0 and registers the radial menu (only once).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_controlModes.setControlModeIndex(index, silent)`

Chooses the mode by its index (ignored if it does not exist) and displays its name unless silent.

- `index` (*integer*) : Mode index (1 = first).
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_controlModes.setInputValue(name, value)`

Defines a custom input usable in `config.input`.

- `name` (*string*) : Input name.
- `value` (*number*) : Input value.

#### `controller_controlModes.setState(data)`

Restores the mode index if it is valid (silently).

- `data` (*table|nil*) : State table.

#### `controller_controlModes.toggleControlMode(value)`

Shifts the mode index by `value` with cyclic wrap-around (beyond the last: first; below the first: last).

- `value` (*integer*) : +1 or -1 in practice.

#### `controller_controlModes.updateGFX(dt)`

Every frame: reads the inputs and updates the electrics of the active mode (bounded smoothed integration).

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `controlModeIndex` | integer|nil | Index of the active mode (1 = first); nil before init. |
| `controlModeName` | string|nil | Name of the active mode; nil before init. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/controlModes.lua`.*
