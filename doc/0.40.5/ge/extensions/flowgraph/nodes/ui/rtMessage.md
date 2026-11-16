# `flowgraph_nodes_ui_rtMessage`

*File: `lua/ge/extensions/flowgraph/nodes/ui/rtMessage.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/rtMessage")` (file under extensions/ but not a regular extension)

Flowgraph node "RT Message" (category repeat_instant, tags ui/text): displays a real-time message ('ScenarioRealtimeDisplay' hook). Inputs: "message" (any or translationObject table {txt, context}), "clear" (pulse). The message must be cleared manually; it is also cleared when the graph stops.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Clears the real-time message. | 25 |
| `C:init()` | Empty. | 22 |
| `C:work()` | Clears or displays the message depending on 'clear' and the input flow. | 30 |

**UI events (guihooks.trigger):** `ScenarioRealtimeDisplay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/rtMessage.lua`.*
