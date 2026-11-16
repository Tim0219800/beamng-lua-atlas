---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/builder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builder instance created by require('...flowgraph/builder')(opts).
---@class flowgraph_builder
local flowgraph_builder = {}

--- Begins a node: resets the header, pushes NodePadding, calls BeginNode and moves to the 'begin' stage.
---Source: lua/ge/extensions/flowgraph/builder.lua:55
---@param nodeID integer node id in the editor
function flowgraph_builder:Begin(nodeID) end

--- Calls Input or Output according to pin.direction ('in' or 'out').
---Source: lua/ge/extensions/flowgraph/builder.lua:156
---@param pin table pin with a direction field
function flowgraph_builder:BeginPinDynamic(pin) end

--- Ends the node: moves to the 'end' stage, calls node:customDrawEnd(self) if it exists, EndNode, draws the rounded header texture, the separator line and the debug rectangles, then returns to 'invalid'.
---Source: lua/ge/extensions/flowgraph/builder.lua:68
---@param node table flowgraph node being drawn
function flowgraph_builder:End(node) end

--- Closes the header and moves to the 'content' stage.
---Source: lua/ge/extensions/flowgraph/builder.lua:133
function flowgraph_builder:EndHeader() end

--- Ends the current input pin (EndPin).
---Source: lua/ge/extensions/flowgraph/builder.lua:151
function flowgraph_builder:EndInput() end

--- Ends the current output pin (EndPin).
---Source: lua/ge/extensions/flowgraph/builder.lua:193
function flowgraph_builder:EndOutput() end

--- Calls ui_flowgraph_editor.EndPin().
---Source: lua/ge/extensions/flowgraph/builder.lua:406
function flowgraph_builder:EndPin() end

--- Calls EndInput or EndOutput according to pin.direction.
---Source: lua/ge/extensions/flowgraph/builder.lua:164
---@param pin table pin with a direction field
function flowgraph_builder:EndPinDynamic(pin) end

--- Opens the header area with the given color.
---Source: lua/ge/extensions/flowgraph/builder.lua:128
---@param color ImVec4 header color
function flowgraph_builder:Header(color) end

--- Opens (if needed) the inputs area and begins an input pin.
---Source: lua/ge/extensions/flowgraph/builder.lua:137
---@param pin table pin to draw (uses pin.id)
function flowgraph_builder:Input(pin) end

--- Moves to the 'middle' stage (central area of the node, for drawMiddle).
---Source: lua/ge/extensions/flowgraph/builder.lua:172
function flowgraph_builder:Middle() end

--- Opens (if needed) the outputs area and begins an output pin.
---Source: lua/ge/extensions/flowgraph/builder.lua:179
---@param pin table pin to draw
function flowgraph_builder:Output(pin) end

--- Calls ui_flowgraph_editor.BeginPin(pin.id, kind).
---Source: lua/ge/extensions/flowgraph/builder.lua:386
---@param pin table pin to draw
---@param kind integer PinKind_Input or PinKind_Output
function flowgraph_builder:Pin(pin, kind) end

--- Changes the drawing stage: closes the groups of the old stage while measuring their rectangles, then opens those of the new one. For 'output', adds padding to round to the grid.
---Source: lua/ge/extensions/flowgraph/builder.lua:206
---@param stage string 'begin', 'header', 'content', 'input', 'middle', 'output', 'end' or 'invalid'
---@return boolean  false if the stage is already the current one, otherwise true
function flowgraph_builder:SetStage(stage) end

--- Stores the expected width of the output pins, used to align the node to the grid.
---Source: lua/ge/extensions/flowgraph/builder.lua:198
---@param width number width in pixels
function flowgraph_builder:expectOutPinWidth(width) end

--- Initializes the state (stage 'invalid', sizes at 0, header texture art/imgui_node_header_alt.png) and pushes the NodeBorder/NodeRounding styles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/builder.lua:36
function flowgraph_builder:init() end

--- Draws a dummy input pin (12 px high dummy) used to align nodes that have no visible input.
---Source: lua/ge/extensions/flowgraph/builder.lua:417
---@param pin table alignment pin (its direction is forced to 'in')
function flowgraph_builder:makeAlignmentPin(pin) end

--- Stores the expected width of the header (text + icons).
---Source: lua/ge/extensions/flowgraph/builder.lua:202
---@param width number width in pixels
function flowgraph_builder:setExpectedHeaderSize(width) end

