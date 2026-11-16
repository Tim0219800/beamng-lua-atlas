# `flowgraph_nodes_util_project`

*File: `lua/ge/extensions/flowgraph/nodes/util/project.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/project")` (file under extensions/ but not a regular extension)

Node "Get Project Info" (once_instant, event_note icon). Gives information about the current flowgraph project. Outputs: name, description, flow, and hidden pins id, hasFilename, filename (without .flow.json), filepath, hasLevel, level (level whose folder contains the project), graph, graphId.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Disables clearOutPinsOnStart. | 30 |
| `C:workOnce()` | Reads mgr.id/name/description, savedFilename/savedDir (via path.splitWithoutExt, path.levelFromPath) and the current graph, then writes the pins and activates flow. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/project.lua`.*
