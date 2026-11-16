# `core_quickAccess`

*File: `lua/vehicle/extensions/core/quickAccess.lua` · VM: Vehicle · 338 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_quickAccess`: `extensions.load (vehicle VM)("core_quickAccess")`, then the global `core_quickAccess`

Vehicle-side proxy of the GE Lua radial menu (quick access): vehicle modules declare menu entries there (addEntry), the GE requests the list (requestItems) then reports the selection of an item (selectItem). Also handles the cruise control entries and the base categories of the vehicle menu.

## Example

```lua
extensions.core_quickAccess.addEntry({
  level = "/root/playerVehicle/lights/",
  title = "My action", icon = "lowBeam", uniqueID = "myAction",
  onSelect = function() print("click") return {"hide"} end
})
```

## Notes

- addEntry must stay in sync with GE/core/quickAccess/addEntry (code comment). Fields of an entry: title (translation key or {txt, context}), level (default '/root/playerVehicle/general/'), onSelect/onSecondarySelect/onTertiarySelect(item), onDeselect/onSecondaryDeselect/onTertiaryDeselect, goto (target level), generator(entries) (function that dynamically adds entries to the level), uniqueID (replaces an existing entry of the same level), icon, color, priority, startSlot/endSlot, desc, holdRepeat, originalActionInfo.
- The level is normalized: prefixed with '/root/playerVehicle' if it does not start with '/root/playerVehicle/' or '/root/sandbox/', and terminated with '/'. The check `type(args.level) ~= 'string'` is done after the string.startswith calls: a non-string level produces an error before reaching this check.
- Possible return values of an onSelect: nil (hide the menu), {'hide'}, {'reload'} (reloads the menu 2 frames later) or {'goto', level}, {'error', reason}.
- The menu is rebuilt at each requestItems: the generators are run on a deep copy of the tree, entries with generator are removed and each entry receives objID and id = level .. title .. index.
- Cruise control: at onInit, if the vehicle has driven wheels, an entry at level '/root/playerVehicle/cruise_control/' adds 4 buttons (enable/disable, +/resume, -/set, cancel) that drive the cruiseControl extension. adjustCruiseSpeed changes the setpoint by ±1 km/h or ±1 mph (depending on uiUnitLength), expressed in m/s.
- registerMenu is obsolete: it writes an error log and does nothing; use addEntry.
- updateGFX is only active during the reload delay; it is set to nil otherwise (extensions.hookUpdate).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_quickAccess.addEntry(_args)` | Adds (or replaces via uniqueID) a menu entry for this vehicle. | 20 |
| `core_quickAccess.adjustCruiseSpeed(direction)` | Increases or decreases the cruise control setpoint by one step (1 km/h or 1 mph) if the cruiseControl extension is loaded. | 181 |
| `core_quickAccess.onExtensionLoaded()` | Called at load: adds the base categories of the vehicle menu (driving aids, lighting, quick actions, vehicle features, cruise control). *(internal)* *(hook)* | 305 |
| `core_quickAccess.onInit()` | Vehicle initialization hook: declares the cruise control entries if there are driven wheels. *(internal)* *(hook)* | 188 |
| `core_quickAccess.registerMenu()` | Obsolete: writes an error in the log (use addEntry). | 333 |
| `core_quickAccess.requestItems(level)` | Interface for the GE: generates the full tree (runs the generators) and returns it to the GE via core_quickAccess.vehicleItemsCallback. | 102 |
| `core_quickAccess.selectItem(id, buttonDown, actionIndex)` | Interface for the GE: runs the action of an entry designated by its id depending on whether the button is pressed or released and on the action index (1 primary, 2 secondary, 3 tertiary). The result is returned to the GE via vehicleItemSelectCallback. | 135 |
| `core_quickAccess.updateGFX(dt)` | Temporary loop (nil value at rest) that counts 2 frames before notifying the GE of a 'reload' request. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `core_quickAccess.addEntry(_args)`

Adds (or replaces via uniqueID) a menu entry for this vehicle.

- `_args` (*table*) : Description of the entry (see notes).
- **returns**: boolean true if added, false if the level is invalid.

#### `core_quickAccess.adjustCruiseSpeed(direction)`

Increases or decreases the cruise control setpoint by one step (1 km/h or 1 mph) if the cruiseControl extension is loaded.

- `direction` (*number*) : Positive to increase, negative to decrease (0 and non-numbers are ignored).

#### `core_quickAccess.requestItems(level)`

Interface for the GE: generates the full tree (runs the generators) and returns it to the GE via core_quickAccess.vehicleItemsCallback.

- `level` (*string*) : Requested level (the GE receives the full tree and the level).
- **returns**: boolean Always true.

#### `core_quickAccess.selectItem(id, buttonDown, actionIndex)`

Interface for the GE: runs the action of an entry designated by its id depending on whether the button is pressed or released and on the action index (1 primary, 2 secondary, 3 tertiary). The result is returned to the GE via vehicleItemSelectCallback.

- `id` (*string*) : Identifier generated by requestItems.
- `buttonDown` (*boolean*) : true on press, false on release.
- `actionIndex` (*integer*) : 1, 2 or 3.
- **returns**: boolean|any true, or the result of itemSelectCallback in case of goto/error.

#### `core_quickAccess.updateGFX(dt)`

Temporary loop (nil value at rest) that counts 2 frames before notifying the GE of a 'reload' request. (dynamically assigned)

- `dt` (*number*) : Time step in seconds.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `updateGFX`

## Calls into the engine (C++)

- `obj:` `getId`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/core/quickAccess.lua`.*
