# `flowgraph_nodes_logic_sequencer`

*File: `lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua` · VM: Game Engine (GE) · 186 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/sequencer")` (file under extensions/ but not a regular extension)

Flowgraph node 'Sequencer' (logic category). Activates the flow outputs value_1..value_N in turn. Increment mode 'auto' (+1 per frame), 'manual' (pins next/reset/count) or 'select' (pin index). Sequence mode: loop, random, once (pingpong is defined but not offered). Hidden outputs currentIndex, maxIndex, totalIndex.

## Notes

- The C.todo field in the code notes that the index starts at 2 in auto mode.
- In work, 'self.mode == manual' is tested whereas 'manual' is an increment mode: self.pinIn.count is therefore never used and c = self.count.
- In pingpong mode with count=1, modulo 0 (not offered in the UI).
- updatePins does not delete the links of the removed pins.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | index = 0. | 45 |
| `C:_onDeserialized(res)` | Reads back the settings, recreates the pins and the mode. | 140 |
| `C:_onSerialize(res)` | Saves mode, count, incMode. | 134 |
| `C:drawCustomProperties()` | Panel: increment mode, sequence mode (except select), number of outputs. | 70 |
| `C:drawMiddle(builder, style)` | Displays the mode and the current index. | 179 |
| `C:init()` | count=1, mode='loop', incMode='auto', index=1. | 38 |
| `C:updateMode(m)` | Adds/deletes the input pins according to the increment mode (index for select; next, reset, count for manual). | 50 |
| `C:updatePins(old, new)` | Creates or deletes the flow outputs value_i. | 117 |
| `C:work()` | Updates the index according to the increment mode, computes the active output, sets value_i to (i == active), writes currentIndex, maxIndex, totalIndex; flow equals the input flow. | 148 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua`.*
