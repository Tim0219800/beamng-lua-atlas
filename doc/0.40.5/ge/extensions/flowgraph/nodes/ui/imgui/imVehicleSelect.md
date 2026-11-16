# `flowgraph_nodes_ui_imgui_imVehicleSelect`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/imVehicleSelect")` (file under extensions/ but not a regular extension)

Flowgraph node "im Vehicle Selector" (category once_instant, tags imgui/vehicle/config): imgui vehicle selection window based on editor/util/vehicleSelectUtil. Outputs: "selected" (flow after the Select button), "model", "config", "configPath" and, hidden, "paintName1/2/3". Options in data: enableConfigs (true), enablePaints (false), enableCustomConfig (false).

## Notes

- The window is 480 x 300 px.
- The "selected" flow is reset to false only when the node is reset.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Creates the selection utility with the data options. | 33 |
| `C:displayWindow()` | Draws the "Vehicle Select" window (widget, Select and Reset buttons) and updates the outputs. | 48 |
| `C:drawMiddle(builder, style)` | Empty central area. | 44 |
| `C:init()` | Default data options. | 27 |
| `C:onNodeReset()` | Closes the window and resets selected to false. | 79 |
| `C:work()` | Displays the window if open. | 90 |
| `C:workOnce()` | Opens the window. | 85 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua`.*
