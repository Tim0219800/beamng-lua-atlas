# `flowgraph_nodes_thread_sendMessage`

*File: `lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua` · VM: Game Engine (GE) · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/thread/sendMessage")` (file under extensions/ but not a regular extension)

Node "Send Message" (thread). Sends a message (table of the non-fixed input pins) to the flowgraph project with the given id (-1 = parent) via modules.thread:sendMessage, or sendNetworkedMessage if the networked pin is true. Sends only once until reset. Fixed pins: flow, reset, networked, id, name; output flow.

## Notes

- The name pin (message name) is fixed so it is not added to the message content.
- The result of sendMessage is not used.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | done = false. | 71 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 75 |
| `C:init()` | savePins = true, allowCustomInPins = true. | 41 |
| `C:work()` | On reset, done = false; otherwise, on flow with an id, assembles the non-fixed pins into a table and sends the message, then copies flow. | 47 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua`.*
