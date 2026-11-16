# `flowgraph_nodes_career_garageTutorialUtil`

*File: `lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/garageTutorialUtil")` (file under extensions/ but not a regular extension)

Flowgraph node "Garage Tutorial Util" (category repeat_instant, ui color/icon), helper for the garage tutorial. Bool outputs: parkedInGarage (an inventory vehicle is in the nearest garage and its speed is < 0.25 m/s) and isRepaired (the player's vehicle does not need repair according to insurance). Every second of simulated time, updates the part state of the player's vehicle (not when on foot).

## Notes

- Uses career_modules_inventory and career_modules_insurance_insurance: requires career.
- The code reads map.objects[objId] without a nil check.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Timer at 0 when the graph starts. | 24 |
| `C:init()` | Timer at 0. | 20 |
| `C:work(args)` | Every frame: computes parkedInGarage and isRepaired; every second, calls career_modules_inventory.updatePartConditions for the player's vehicle if they are not walking. | 28 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua`.*
