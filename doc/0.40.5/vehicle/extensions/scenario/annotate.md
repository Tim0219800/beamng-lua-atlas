# `scenario_annotate`

*File: `lua/vehicle/extensions/scenario/annotate.lua` · VM: Vehicle · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_annotate`: `extensions.load (vehicle VM)("scenario_annotate")`, then the global `scenario_annotate`

Example of a vehicle extension driven by a scenario. It displays floating text 2 m above the vehicle (with a vertical line) via obj.debugDrawProxy. The text comes from the `text` field of the vehicle's `extensions.annotate` entry in the scenario .json, passed by the onVehicleScenarioData hook.

## Example

```lua
-- in the scenario .json
-- "vehicles": {"scenario_player0": {"extensions": {"annotate": {"text": "This is your car, treat it well."}}}}
```

## Notes

- Minor bug: `M.onExtensionLoaded = onExtensionLoaded` references a local variable that is never defined, so the field is nil (no consequence, the extension does not need it).
- If `text` is not a string, an error is logged but onDebugDraw will keep calling drawText with an invalid value (data.text is nil before the first onVehicleScenarioData call, which can cause an error).
- The hook also prints and dumps the received data (debug left in the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_annotate.onDebugDraw(focusPos)` | Debug draw hook called by main.lua (extensions.hook('onDebugDraw', focusPos)) on each debug graphics frame. Draws the text `data.text` in black at vehicle position + (0,0,2) and a line between the vehicle and this point. *(internal)* *(hook)* | 29 |
| `scenario_annotate.onVehicleScenarioData(_data)` | Hook called when the scenario provides the extension data for this vehicle. Copies the table (deepcopy), checks that `text` is a string (otherwise error log) and dumps it to the console. *(internal)* *(hook)* | 35 |

### Parameter details

#### `scenario_annotate.onDebugDraw(focusPos)`

Debug draw hook called by main.lua (extensions.hook('onDebugDraw', focusPos)) on each debug graphics frame. Draws the text `data.text` in black at vehicle position + (0,0,2) and a line between the vehicle and this point.

- `focusPos` (*vec3*) : Camera focus position (unused here).

#### `scenario_annotate.onVehicleScenarioData(_data)`

Hook called when the scenario provides the extension data for this vehicle. Copies the table (deepcopy), checks that `text` is a string (otherwise error log) and dumps it to the console.

- `_data` (*table*) : Table from the scenario .json (`extensions.annotate`), expected with a `text` field (string).

## Fields

| Field | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Always nil: assigned from an undefined variable (see notes). ⚠ reference `onExtensionLoaded` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `obj:` `getPosition`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/scenario/annotate.lua`.*
