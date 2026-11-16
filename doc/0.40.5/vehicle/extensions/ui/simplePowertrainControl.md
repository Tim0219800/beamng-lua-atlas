# `ui_simplePowertrainControl`

*File: `lua/vehicle/extensions/ui/simplePowertrainControl.lua` · VM: Vehicle · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_simplePowertrainControl`: `extensions.load (vehicle VM)("ui_simplePowertrainControl")`, then the global `ui_simplePowertrainControl`

Bridge between the vehicle and the simplified powertrain control buttons shown in the UI. setButton sends the UI event `ChangePowerTrainButtons` (create, update or remove a button); updateButtons asks powertrain and the controllers to republish their buttons. The powertrain/controller modules use it, a modder can add their own buttons to it.

## Example

```lua
ui_simplePowertrainControl.setButton('myBtn', 'Mon bouton', 'iconId', '#ff8800', 0.5, 'controller.getController("x").toggle()', false, true)
```

## Notes

- The `players` field sent to the UI is the sorted list of seated player indices (playerInfo.seatedPlayers).
- The color is normalized: if it is a non-empty string without a leading '#', a '#' is added; otherwise (nil or other type) it becomes nil.
- onClickCallback is passed as is to the UI (onClick field); it is a value the UI will send back, presumably a Lua code string (inferred from code, not verified here).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_simplePowertrainControl.onInit()` | Vehicle initialization hook; empty body. *(internal)* *(hook)* | 49 |
| `ui_simplePowertrainControl.onReset()` | Vehicle reset hook; empty body. *(internal)* *(hook)* | 46 |
| `ui_simplePowertrainControl.setButton(id, uiName, icon, color, ringValue, onClickCallback, remove, active)` | Publishes a simplified control button to the UI via guihooks.trigger('ChangePowerTrainButtons', {...}). | 17 |
| `ui_simplePowertrainControl.updateButtons()` | Calls powertrain.updateSimpleControlButtons() then controller.updateSimpleControlButtons() so that each module republishes its buttons. | 41 |

### Parameter details

#### `ui_simplePowertrainControl.setButton(id, uiName, icon, color, ringValue, onClickCallback, remove, active)`

Publishes a simplified control button to the UI via guihooks.trigger('ChangePowerTrainButtons', {...}).

- `id` (*string*) : Button identifier.
- `uiName` (*string*) : Tooltip text (tooltip field).
- `icon` (*string*) : Icon identifier.
- `color` (*string|nil*) : Hexadecimal color; '#' added if missing.
- `ringValue` (*number|any*) : Value of the button's progress ring (passed as is).
- `onClickCallback` (*string|any*) : Callback passed to the UI (onClick field).
- `remove` (*boolean|nil*) : true to remove the button.
- `active` (*boolean|nil*) : Active state of the button.

**UI events (guihooks.trigger):** `ChangePowerTrainButtons`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/ui/simplePowertrainControl.lua`.*
