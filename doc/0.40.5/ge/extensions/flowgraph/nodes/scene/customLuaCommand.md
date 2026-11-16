# `flowgraph_nodes_scene_customLuaCommand`

*File: `lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/customLuaCommand")` (file under extensions/ but not a regular extension)

Flowgraph node "Custom Lua Command" (once_instant). Compiles with loadstring the Lua code received in the func pin then runs it with pcall. Outputs: flow (true if the call succeeded), return (any) value returned by the function. Useful for calling arbitrary code from a graph.

## Notes

- If the text does not compile, loadstring returns nil and pcall(nil) fails: flow will be false, return will contain the error message.
- Only the first return value is kept.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the return pin to nil when the graph starts. | 25 |
| `C:_onDeserialized(data)` | Compatibility: converts the old data.func into the hard-coded string pin 'func'. | 38 |
| `C:init()` | Disables clearing the output pins at start (clearOutPinsOnStart = false). | 21 |
| `C:workOnce()` | Compiles and runs the text of the func pin; writes flow = pcall success and return = returned value. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua`.*
