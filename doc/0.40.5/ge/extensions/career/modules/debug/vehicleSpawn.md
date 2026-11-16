# `career_modules_debug_vehicleSpawn`

*File: `lua/ge/extensions/career/modules/debug/vehicleSpawn.lua` · VM: Game Engine (GE) · 131 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_vehicleSpawn`: `extensions.load("career_modules_debug_vehicleSpawn")`, then the global `career_modules_debug_vehicleSpawn`

"Vehicle Spawn" debug tool: adds a point-of-interest marker to the 'debugParking' parking of west_coast_usa (facilities.sites.json) whose detail window offers to spawn a 'rented' vehicle or trailer (sunburst/race_M, boxutility/loaded_200), optionally added to the inventory (owned = false). spawnVehicle chains fade to black, spawn, initPartConditions, wait, then fade back in via util_stepHandler.

## Example

```lua
career_modules_debug_vehicleSpawn.spawnVehicle('boxutility', 'loaded_200', true)
```

## Notes

- Depends on gameplay_sites_sitesManager.
- The path /levels/west_coast_usa/facilities.sites.json is hardcoded: the tool only works on this map.
- buttonPressed calls buttonOptions[i], a table that is never filled in this file (the buttons go through luaCallback).

**Dependencies (loaded first):** `gameplay_sites_sitesManager`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_vehicleSpawn.buttonPressed(i)` | Runs buttonOptions[i](); this table is never filled in the module. *(internal)* | 81 |
| `career_modules_debug_vehicleSpawn.drawDebugMenu()` | On the first frame loads the west_coast_usa sites and gets 'debugParking'; draws the 'Vehicle Spawn' window with a 'Spawn and rent a vehicle' button (sunburst/race_M, added to the inventory). *(internal)* | 30 |
| `career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI list hook: if the 'debugParking' parking is loaded, adds a 'debugVehicleSpawn' element with a parking marker (path, pos, rot, scl). *(internal)* *(hook)* | 15 |
| `career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData)` | Hook: if the element is 'debugVehicleSpawn', adds to promptData an 'Open Debug Menu' button that shows a dialog (guihooks 'showConfirmationDialog') with three spawn choices. *(internal)* *(hook)* | 85 |
| `career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory)` | Spawns a vehicle with a fade to black, initializes its part conditions, waits for the vehicle's response (ping) then fades back in; if addToInventory is true, adds it to the inventory with owned = false. | 48 |

### Parameter details

#### `career_modules_debug_vehicleSpawn.buttonPressed(i)`

Runs buttonOptions[i](); this table is never filled in the module.

- `i` (*integer*) : Button index.

#### `career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI list hook: if the 'debugParking' parking is loaded, adds a 'debugVehicleSpawn' element with a parking marker (path, pos, rot, scl).

- `levelIdentifier` (*string*) : Level identifier.
- `elements` (*table[]*) : POI list to complete.

#### `career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData)`

Hook: if the element is 'debugVehicleSpawn', adds to promptData an 'Open Debug Menu' button that shows a dialog (guihooks 'showConfirmationDialog') with three spawn choices.

- `elemData` (*table[]*) : POI elements concerned.
- `promptData` (*table[]*) : Prompt button list to complete.

#### `career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory)`

Spawns a vehicle with a fade to black, initializes its part conditions, waits for the vehicle's response (ping) then fades back in; if addToInventory is true, adds it to the inventory with owned = false.

- `model` (*string*) : JBeam model (e.g. 'sunburst').
- `config` (*string*) : Configuration name (e.g. 'race_M').
- `addToInventory` (*boolean|nil*) : Adds the vehicle to the inventory (not owned).

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicle Spawn'. |
| `debugOrder` | number | Sort order (12). |
| `dependencies` | string[] | {"gameplay_sites_sitesManager"}. |

**UI events (guihooks.trigger):** `showConfirmationDialog`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

**Loads extensions:** `util_stepHandler`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/vehicleSpawn.lua`.*
