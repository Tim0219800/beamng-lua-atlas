# `flowgraph_nodes_gameplay_rally_loop_getCurrentRacePath`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Get Current Race Path" (category once_instant, tag rally). Reads rm:getCurrentRacePath() from the rally loop manager and places it in the racePath pin (string): path of the race file of the current mission in the schedule, or empty string if unavailable.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Writes the current race path (or '') to racePath. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath.lua`.*
