# `flowgraph_nodes_career_garageComputerUtil`

*File: `lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/garageComputerUtil")` (file under extensions/ but not a regular extension)

Flowgraph node "Garage Computer Util" (category repeat_instant, ui color/icon), helper for the garage tutorial. One-frame output impulses: computerOpened (computer menu opened), tuningStarted, tuningApplied, shoppingStarted (parts shopping opened), partInstalled, transactionComplete.

## Notes

- The descriptions of the partInstalled and transactionComplete pins say "part shopping opened" (copy-paste in the game).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 28 |
| `C:onCareerTuningApplied()` | Hook: tuning applied. | 55 |
| `C:onCareerTuningStarted()` | Hook: tuning started. | 51 |
| `C:onComputerMenuOpened()` | Hook: garage computer menu opened. | 47 |
| `C:onPartShoppingPartInstalled(data)` | Hook: part installed. | 63 |
| `C:onPartShoppingStarted()` | Hook: parts shopping opened. | 59 |
| `C:onPartShoppingTransactionComplete()` | Hook: purchase transaction completed. | 67 |
| `C:work(args)` | Every frame: sets all outputs to false, applies the received flags then clears them. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua`.*
