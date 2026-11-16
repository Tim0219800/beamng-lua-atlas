# `flowgraph_nodes_logic_bundle`

*File: `lua/ge/extensions/flowgraph/nodes/logic/bundle.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/bundle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Bundle' (logic category). Simply copies the input flow to the output; only used to visually group links for graph readability.

## Notes

- Uses C.type = 'simple' (the other nodes use C.category).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | pinOut.flow = pinIn.flow. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/bundle.lua`.*
