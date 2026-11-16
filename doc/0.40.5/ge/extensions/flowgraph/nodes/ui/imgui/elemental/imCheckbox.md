# `flowgraph_nodes_ui_imgui_elemental_imCheckbox`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox")` (file under extensions/ but not a regular extension)

Flowgraph node "im Checkbox" (category repeat_instant, tag imgui): imgui checkbox. Inputs: "text", "enabled" (true), pulses "setOn" / "setOff". Outputs: "on", "off", "checked" (bool), "changed" (pulse). The initial state comes from data.startState (false).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Applies startState and updates the outputs again. | 32 |
| `C:init()` | data.startState = false. | 28 |
| `C:work()` | Applies setOn/setOff, draws the checkbox (disabled if enabled is false) and updates on/off/checked/changed. | 41 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox.lua`.*
