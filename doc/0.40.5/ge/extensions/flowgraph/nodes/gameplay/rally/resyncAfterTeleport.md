# `flowgraph_nodes_gameplay_rally_resyncAfterTeleport`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport.lua` · VM: Game Engine (GE) · 30 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Resync After Teleport" (category repeat_instant, tag rally). Clears the pacenotes' execution state and resynchronizes rally mode after a teleport or a reset, via gameplay_rally.getRallyManager():resyncAfterTeleport(). Copies flow to the output.

## Notes

- The resync is called every frame the node runs, not only on a pulse; enable it only when needed.
- The node does not check that gameplay_rally is loaded before calling getRallyManager.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls rm:resyncAfterTeleport() (error logged if there is no rally manager) and copies the flow. | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport.lua`.*
