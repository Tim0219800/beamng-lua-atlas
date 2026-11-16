# `flowgraph_nodes_util_worldEditorOpen`

*File: `lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/worldEditorOpen")` (file under extensions/ but not a regular extension)

Node "World Editor Open" (repeat_instant). Indicates whether the world editor is open (editor.active). Input: reset (pulse). Outputs: open, close (flow), onOpened and onClosed (hidden pulses), openOrClosed (hidden bool).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls reset. | 29 |
| `C:reset()` | Resets the previous state to "none". | 25 |
| `C:work()` | Writes open/close/openOrClosed according to editor.active and emits an onOpened or onClosed pulse when the state changes compared to the previous frame. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua`.*
