# `flowgraph_nodes_gameplay_race_raceRequestRecovery`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Request Recovery" (category repeat_instant, tag scenario). Attempts to put the vehicle back on the last recovery point via race:requestRecover(vehId). Outputs (hidden): success if the recovery was possible, fail otherwise.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Every frame: calls requestRecover and fills success/fail. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery.lua`.*
