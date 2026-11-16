---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/baseStateNode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Base class of the nodes of a flowgraph state graph. It extends flowgraph/basenode by adding eight "transition" pins on the node's edges (inputs and outputs N, E, S, W) and drawing them in the editor. A modder does not call it directly: it is used by state nodes.
--- Access: extension `flowgraph_baseStateNode`: `extensions.load("flowgraph_baseStateNode")`, then the global `flowgraph_baseStateNode`
---@class flowgraph_baseStateNode
flowgraph_baseStateNode = {}

--- Creates a basenode node, copies the state class methods (init, customDrawEnd, drawTransitionPin) onto it, then calls init(...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseStateNode.lua:67
---@param ... any arguments of basenode.createBase: mgr, graph, forceId
---@return table  state node
function flowgraph_baseStateNode.createBase(...) end

--- Creates a state node, applies derivedClass on top, then runs _preInit, init (if redefined) and _postInit like basenode.use.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseStateNode.lua:80
---@param mgr table flowgraph manager
---@param graph table graph that contains the node
---@param forceId integer|nil forced identifier, otherwise the manager assigns one
---@param derivedClass table methods/fields of the concrete node type
---@return table  initialized node
function flowgraph_baseStateNode.use(mgr, graph, forceId, derivedClass) end

--- Methods added to state nodes.
---@class flowgraph_baseStateNode_C
local flowgraph_baseStateNode_C = {}

--- Called by the builder at the end of node drawing (builder:End). Draws the 8 transition pins along the edges of the node rectangle (inputs on the counterclockwise sides, outputs on the clockwise sides).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseStateNode.lua:35
---@param builder table flowgraph builder (flowgraph/builder), which provides NodeRect
function flowgraph_baseStateNode_C:customDrawEnd(builder) end

--- Draws a rectangular transition pin at the given position with ui_flowgraph_editor (BeginPin, PinRect, PinPivotRect, EndPin) and stores pin.imPos.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseStateNode.lua:10
---@param pin table transition pin
---@param kind integer ui_flowgraph_editor.PinKind_Input or PinKind_Output
---@param pos ImVec2 ImGui cursor position
---@param size ImVec2 size of the pin rectangle (pixels)
function flowgraph_baseStateNode_C:drawTransitionPin(pin, kind, pos, size) end

--- Creates the 8 transition pins (4 inputs, 4 outputs: N, E, S, W) via flowgraph/pin and stores them in self.transitionPins._in and ._out.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseStateNode.lua:23
---@param mgr table flowgraph manager (not used directly)
function flowgraph_baseStateNode_C:init(mgr) end

