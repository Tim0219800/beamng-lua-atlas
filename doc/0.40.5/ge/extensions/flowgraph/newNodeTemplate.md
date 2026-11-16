# `flowgraph_newNodeTemplate`

*File: `lua/ge/extensions/flowgraph/newNodeTemplate.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/newNodeTemplate")` (file under extensions/ but not a regular extension)

Starting template for writing a new flowgraph node (name "New Node Template"). It shows how to declare name, description, color/icon/category/tags (in comments) and a C.pinSchema containing an example input and output pin for each type: flow, number, bool, string, vec3, quat, color, table, any and a multi-type pin ({'number','bool'}). The work() method is empty. To be copied by a modder, not used in game.

## Notes

- Output pins of type table declare tableType = 'generic'.
- Default values shown: number 42, bool true, string 'Text', vec3 {1,2,3}, quat {0,0,0,1}, color {1,1,1,0.5}.
- The file ends with return _flowgraph_createNode(C).

## Class `C`

Template node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Called every frame the node is active; empty in the template. This is where you read the input pins (self.pinIn.x.value) and write the outputs. | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/newNodeTemplate.lua`.*
