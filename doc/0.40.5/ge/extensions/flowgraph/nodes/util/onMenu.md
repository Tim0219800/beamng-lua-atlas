# `flowgraph_nodes_util_onMenu`

*File: `lua/ge/extensions/flowgraph/nodes/util/onMenu.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/onMenu")` (file under extensions/ but not a regular extension)

Node "On Menu" (repeat_instant). Detects the opening of an interface menu (Escape menu), based on core_input_bindings.getMenuActionMapEnabled() and the absence of loading. Input: reset (pulse). Outputs: open, close (flow), onOpened and onClosed (pulses, hidden), openOrClosed (bool, hidden).

## Notes

- Leaves debug prints ("OnMenu Debug") on every state change.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls reset. | 29 |
| `C:reset()` | Resets the previous state to "none": the next frame will emit a pulse. | 25 |
| `C:work()` | Computes the open/closed state and writes open, close, openOrClosed; emits the onOpened or onClosed pulse on state change, then resets them to false on the next frame. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/onMenu.lua`.*
