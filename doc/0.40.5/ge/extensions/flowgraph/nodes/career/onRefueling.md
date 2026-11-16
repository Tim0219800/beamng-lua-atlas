# `flowgraph_nodes_career_onRefueling`

*File: `lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onRefueling")` (file under extensions/ but not a regular extension)

Flowgraph node "On Refueling" (category repeat_instant, ui color/icon). Detects career refueling events. Outputs: openedMenu, tankFilled, paidPrice, closedMenu (one-frame impulses), currentlyFueling (flow while filling is in progress, via career_modules_fuel.isCurrentlyFueling) and tankPercent (number, current energy / max energy summed over all tanks).

## Notes

- tankPercent is not updated if getFuelData() returns nil (keeps its last value); division by max without protection if max is 0.
- Uses career_modules_fuel: requires career.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 26 |
| `C:onPaidRefuelling(data)` | Hook: raises paidPrice. | 66 |
| `C:onRefuelingEndTransaction()` | Hook: raises closedMenu. | 70 |
| `C:onRefuelingStartTransaction(data)` | Hook: raises openedMenu. | 54 |
| `C:onRefuelingStopFueling(data)` | Hook: raises tankFilled. | 58 |
| `C:work(args)` | Every frame: sets the flow pins back to false, applies the flags, updates currentlyFueling and tankPercent, clears the flags. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua`.*
