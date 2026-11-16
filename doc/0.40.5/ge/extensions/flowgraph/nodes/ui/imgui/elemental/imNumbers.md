# `flowgraph_nodes_ui_imgui_elemental_imNumbers`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua` · VM: Game Engine (GE) · 126 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers")` (file under extensions/ but not a regular extension)

Flowgraph node "im Number" (category repeat_instant, tag imgui): imgui number field. Mode chosen in the properties: Int, Float, SliderInt, SliderFloat, DragInt, DragFloat. Inputs: "text", "set" (pulse: reapplies setVal), "setVal" (0), "min" (0), "max" (10), "step" (1), "format" (%0.2f), "power" (1). Outputs: "value" and "changed" (pulse).

## Notes

- The value is clamped to min/max even in free Int/Float mode.
- Without an initial value (setVal nil), nothing is drawn.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the outputs and the value. | 59 |
| `C:_onDeserialized(nodeData)` | Restores the mode (default 'Int'). | 120 |
| `C:_onSerialize(res)` | Saves the mode. | 116 |
| `C:drawCustomProperties()` | Edit mode combo. | 45 |
| `C:init()` | List of modes and mode = 'Int'. | 33 |
| `C:work()` | Draws the widget of the chosen mode, clamps the value and writes value/changed. | 66 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua`.*
