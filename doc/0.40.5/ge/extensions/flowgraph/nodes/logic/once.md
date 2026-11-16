# `flowgraph_nodes_logic_once`

*File: `lua/ge/extensions/flowgraph/nodes/logic/once.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/once")` (file under extensions/ but not a regular extension)

Flowgraph node 'Once' (logic category, behaviour once). Lets the flow through only once (output impulse); the impulse pin 'reset' rearms it. The state is reset when execution stops.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Rearms the node (ready = true). | 27 |
| `C:init(mgr, ...)` | ready = true. | 23 |
| `C:work(args)` | If reset: rearms and output false. Otherwise, if ready and input flow: output true once then ready=false; in all other cases output false. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/once.lua`.*
