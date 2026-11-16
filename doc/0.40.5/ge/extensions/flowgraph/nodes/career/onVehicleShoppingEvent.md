# `flowgraph_nodes_career_onVehicleShoppingEvent`

*File: `lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onVehicleShoppingEvent")` (file under extensions/ but not a regular extension)

Flowgraph node "On Vehicle Shopping Event" (category repeat_instant, ui color/icon). Detects career vehicle shopping events. Impulse outputs: openedMenu, closedMenu (also raised when returning to the game), vehicleSpawned (vehicle generated for inspection), openedDetail (detailed shopping menu), vehicleBought; plus vehId (number, id of the purchased vehicle) and testDriveActive (bool, career_modules_testDrive.isActive).

## Notes

- Uses career_modules_testDrive and career_modules_inventory: requires career.
- The descriptions of vehicleBought and vehId contain typos in the game ("buyign").
- vehId keeps its last value after the impulse.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 26 |
| `C:onUIPlayStateChanged(enteredPlay)` | Hook: raises closedMenu when the player returns to the game. | 64 |
| `C:onVehicleAddedToInventory(data)` | Hook: raises vehicleBought and converts data.inventoryId into a vehicle id (vehId). | 55 |
| `C:onVehicleShoppingMenuClosed()` | Hook: raises closedMenu. | 60 |
| `C:onVehicleShoppingMenuOpened(data)` | Hook: raises openedMenu. | 43 |
| `C:onVehicleShoppingPurchaseMenuOpened(data)` | Hook: raises openedDetail. | 51 |
| `C:onVehicleShoppingVehicleShown(data)` | Hook: raises vehicleSpawned. | 47 |
| `C:work(args)` | Every frame: sets five flow outputs back to false, applies and clears the flags, updates testDriveActive. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua`.*
