# `scenario_functionFreezer`

*File: `lua/vehicle/extensions/scenario/functionFreezer.lua` · VM: Vehicle · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_functionFreezer`: `extensions.load (vehicle VM)("scenario_functionFreezer")`, then the global `scenario_functionFreezer`

Lets a scenario creator prevent some of the vehicle's Lua functions from running until the scenario has started (intro screen, intro camera), for example so that a cannon does not fire during playback. On load the extension wraps controller.setFreeze: when the game calls setFreeze(1) the listed functions are replaced by `nop`, and setFreeze(any other value) restores them. The list comes from the onVehicleScenarioData hook (array of strings like "hydro_input.liftUp").

## Example

```lua
-- in the scenario .json, functionFreezer extension:
-- ["hydro_input.liftUp", "controller.shiftDown"]
```

## Notes

- Names are evaluated with loadstring ("return name"), so they are global Lua paths. A nonexistent entry or one that is not a function is rejected with an error log.
- The backup of the original function is stored in a global named `<name>_freeze_backup`. Freezing twice is ignored (D log), unfreezing a function that was never frozen gives an E log.
- Only the value 1 freezes; any other value (0 or other) unfreezes.
- The replacement only affects the named global/table: local references already captured by other modules (local f = module.func) are not affected.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_functionFreezer.onExtensionLoaded()` | Hook called when the extension loads. Saves controller.setFreeze and replaces it with a function that calls the original (if it exists) then applies the freeze/unfreeze of the listed functions. *(internal)* *(hook)* | 38 |
| `scenario_functionFreezer.onExtensionUnloaded()` | Hook called on unload. Unfreezes all functions (internal setFreeze(0)) then restores the original controller.setFreeze. *(internal)* *(hook)* | 51 |
| `scenario_functionFreezer.onVehicleScenarioData(data)` | Hook called with the scenario configuration. First unfreezes everything, empties the list, then validates each function name in the array and adds it to the list to freeze (does not freeze immediately: freezing happens at the next controller.setFreeze(1)). *(internal)* *(hook)* | 57 |

### Parameter details

#### `scenario_functionFreezer.onVehicleScenarioData(data)`

Hook called with the scenario configuration. First unfreezes everything, empties the list, then validates each function name in the array and adds it to the list to freeze (does not freeze immediately: freezing happens at the next controller.setFreeze(1)).

- `data` (*string[]*) : Array of global function paths as strings (e.g. "controller.shiftDown").

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/scenario/functionFreezer.lua`.*
