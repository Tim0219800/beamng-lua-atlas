# `flowgraph_nodes_events_onMissionEnded`

*File: `lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/events/onMissionEnded")` (file under extensions/ but not a regular extension)

Flowgraph node "on Level End" (category logic, event). Emits a flow pulse once when the current level is unloaded (onClientEndMission hook). Output pin: flow.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty. | 19 |
| `C:onClientEndMission()` | Hook called when the level is unloaded: sets flow to true and triggers the node. | 22 |
| `C:work(args)` | Empty. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/events/onMissionEnded.lua`.*
