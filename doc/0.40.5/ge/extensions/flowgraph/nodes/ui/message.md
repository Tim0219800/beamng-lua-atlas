# `flowgraph_nodes_ui_message`

*File: `lua/ge/extensions/flowgraph/nodes/ui/message.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/message")` (file under extensions/ but not a regular extension)

Flowgraph node "Message" (category once_instant by default, duration): displays a message in the small messages app via the 'Message' hook. Inputs: flow, "message" (any; nil clears), "duration" (5 s), "category" (flowgraph; only one message per category), "icon" (info, hidden). Output: flow.

## Notes

- The message is resent every 0.05 s while the flow is active, to stay displayed.
- Without a category, the identifier '__<node id>' is used.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Resets the timer to 0 if the input flow is cut. | 41 |
| `C:_executionStarted()` | Resets the timer to 0 and prepares the default category. | 28 |
| `C:_executionStopped()` | Clears the displayed message. | 33 |
| `C:drawCustomProperties()` | "Open Icons overview" button. | 47 |
| `C:work()` | Periodically resends the message to the UI and propagates the flow. | 55 |

**UI events (guihooks.trigger):** `Message`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/message.lua`.*
