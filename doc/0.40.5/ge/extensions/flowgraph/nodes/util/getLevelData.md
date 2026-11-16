# `flowgraph_nodes_util_getLevelData`

*File: `lua/ge/extensions/flowgraph/nodes/util/getLevelData.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/getLevelData")` (file under extensions/ but not a regular extension)

Node "Get Level Data" (once_instant). Gives information about the current level based on getMissionFilename(): level folder name (devName), directory (directory, hidden) and full path (path, hidden). No input.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Splits the mission file path (path.split) and writes devName, directory and path as strings. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/getLevelData.lua`.*
