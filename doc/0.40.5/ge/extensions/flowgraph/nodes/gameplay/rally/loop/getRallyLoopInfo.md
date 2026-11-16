# `flowgraph_nodes_gameplay_rally_loop_getRallyLoopInfo`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop Get Info" (category once_instant, tag rally). Reads from the rally loop manager the name of the rally (rm:getRallyLoopName()) and the start and end screen texts of the mission (missionTypeData.startScreenText / endScreenText, "" by default). Outputs: name, startScreenText, endScreenText (string or translationObject table).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Writes name, startScreenText and endScreenText; error log if there is no manager. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo.lua`.*
