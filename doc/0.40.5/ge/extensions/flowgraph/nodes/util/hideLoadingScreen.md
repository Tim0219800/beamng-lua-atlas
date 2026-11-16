# `flowgraph_nodes_util_hideLoadingScreen`

*File: `lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/hideLoadingScreen")` (file under extensions/ but not a regular extension)

Node "Hide Loading Screen" (once_instant). Hides the loading screen after a level has loaded (useful with "Load Level" in customLoadingScreen mode). Has no effect if no level is loading. Output: finished (flow).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Disables clearOutPinsOnStart. | 20 |
| `C:work()` | Sets finished to true as soon as modules.level is no longer loading a level. | 34 |
| `C:workOnce()` | Sets finished to false, calls modules.level:finishedLevelLoading() and server.fadeoutLoadingScreen(true). | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua`.*
