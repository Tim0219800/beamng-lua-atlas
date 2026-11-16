# `flowgraph_nodes_types_color`

*File: `lua/ge/extensions/flowgraph/nodes/types/color.lua` · VM: Game Engine (GE) · 118 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/color")` (file under extensions/ but not a regular extension)

Node "Color" (provider). Provides a color (RGBA table {r,g,b,a}, with 4 extra PBR values at indices 5-8 in custom mode) on the color pin. Modes: 'custom' (picker in the editor) or 'from Pin' (pins r, g, b, a of type number).

## Notes

- In 'from Pin' mode, the output is {r,g,b,a} without the PBR values.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores clr (padded to 8 values) and mode. | 84 |
| `C:_onSerialize(res)` | Saves the node's state in the given table. | 79 |
| `C:createColorPins()` | Creates the number input pins r, g, b, a. | 110 |
| `C:drawCustomProperties()` | Mode choice, creation/deletion of the r/g/b/a pins and color picker (editor.uiColorEdit8). | 26 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 106 |
| `C:init()` | clr = {1,1,1,1}, mode = 'custom', modes = {'custom','from Pin'}. | 20 |
| `C:work()` | Writes the color (from the pins in 'from Pin' mode, otherwise clr). | 98 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/color.lua`.*
