# `flowgraph_nodes_logic_select`

*File: `lua/ge/extensions/flowgraph/nodes/logic/select.lua` · VM: Game Engine (GE) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/select")` (file under extensions/ but not a regular extension)

Flowgraph node 'Select' (logic category). Chooses a value among N inputs value_i according to the active select_i flow pins, and combines the selected values with a merge function (fg_utils.mergeFuns.any: 'first' mode by default). If the input flow pin is not connected, the value is not kept. The number of choices is set in the properties.

## Notes

- updatePins tests lnk.sourcePin whereas select_i/value_i are input pins (targetPin): the links to the removed pins are therefore not deleted.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 38 |
| `C:_onDeserialized(res)` | Reads back mode ('first' by default) and count, recreates the pins. | 128 |
| `C:_onSerialize(res)` | Saves mode and count. | 123 |
| `C:drawCustomProperties()` | Panel: number of choices (Count) and dropdown of merge functions (excluding 'readOnly') with tooltip. | 42 |
| `C:drawMiddle(builder, style)` | Displays the merge mode. | 32 |
| `C:init()` | count=1, mode='first'. | 27 |
| `C:updatePins(old, new)` | Creates or deletes the select_i / value_i pin pairs and the associated links. | 74 |
| `C:work()` | Initializes the merge, merges the value_i whose select_i is active (if flow), finalizes. If at least one choice: flow=true and value=result; otherwise flow follows the input and value=nil. | 100 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/select.lua`.*
