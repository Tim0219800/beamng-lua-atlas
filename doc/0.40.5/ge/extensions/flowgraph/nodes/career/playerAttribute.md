# `flowgraph_nodes_career_playerAttribute`

*File: `lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/playerAttribute")` (file under extensions/ but not a regular extension)

Flowgraph node "Add Or Remove Player Attribute" (category once_instant, career color/icon). Adds or removes an amount of a player attribute (default "money") in the current career save slot, via career_modules_playerAttributes.addAttributes. Inputs: add (bool, true = add, default true), amount (number, default 0), playerAttribute (string, default 'money'), reason (string, log text; otherwise key "ui.career.attributeLog.unknownFlowgraphReason"). Acts only in career and only once until reset.

## Notes

- The internal flag prevents a second application until the node is reset (reset pin or onNodeReset).
- The pin descriptions talk about money ("money") even though the attribute is configurable.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls onNodeReset when the graph starts. | 30 |
| `C:onNodeReset()` | Sets the applied flag back to false. | 26 |
| `C:work()` | If career is active and not yet applied, adds amount (signed according to add) to the attribute and marks it applied; resets if the reset pin is active. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua`.*
