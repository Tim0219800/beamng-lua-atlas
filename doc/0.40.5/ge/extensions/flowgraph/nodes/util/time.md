# `flowgraph_nodes_util_time`

*File: `lua/ge/extensions/flowgraph/nodes/util/time.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/time")` (file under extensions/ but not a regular extension)

Node "Time" (category provider, no flow). Provides the current time. Outputs: time (os.clockhp(), high-precision clock), dtReal (real time between frames in s, ignores pause), dtSim (simulated time in s, 0 when paused, reduced in slow motion).

## Notes

- The description of the time pin says "Time since start of project" but the value is the absolute clock os.clockhp(), not the time since start.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Empty body. | 31 |
| `C:init(mgr, ...)` | Does nothing. | 22 |
| `C:work()` | Writes os.clockhp() to time and mgr.dtReal / mgr.dtSim to the other two outputs. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/time.lua`.*
