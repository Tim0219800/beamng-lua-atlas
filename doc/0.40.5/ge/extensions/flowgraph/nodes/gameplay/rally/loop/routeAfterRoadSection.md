# `flowgraph_nodes_gameplay_rally_loop_routeAfterRoadSection`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection.lua` · VM: Game Engine (GE) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Route After Road Section" (category once_instant, tag rally). Routes the flow after a road section according to the current mission of the rally loop schedule: toServiceIn if rm:getCurrentMissionId() is 'serviceIn', otherwise toSpecialStage. If there is no current mission, a warning is logged and no output is activated.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Activates toServiceIn or toSpecialStage according to the id of the current mission. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection.lua`.*
