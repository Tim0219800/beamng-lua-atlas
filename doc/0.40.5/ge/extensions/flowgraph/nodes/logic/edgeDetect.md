# `flowgraph_nodes_logic_edgeDetect`

*File: `lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/edgeDetect")` (file under extensions/ but not a regular extension)

Flowgraph node 'Edge Detector' (logic category). Lets the flow through (for one frame) when the value of the 'signal' pin changes compared to the previous frame. For numbers (and table elements), the change must exceed the 'threshold' pin (default 0). If the type changes, there is always flow. The last value is kept in self.lastSignal.

## Notes

- For numbers: change if |signal - last| > threshold; if threshold is nil, the code uses 0.0001 (but the pin defaults to 0).
- In the table comparison, the 'elseif v ~= self.lastSignal' branch compares the element to the whole table (probably a typo for self.lastSignal[i]), so it is always true for non-numeric elements.
- No reset of lastSignal when execution starts.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays the last stored value (dumpsz). | 58 |
| `C:work()` | Compares signal to lastSignal (numbers with threshold, tables element by element, other types by equality), sets pinOut.flow to true on change, then stores the signal. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua`.*
