# `flowgraph_nodes_debug_debugText`

*File: `lua/ge/extensions/flowgraph/nodes/debug/debugText.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/debugText")` (file under extensions/ but not a regular extension)

Flowgraph node "Debug Text" (category repeat_instant, tags util/draw). Draws 3D text at a position (debugDrawer:drawTextAdvanced) every frame. Inputs: pos (vec3), text (any, converted by tostring), colorText (hidden, white by default), colorBG (hidden, semi-transparent black {0,0,0,0.75} by default).

## Notes

- No test on pos: vec3(nil) is built if the pin is empty.
- Colors are read with 4 components with no default value for alpha.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 24 |
| `C:work()` | Builds the colors (ColorF text, ColorI background *255) and draws the text. | 27 |

## Calls into the engine (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/debugText.lua`.*
