# `flowgraph_nodes_gameplay_rally_loop_rallyExcludeTraffic`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Exclude Traffic" (category once_instant, tag rally). Applies (enable = true, default value) or clears (false) the traffic exclusion zones of the rally loop via rm:applyTrafficExclusion() / rm:clearTrafficExclusion().

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Applies or clears the traffic exclusion according to the enable pin. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic.lua`.*
