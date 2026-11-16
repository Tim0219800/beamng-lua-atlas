# `flowgraph_nodes_gameplay_rally_loop_getRallyLoopTrafficEnabled`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Get Traffic Enabled" (category once_instant, tags rally and traffic). Indicates in trafficEnabled (bool) whether traffic must be enabled for the rally loop: rm:getTrafficEnabled() if available, otherwise true except for a dev mission (devMission) whose missionTypeData.devDisableTraffic is true.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Writes trafficEnabled from the loop manager, or the fallback value. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled.lua`.*
