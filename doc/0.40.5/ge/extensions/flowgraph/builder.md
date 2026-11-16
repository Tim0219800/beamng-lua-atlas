# `flowgraph_builder`

*File: `lua/ge/extensions/flowgraph/builder.lua` · VM: Game Engine (GE) · 440 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/builder")` (file under extensions/ but not a regular extension)

Node builder of the flowgraph editor (ongoing Lua port of a C++ class from the imgui-node-editor blueprints example). It organizes the drawing of a node in stages (begin, header, content, input, middle, output, end), measures the ImGui groups of each area, draws the header texture and aligns the node width to the 14-pixel grid. Used by basenode:draw; of no interest outside the editor.

## Example

```lua
local builder = require('/lua/ge/extensions/flowgraph/builder')()
builder:Begin(node.id)
builder:Header(im.ImVec4(0.2,0.4,0.8,1)) ; im.TextUnformatted('Titre') ; builder:EndHeader()
builder:Input(pin) ; im.Text('in') ; builder:EndInput()
builder:Middle() ; im.Text('milieu')
builder:Output(pin) ; im.Text('out') ; builder:EndOutput()
builder:End(node)
```

## Notes

- The module returns a function: require(...)(options) creates an instance (the options table, if provided, becomes the object) and calls init().
- The state machine self.CurrentStage is 'invalid' outside drawing. SetStage opens/closes the ImGui groups and IDs and measures leftPinSize, centerSize, rightPinSize, HeaderRect, ContentRect, NodeRect.
- Bug: createRect().is_empty uses the global variables w and h (nil) instead of res.w/res.h; it always returns false.
- C:init pushes styles (NodeBorder, NodeRounding) on ui_flowgraph_editor without popping them in the same function.
- drawDebug is true at initialization; basenode:draw then sets it according to the preference flowgraph.debug.viewMode == 'geometry'.
- Output width: the padding before the 'output' group rounds the node width to a multiple of 14 px and takes expectedHeaderWidth into account.

## Class `C`

Builder instance created by require('...flowgraph/builder')(opts).

The module returns a constructor: `local obj = require("flowgraph_builder")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:Begin(nodeID)` | Begins a node: resets the header, pushes NodePadding, calls BeginNode and moves to the 'begin' stage. | 55 |
| `C:BeginPinDynamic(pin)` | Calls Input or Output according to pin.direction ('in' or 'out'). | 156 |
| `C:End(node)` | Ends the node: moves to the 'end' stage, calls node:customDrawEnd(self) if it exists, EndNode, draws the rounded header texture, the separator line and the debug rectangles, then returns to 'invalid'. | 68 |
| `C:EndHeader()` | Closes the header and moves to the 'content' stage. | 133 |
| `C:EndInput()` | Ends the current input pin (EndPin). | 151 |
| `C:EndOutput()` | Ends the current output pin (EndPin). | 193 |
| `C:EndPin()` | Calls ui_flowgraph_editor.EndPin(). | 406 |
| `C:EndPinDynamic(pin)` | Calls EndInput or EndOutput according to pin.direction. | 164 |
| `C:Header(color)` | Opens the header area with the given color. | 128 |
| `C:Input(pin)` | Opens (if needed) the inputs area and begins an input pin. | 137 |
| `C:Middle()` | Moves to the 'middle' stage (central area of the node, for drawMiddle). | 172 |
| `C:Output(pin)` | Opens (if needed) the outputs area and begins an output pin. | 179 |
| `C:Pin(pin, kind)` | Calls ui_flowgraph_editor.BeginPin(pin.id, kind). | 386 |
| `C:SetStage(stage)` | Changes the drawing stage: closes the groups of the old stage while measuring their rectangles, then opens those of the new one. For 'output', adds padding to round to the grid. | 206 |
| `C:expectOutPinWidth(width)` | Stores the expected width of the output pins, used to align the node to the grid. | 198 |
| `C:init()` | Initializes the state (stage 'invalid', sizes at 0, header texture art/imgui_node_header_alt.png) and pushes the NodeBorder/NodeRounding styles. | 36 |
| `C:makeAlignmentPin(pin)` | Draws a dummy input pin (12 px high dummy) used to align nodes that have no visible input. | 417 |
| `C:setExpectedHeaderSize(width)` | Stores the expected width of the header (text + icons). | 202 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/builder.lua`.*
