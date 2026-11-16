---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_drawGraph_C
local flowgraph_nodes_debug_drawGraph_C = {}

--- Recreates the pins according to data.count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:103
---@param data table loaded data
function flowgraph_nodes_debug_drawGraph_C:_onDeserialized(data) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:100
---@param res table serialization table
function flowgraph_nodes_debug_drawGraph_C:_onSerialize(res) end

--- Editor: synchronizes the number of pins with data.count and draws the curves (PlotMultiLines).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:107
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_debug_drawGraph_C:drawMiddle(builder, style) end

--- Initializes data tables, 400 points max, count = 1, scale 0..1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:21
function flowgraph_nodes_debug_drawGraph_C:init() end

--- Editor hook: resets the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:92
function flowgraph_nodes_debug_drawGraph_C:onLink() end

--- Editor hook: resets the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:88
function flowgraph_nodes_debug_drawGraph_C:onLinkDeleted() end

--- Editor hook: resets the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:96
function flowgraph_nodes_debug_drawGraph_C:onUnlink() end

--- Rebuilds labels, rainbow colors and series from the connected numeric pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:48
function flowgraph_nodes_debug_drawGraph_C:resetGraphData() end

--- Adds or removes value<i> pins to go from old to new (removes the links of removed pins), then resets the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:65
---@param old integer old number of pins
---@param new number new number of pins (rounded up, minimum 0)
function flowgraph_nodes_debug_drawGraph_C:updatePins(old, new) end

--- Adds the numeric value of each pin to its series, extends the scale, removes the oldest values beyond the max size.
---Source: lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:32
function flowgraph_nodes_debug_drawGraph_C:work() end

