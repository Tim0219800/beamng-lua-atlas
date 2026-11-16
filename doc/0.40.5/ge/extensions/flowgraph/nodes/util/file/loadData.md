# `flowgraph_nodes_util_file_loadData`

*File: `lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/file/loadData")` (file under extensions/ but not a regular extension)

Node "Load Data" (category once_instant, color file). Loads simple data from a file, reusable between sessions. Input: file (name without extension). The custom output pins (types string, number, bool, any, table, vec3, quat, color) carry the names of the keys read; each output receives the value of the key with the same name via modules.file:read.

## Notes

- The description of the file pin says "save into" but here it is the file to read.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Enables pin saving and custom output pins. | 33 |
| `C:onNodeReset()` | Forces the file to reload (modules.file:forceReload). | 48 |
| `C:workOnce()` | For each output pin (except flow), reads the corresponding value from the file. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua`.*
