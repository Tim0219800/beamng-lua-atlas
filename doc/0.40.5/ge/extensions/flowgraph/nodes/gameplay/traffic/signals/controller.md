# `flowgraph_nodes_gameplay_traffic_signals_controller`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua` · VM: Game Engine (GE) · 94 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/controller")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Signal Controller" (repeat_instant). Reads a traffic light controller (signalControllerData): signalType, stateCount, duration (totalDuration) and, for each state i (adjustable count), stateName_i and stateDuration_i ('none' and 0 if absent).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores the node's own settings from the saved data. | 74 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 70 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 32 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 24 |
| `C:postInit()` | Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys). | 28 |
| `C:updatePins(old, new)` | Adds or removes the stateName_i / stateDuration_i pins and deletes their links. | 50 |
| `C:work(args)` | Copies type, state count, total duration and the name/duration of each state to the outputs. | 79 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua`.*
