# `flowgraph_nodes_ui_flashMessage`

*File: `lua/ge/extensions/flowgraph/nodes/ui/flashMessage.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/flashMessage")` (file under extensions/ but not a regular extension)

Flowgraph node "Flash Message" (category repeat_instant, duration): displays a message in the center of the screen via scenario/scenariohelper.flashUiMessage. Inputs: flow, "message" (any), "duration" (3 s), "instant" (hidden, clears previous ones), "biggerText" (hidden, true). Output: flow. Requires a UI layout that contains the messages app.

## Notes

- Tables are passed as is, everything else is converted with tostring.
- work() returns the message on every frame where the flow is active.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Loads scenario/scenariohelper. | 25 |
| `C:work()` | If 'instant', sends 'ScenarioFlashMessageClear', then displays the message and copies the input flow to the output. | 29 |

**UI events (guihooks.trigger):** `ScenarioFlashMessageClear`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/flashMessage.lua`.*
