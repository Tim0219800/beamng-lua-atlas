# `flowgraph_nodes_util_loadProject`

*File: `lua/ge/extensions/flowgraph/nodes/util/loadProject.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/loadProject")` (file under extensions/ but not a regular extension)

Node "Load Project" (once_p_duration). Loads a flowgraph project by name (path relative to flowgraphEditor/, .flow.json extension optional) and runs it. Inputs: filepath, startNextFrame (starts on the next frame instead of immediately). When the parent project stops, the target project is stopped and deleted (data.destroyTargetOnStop, true by default).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Stops the target (setRunning(false)) and removes it on the next frame via core_flowgraphManager.removeNextFrame if destroyTargetOnStop. | 32 |
| `C:init(mgr, ...)` | Enables destroyTargetOnStop and clears the target. | 21 |
| `C:postInit()` | Restricts the file picker of the filepath pin to .flow.json files. | 25 |
| `C:workOnce()` | Resolves the path (tries the raw name, +.flow.json, flowgraphEditor/<name>.flow.json), loads the manager (core_flowgraphManager.loadManager) then starts it right away or on the next frame. | 41 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/loadProject.lua`.*
