# `flowgraph_nodes_thread_receiveMessage`

*File: `lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua` · VM: Game Engine (GE) · 84 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/thread/receiveMessage")` (file under extensions/ but not a regular extension)

Node "Receive Message" (thread). Receives a message sent by another running flowgraph project (Send Message) and exposes its fields on custom output pins (pin names = message keys). Pins: flow, reset, isNetwork, name (filter), outputs flow, receiving (impulse), received. Only one message is consumed until reset.

## Notes

- The node's description says "Sends a message..." (copy of Send Message), whereas it receives.
- The name pin is only required to be non-nil: the code does not compare the message name (the "matches exactly" filter is not applied here).
- The isNetwork pin is not used.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | done = false. | 74 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 78 |
| `C:init()` | savePins = true, allowCustomOutPins = true. | 42 |
| `C:onThreadMessageProcess(message)` | Hook: stores the received message if it has not already been processed (done = false). | 47 |
| `C:work()` | On reset, resets to zero; otherwise, if a message is pending and name is given, copies its fields to the pins, activates receiving and received. | 55 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua`.*
