# `flowgraph_nodes_logic_and`

*File: `lua/ge/extensions/flowgraph/nodes/logic/and.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/and")` (file under extensions/ but not a regular extension)

Flowgraph node 'And' (logic category). Only lets the flow through if all flow_1..flow_N inputs have flow. 2 inputs by default, the number is adjustable in the node properties (flow_i pins created/deleted dynamically). Output: flow pin. Runs every frame the graph is active.

## Notes

- legacyPins: former inputs a and b renamed flow_1 and flow_2.
- The C.todo field in the code plans an arbitrary number of inputs, already done via the Count property.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Reads count back (2 by default) and recreates the corresponding pins. | 84 |
| `C:_onSerialize(res)` | Saves count in the serialized data. | 80 |
| `C:drawCustomProperties()` | Editor properties panel: integer field 'Count' that changes the number of input pins (minimum 1). Returns the reason for the change. | 33 |
| `C:init()` | Initializes the input counter to 2. | 30 |
| `C:updatePins(old, new)` | Adds or deletes the flow_i input pins to go from old to new; also deletes the links that pointed to the removed pins. | 50 |
| `C:work()` | Sets the flow output to true only if all flow_1..flow_count inputs are true, otherwise false. | 71 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/and.lua`.*
