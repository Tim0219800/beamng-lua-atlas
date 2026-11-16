# `controller_braking_retarderControl`

*File: `lua/vehicle/controller/braking/retarderControl.lua` · VM: Vehicle · 260 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/retarderControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that commands a powertrain retarder. An ordered list of settings (optional auto, off, then manual levels) determines the coefficient sent to `retarder:setRetarderCoef`. In auto mode, the retarder follows `brake_input`; it is cut when ABS is active, during a gear change, or (by default) when the throttle is applied. Adds a submenu to the radial menu.

## Example

```lua
local r = controller.getControllerSafe("retarderControl")
r.setRetarderMode("off")
r.changeRetarderSettingIndex(1)
```

## Notes

- Jbeam keys read by init: `controlledRetarder` ("retarder"), `electricsNameActual`, `electricsNameSetting`, `electricsNameIsEnabled`, `electricsNameLevelIndex` (by default `<retarder>_actual|_setting|_isEnabled|_levelIndex`), `retarderManualLevels` ({0.2, 0.4, 0.6, 0.8, 1.0}), `throttleDisableElectricsName` ("throttle"), `throttleDisableThreshold` (0.001), `disableWhenThrottleApplied` (true), `hasAutoMode` (false).
- Settings list: ["auto" if hasAutoMode], "off", then the manual levels. At startup the mode is "off".
- If the device is not found or has no `setRetarderCoef`, init logs an error and replaces `updateGFX` with `nop`.
- The electrics `<retarder>_setting` and `_actual` receive the same value in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_retarderControl.changeRetarderSettingIndex(indexChange)` | Shifts the setting index (clamped to the list limits) and applies it. | 83 |
| `controller_braking_retarderControl.getState()` | Returns the active setting index under the key `<name>_settingIndex`. | 230 |
| `controller_braking_retarderControl.init(jbeamData)` | Finds the retarder, builds the settings list and the radial menu (only once). *(internal)* | 128 |
| `controller_braking_retarderControl.reset(jbeamData)` | Forces the next transmission of the coefficient to the retarder. *(internal)* | 124 |
| `controller_braking_retarderControl.setRetarderMode(newMode)` | Looks for a setting equal to `newMode` in the list and applies it; otherwise a warning in the log. | 73 |
| `controller_braking_retarderControl.setRetarderSettingIndex(settingIndex, silent)` | Applies the setting located at this index in the list (auto, off or manual level); ignored if the index does not exist. | 65 |
| `controller_braking_retarderControl.setState(data)` | Restores the setting index if it is valid (silently). | 237 |
| `controller_braking_retarderControl.updateGFX(dt)` | Every frame: computes the coefficient (depending on the mode, ABS, gear shifts and throttle), passes it to the retarder when it changes and publishes the electrics. *(internal)* | 88 |

### Parameter details

#### `controller_braking_retarderControl.changeRetarderSettingIndex(indexChange)`

Shifts the setting index (clamped to the list limits) and applies it.

- `indexChange` (*integer*) : Index change (+1, -1...).

#### `controller_braking_retarderControl.getState()`

Returns the active setting index under the key `<name>_settingIndex`.

- **returns**: table State table.

#### `controller_braking_retarderControl.init(jbeamData)`

Finds the retarder, builds the settings list and the radial menu (only once).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_retarderControl.reset(jbeamData)`

Forces the next transmission of the coefficient to the retarder.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_braking_retarderControl.setRetarderMode(newMode)`

Looks for a setting equal to `newMode` in the list and applies it; otherwise a warning in the log.

- `newMode` (*string|number*) : "auto", "off" or a manual level from the list.

#### `controller_braking_retarderControl.setRetarderSettingIndex(settingIndex, silent)`

Applies the setting located at this index in the list (auto, off or manual level); ignored if the index does not exist.

- `settingIndex` (*integer*) : Index (1 = first in the settings list).
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_braking_retarderControl.setState(data)`

Restores the setting index if it is valid (silently).

- `data` (*table|nil*) : State table.

#### `controller_braking_retarderControl.updateGFX(dt)`

Every frame: computes the coefficient (depending on the mode, ABS, gear shifts and throttle), passes it to the retarder when it changes and publishes the electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/retarderControl.lua`.*
