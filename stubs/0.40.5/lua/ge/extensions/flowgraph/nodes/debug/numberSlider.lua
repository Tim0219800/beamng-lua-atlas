---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_numberSlider_C
local flowgraph_nodes_debug_numberSlider_C = {}

--- Restores the values a to e (0 by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:98
---@param data table loaded data
function flowgraph_nodes_debug_numberSlider_C:_onDeserialized(data) end

--- Saves the values a to e.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:88
---@param res table serialization table
function flowgraph_nodes_debug_numberSlider_C:_onSerialize(res) end

--- Draws the five sliders in the properties panel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:48
---@return nil  no change reason
function flowgraph_nodes_debug_numberSlider_C:drawCustomProperties() end

--- Editor: draws the sliders of the non-hidden pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:58
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_debug_numberSlider_C:drawMiddle(builder, style) end

--- Sets the default ranges and the initial values to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:25
function flowgraph_nodes_debug_numberSlider_C:init() end

--- Copies the slider values to pins a to e.
---Source: lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:80
function flowgraph_nodes_debug_numberSlider_C:work() end

