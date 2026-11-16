# `flowgraph_nodes_util_file_saveData`

*File: `lua/ge/extensions/flowgraph/nodes/util/file/saveData.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/file/saveData")` (file under extensions/ but not a regular extension)

Node "Save Data" (once_instant, color file). Saves simple data to a file reusable between sessions. Input: file (name without extension); the custom input pins (types string, number, bool, any, table, vec3, quat, color) are written as keys of the file via modules.file:write.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Enables pin saving and custom input pins. | 33 |
| `C:workOnce()` | Writes to the file the value of each input pin except flow, reset and file. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/file/saveData.lua`.*
