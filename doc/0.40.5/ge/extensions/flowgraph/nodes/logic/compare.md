# `flowgraph_nodes_logic_compare`

*File: `lua/ge/extensions/flowgraph/nodes/logic/compare.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/compare")` (file under extensions/ but not a regular extension)

Flowgraph node 'Compare' (logic category). Compares inputs A and B (type any) with a comparison function chosen in the editor (list from getComparisonOps(), sorted by name). Outputs: flow, flow 'true', flow 'false' and the hidden bool 'value'. If A or B is nil for an operator other than == and ~=, an error event is logged and all outputs go to false.

## Notes

- In _onPropertyChanged the log comment references a nonexistent variable 'value', with no effect (commented-out line).
- If flow is not connected, pinOut.flow simply reflects the value of pinIn.flow.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Finds the comparison via opSymbol (or the old field data.comparisonFunc) then calls refreshFunction. | 79 |
| `C:_onPropertyChanged(key, val)` | Called when a property changes; reruns refreshFunction. | 70 |
| `C:_onSerialize(res)` | Saves opSymbol of the current comparison. | 75 |
| `C:drawCustomProperties()` | Properties panel: dropdown of comparison functions. | 38 |
| `C:drawMiddle(builder, style)` | Displays the operator symbol. | 114 |
| `C:init()` | Sorts the comparison operators by name and selects the first one by default. | 29 |
| `C:refreshFunction()` | Updates compFunc from the chosen comparison; if absent, installs an empty function and reports the error 'Invalid comparison'. | 59 |
| `C:work()` | Computes value = compFunc(A, B); flow follows the flow input, true = value, false = not value. nil case described above. | 97 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/compare.lua`.*
