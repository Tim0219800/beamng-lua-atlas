# `career_modules_debug_vehicleDebug`

*File: `lua/ge/extensions/career/modules/debug/vehicleDebug.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_vehicleDebug`: `extensions.load("career_modules_debug_vehicleDebug")`, then the global `career_modules_debug_vehicleDebug`

"Vehicles" career debug tab. Lets you add the player vehicle to the inventory, respawn it (career_modules_inventory.debugRespawnCurrentVehicle), switch to an owned vehicle (enterVehicle) or sell it (sellVehicleFromInventory).

## Notes

- Development tool; debugOrder = 2.
- The sale happens after the display loop so the table is not modified while being iterated.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_vehicleDebug.drawDebugMenu()` | Draws the buttons to add/respawn the current vehicle, the current inventory vehicle and the list of owned vehicles with enter and sell buttons. *(internal)* | 9 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicles'. |
| `debugOrder` | number | Sort order (2). |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/vehicleDebug.lua`.*
