# `flowgraph_nodes_gameplay_rally_rallyRouteData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyRouteData.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyRouteData")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Route Data" (category repeat_instant, tag rally). Reads the rally manager (gameplay_rally.getRallyManager()) and publishes in nextRoutePointPos (vec3) the recovery destination position (rm:getRecoveryDestinationPos()). Also copies flow to the output.

## Notes

- The pin description talks about the "next route point ahead of the vehicle" but the code returns getRecoveryDestinationPos().

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame: updates nextRoutePointPos from the rally manager and copies the flow. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyRouteData.lua`.*
