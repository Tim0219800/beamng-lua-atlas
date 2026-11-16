# `flowgraph_nodes_util_ghost`

*File: `lua/ge/extensions/flowgraph/nodes/util/ghost.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/ghost")` (file under extensions/ but not a regular extension)

Hidden node "GHOST" (category logic, hidden=true). Serves as a replacement when a flowgraph project references a node type that no longer exists: it keeps the original data (ghostData) so it is not lost on save, displays the original type and marks an error "Node ... doesn't exist!". Does nothing at runtime.

## Notes

- The displayed name is built with the %a+ pattern, so it keeps only the last group of letters of the type (digits split the word).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:__onSerialize()` | Returns the original data (ghostData) as is so that the node is saved again identically. | 34 |
| `C:_onDeserialized(nodeData)` | Records the error, stores the original type, renames the node "[GHOST]<last word of the type>" and keeps nodeData in ghostData. | 38 |
| `C:drawMiddle(builder, style)` | Draws the original node type and a "Dump ghost data" button that prints ghostData to the console. | 26 |
| `C:init()` | Initializes formerNodeType to "NOT GHOST". | 18 |
| `C:work()` | Does nothing. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/ghost.lua`.*
