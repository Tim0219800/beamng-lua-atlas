# `controller_driveModes`

*File: `lua/vehicle/controller/driveModes.lua` · VM: Vehicle · 450 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `driveModes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary drive modes controller (Eco, Sport, Snow, etc., or differential/range modes for a 4x4). Each mode is a set of typed settings applied all at once when the mode changes: exhaust, turbo, supercharger, automatic gearbox, parameters of another controller (`setParameters`), mode of a powertrain device, electrics value, radial menu entry and simplified control panel button. Several can be instantiated (one per function: driving, differential, range...). The default mode is applied in initLastStage.

## Example

```lua
local dm = controller.getControllerSafe("driveModes")
dm.nextDriveMode()
print(dm.getCurrentDriveModeKey())
dm.setDriveMode("sport", true)
```

## Notes

- Instance jbeam keys: `uiName`, `quickAccessTitle` ("ui.radialmenu2.ESC"), `quickAccessIcon`, `quickAccessLevel` ("/vehicleFeatures/"), `radialIcon`, `defaultMode` (key of the initial mode), `defaultSettings` (header table of settings applied to all modes). All keys starting with `modes` (e.g. modes, modes_sport) are merged into a single table of modes; all those starting with `enabledModes` list the keys of the modes actually usable.
- A mode: `{name, order, settings}` where settings is a header table of settings. Setting types recognized by applyDriveMode: "exhaust" (name, mufflingOffset, gainOffset), "turbocharger" (name, wastegateOffset), "supercharger" (name, bypassPressure), "transmission" (defaultForwardMode, calls `controller.mainController.setDefaultForwardMode`), "quickAccess" (icon, title), "simpleControlButton" (buttonId, uiName, icon, color, offColor, offColorElectric, onClick, remove), "controller" (controllerName + other fields passed to the target controller's `setParameters`), "powertrainDeviceMode" (deviceName, mode), "electricsValue" (electricsName, value).
- A setting's key = `key`, otherwise deviceName, electricsName, controllerName or type. A mode's setting replaces the one from `defaultSettings` with the same key. Application order: the settings with key `yawControl` and `tractionControl` are sorted first (rank 0), all others have rank 1 (relative order among them not guaranteed).
- Anomaly: the duplicate order test in init looks at `driveModes[mode.order]` whereas the table is keyed by mode key, so it normally detects nothing.
- The `driveModes` and `enabledDriveModes` tables are module-level and are not emptied in init.
- `reset` only resets the radial menu title and icon; the active mode is reapplied by resetLastStage.
- Saved state: `getState` returns the key under `<name>ActiveMode`; `serialize` returns {activeDriveModeKey, activeDriveModeIndex}.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_driveModes.deserialize(data)` | Restores the active mode from serialize. *(internal)* | 237 |
| `controller_driveModes.getCurrentDriveModeKey()` | Returns the key of the active mode. | 208 |
| `controller_driveModes.getDriveModeData(modeKey)` | Returns a mode's data (key, name, order, settings, settingsOrder). | 214 |
| `controller_driveModes.getState()` | Returns the key of the active mode under `<name>ActiveMode`. | 246 |
| `controller_driveModes.init(jbeamData)` | Reads the modes (`modes*` keys), the enabled modes (`enabledModes*`) and the default settings from the jbeam, sorts the modes and registers the radial menu entry. *(internal)* | 295 |
| `controller_driveModes.initLastStage(jbeamData)` | Chooses the default mode (`defaultMode` if enabled, otherwise the first) and applies it. *(internal)* | 409 |
| `controller_driveModes.nextDriveMode()` | Switches to the next enabled mode, wrapping back to the first at the end. | 190 |
| `controller_driveModes.previousDriveMode()` | Switches to the previous enabled mode, wrapping back to the last at the start. | 199 |
| `controller_driveModes.reset(jbeamData)` | Restores the radial menu title and icon read from the jbeam. *(internal)* | 220 |
| `controller_driveModes.resetLastStage()` | Reapplies the active mode after the reset. *(internal)* | 225 |
| `controller_driveModes.serialize()` | Returns the active mode for the save. *(internal)* | 231 |
| `controller_driveModes.setDriveMode(modeKey, silent)` | Activates the mode with the given key: finds its index among the enabled modes, applies all its settings and displays a UI message unless silent. Unknown or nil key: does nothing. | 164 |
| `controller_driveModes.setSimpleControlButton(id, buttonUIName, icon, color, offColor, offColorElectric, onClick, remove)` | Creates, updates or removes a button of the simplified control panel (`ui_simplePowertrainControl`). The default click calls this controller's `nextDriveMode()`. | 75 |
| `controller_driveModes.setState(data)` | Silently activates the given mode if it exists and differs from the active mode. | 253 |
| `controller_driveModes.updateGFX(dt)` | Every frame: updates the color (active or off) of the simplified control buttons according to their `offColorElectric` electrics. *(internal)* | 154 |
| `controller_driveModes.updateSimpleControlButtons()` | Sends the state of all buttons back to the simplified control panel (called by controller.updateSimpleControlButtons). | 94 |

### Parameter details

#### `controller_driveModes.deserialize(data)`

Restores the active mode from serialize.

- `data` (*table|nil*) : Serialize data.

#### `controller_driveModes.getCurrentDriveModeKey()`

Returns the key of the active mode.

- **returns**: string|nil Key of the active mode, nil if none.

#### `controller_driveModes.getDriveModeData(modeKey)`

Returns a mode's data (key, name, order, settings, settingsOrder).

- `modeKey` (*string|nil*) : Mode key.
- **returns**: table|nil Mode data, nil if unknown.

#### `controller_driveModes.getState()`

Returns the key of the active mode under `<name>ActiveMode`.

- **returns**: table State table.

#### `controller_driveModes.init(jbeamData)`

Reads the modes (`modes*` keys), the enabled modes (`enabledModes*`) and the default settings from the jbeam, sorts the modes and registers the radial menu entry.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_driveModes.initLastStage(jbeamData)`

Chooses the default mode (`defaultMode` if enabled, otherwise the first) and applies it.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_driveModes.reset(jbeamData)`

Restores the radial menu title and icon read from the jbeam.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_driveModes.serialize()`

Returns the active mode for the save.

- **returns**: table|nil {activeDriveModeKey, activeDriveModeIndex}, nil if no mode.

#### `controller_driveModes.setDriveMode(modeKey, silent)`

Activates the mode with the given key: finds its index among the enabled modes, applies all its settings and displays a UI message unless silent. Unknown or nil key: does nothing.

- `modeKey` (*string|nil*) : Mode key.
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_driveModes.setSimpleControlButton(id, buttonUIName, icon, color, offColor, offColorElectric, onClick, remove)`

Creates, updates or removes a button of the simplified control panel (`ui_simplePowertrainControl`). The default click calls this controller's `nextDriveMode()`.

- `id` (*string*) : Button identifier.
- `buttonUIName` (*string*) : Displayed name.
- `icon` (*string*) : Icon.
- `color` (*string*) : Color (hexadecimal) when active.
- `offColor` (*string|nil*) : Off color (default "343434").
- `offColorElectric` (*string|nil*) : Electrics name: at 1 or more, the button takes `offColor`.
- `onClick` (*string|nil*) : Lua code run on click.
- `remove` (*boolean|nil*) : true to remove the button.

#### `controller_driveModes.setState(data)`

Silently activates the given mode if it exists and differs from the active mode.

- `data` (*table|nil*) : State table.

#### `controller_driveModes.updateGFX(dt)`

Every frame: updates the color (active or off) of the simplified control buttons according to their `offColorElectric` electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/driveModes.lua`.*
