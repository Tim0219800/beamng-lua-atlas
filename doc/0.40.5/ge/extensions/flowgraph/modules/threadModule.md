# `flowgraph_modules_threadModule`

*File: `lua/ge/extensions/flowgraph/modules/threadModule.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/threadModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 1000) that lets a flowgraph project launch others (child projects) and exchange messages with them. Received messages are queued then distributed at the start of the next update (onFlowgraphManagerPreUpdate hook) to the nodes via broadcastCall. On stop, all launched children are stopped and removed.

## Notes

- A message with a hook field is broadcast as a call mgr:broadcastCall(message.hook, message.data); otherwise it is broadcast as 'onThreadMessageProcess'.
- targetId == -1 designates the parent (parentId); a root project has parentId = -1, so sending fails (returns false).
- startProjectFromFilepath prints a dump of the children list (dumpz).

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_threadModule.afterTrigger()` | Called after the graph tick (does nothing). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_threadModule.clear()` | Clears the children and the messages, sets parentId = -1 back. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_threadModule.executionStarted()` | Called when the project starts (does nothing). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_threadModule.executionStopped()` | Called when the project stops: immediately stops each child, removes them on the next frame, then calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_threadModule.init()` | Called when the module is created: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_threadModule.onFlowgraphManagerPreUpdate()` | Hook called before the managers update: broadcasts then clears the queue of received messages. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_threadModule.receiveMessage(message, sourceId)` | Adds a message to the receive queue and logs it. (dynamically assigned) | dyn |
| `flowgraph_modules_threadModule.sendMessage(targetId, message, sourceNode)` | Sends a message to the target manager (or to the parent if targetId is -1). Logs the send. (dynamically assigned) | dyn |
| `flowgraph_modules_threadModule.startProjectFromFilepath(file, sourceNode)` | Loads a flowgraph project from a file (core_flowgraphManager.loadManager), starts it, registers it as a child and gives it this manager as parent. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_threadModule.receiveMessage(message, sourceId)`

Adds a message to the receive queue and logs it. (dynamically assigned)

- `message` (*table*) : message
- `sourceId` (*integer*) : id of the sender manager

#### `flowgraph_modules_threadModule.sendMessage(targetId, message, sourceNode)`

Sends a message to the target manager (or to the parent if targetId is -1). Logs the send. (dynamically assigned)

- `targetId` (*integer*) : id of the target flowgraph manager, -1 for the parent
- `message` (*table*) : message (optional fields name, hook, data)
- `sourceNode` (*table|nil*) : sender node, for the log
- **returns**: boolean true if the target exists

#### `flowgraph_modules_threadModule.startProjectFromFilepath(file, sourceNode)`

Loads a flowgraph project from a file (core_flowgraphManager.loadManager), starts it, registers it as a child and gives it this manager as parent. (dynamically assigned)

- `file` (*string*) : project path
- `sourceNode` (*table|nil*) : originating node, for the log
- **returns**: integer id of the child manager

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:afterTrigger()` |  | 18 |
| `C:clear()` |  | 12 |
| `C:executionStarted()` |  | 74 |
| `C:executionStopped()` |  | 62 |
| `C:init()` |  | 8 |
| `C:onFlowgraphManagerPreUpdate()` |  | 32 |
| `C:receiveMessage(message, sourceId)` |  | 43 |
| `C:sendMessage(targetId, message, sourceNode)` |  | 21 |
| `C:startProjectFromFilepath(file, sourceNode)` |  | 49 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/threadModule.lua`.*
