# `flowgraph_nodes_thread_loadProject`

*File: `lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/thread/loadProject")` (file under extensions/ but not a regular extension)

Node "Load Project" (once_p_duration). Loads a flowgraph (.flow.json) by path and starts it as a child project via self.mgr.modules.thread:startProjectFromFilepath. Input: path (string); output: id (number) of the started project, usable with Send/Receive Message.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets targetId to nil. | 33 |
| `C:_executionStopped()` | Resets targetId to nil. | 37 |
| `C:init(mgr, ...)` | Initializes targetId. | 23 |
| `C:postInit()` | Restricts path to "Flowgraph Files" (.flow.json). | 27 |
| `C:workOnce()` | Resolves the path (with or without the .flow.json extension), starts the project and writes its id. | 41 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua`.*
