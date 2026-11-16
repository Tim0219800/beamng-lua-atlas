# `flowgraph_nodes_ui_raceRecoveriesUsed`

*File: `lua/ge/extensions/flowgraph/nodes/ui/raceRecoveriesUsed.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/raceRecoveriesUsed")` (file under extensions/ but not a regular extension)

Flowgraph node "Set UI Race Recovery" (category repeat_instant, author BeamNG, duration): updates the recovery counter UI app (vehicle reset). Inputs: "cur" (number or string), "max". Text sent via 'RaceRecoveryCounterSet' (e.g. "Recoveries Used: 2 / 5"); reset with 'RaceRecoveryCounterReset'.

## Notes

- The text "Recoveries Used" is hardcoded (not translated).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Sends the counter if cur and the input flow are active, otherwise resets. | 25 |

**UI events (guihooks.trigger):** `RaceRecoveryCounterReset`, `RaceRecoveryCounterSet`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/raceRecoveriesUsed.lua`.*
