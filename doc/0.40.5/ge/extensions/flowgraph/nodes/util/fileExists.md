# `flowgraph_nodes_util_fileExists`

*File: `lua/ge/extensions/flowgraph/nodes/util/fileExists.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/fileExists")` (file under extensions/ but not a regular extension)

Node "File Exists" (category once_p_duration). Checks that a file exists. Inputs: file (path or name), extension (hidden, appended to the name). Outputs: exists and missing (flow), existsBool (bool), path (absolute path). Uses mgr:getRelativeAbsolutePath, which resolves the path relative to the project.

## Notes

- The description of the missing pin says "If the file exists" (copy-paste) while it signals that the file is absent.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Builds the name, resolves the absolute path via mgr:getRelativeAbsolutePath and writes exists, missing, existsBool and path. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/fileExists.lua`.*
