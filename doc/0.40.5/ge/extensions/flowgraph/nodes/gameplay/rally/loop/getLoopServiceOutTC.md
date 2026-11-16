# `flowgraph_nodes_gameplay_rally_loop_getLoopServiceOutTC`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop Get Service Out TC" (category once_instant, tag rally). Returns the position (pos, vec3) and rotation (rot, quat) of the service park exit time control (TC), via rm:getServiceOutTCPos() and rm:getServiceOutTCRot() of the rally loop manager.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Writes pos and rot from the rally loop manager (nothing if absent, error logged). | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC.lua`.*
