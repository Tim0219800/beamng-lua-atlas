# `flowgraph_nodes_gameplay_race_raceSuspend`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceSuspend.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceSuspend")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Suspend" (tag scenario, no category defined). Suspends or resumes a race: flow on the suspend pin calls raceData:doSuspend(true), flow on resume calls doSuspend(false) (suspend takes priority). The flow output is always true.

## Notes

- The three input pins flow, suspend and resume have the same description "Inflow for this node.".

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 23 |
| `C:work()` | Suspends or resumes the race according to the suspend/resume pins. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceSuspend.lua`.*
