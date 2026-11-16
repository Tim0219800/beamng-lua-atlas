# `flowgraph_nodes_career_addToInventory`

*File: `lua/ge/extensions/flowgraph/nodes/career/addToInventory.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/addToInventory")` (file under extensions/ but not a regular extension)

Flowgraph node "Add To Inventory" (category once_instant, career color/icon). Adds the vehicle with the given id to the player's inventory via career_modules_inventory.addVehicle. Input: vehId (number). Sets a node error if the career module is not loaded or if no id is given. Copies the input flow to the output.

## Notes

- The inventory module exists only in career mode.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 22 |
| `C:workOnce()` | Adds the vehicle to the inventory or reports an error, then copies flow to the output. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/addToInventory.lua`.*
