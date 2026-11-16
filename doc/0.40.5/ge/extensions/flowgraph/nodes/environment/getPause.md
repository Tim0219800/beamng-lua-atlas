# `flowgraph_nodes_environment_getPause`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getPause.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getPause")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Pause" (category provider, author BeamNG, tags pause/freeze/halt/stop/interrupt). Outputs a bool "value" indicating whether the simulation is paused (simTimeAuthority.getPause()).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, writes the pause state to the value output. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getPause.lua`.*
