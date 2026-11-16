---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_displayFlow_C
local flowgraph_nodes_debug_displayFlow_C = {}

--- Editor: draws the checked box (active/inactive) and accumulates time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:33
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_debug_displayFlow_C:drawMiddle(builder, style) end

--- Editor: "N fps" tooltip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:44
function flowgraph_nodes_debug_displayFlow_C:drawTooltip() end

--- Initializes lastTime, time and lastUsedFrame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:21
function flowgraph_nodes_debug_displayFlow_C:init() end

--- Stores the time elapsed since the last flow and the current frame number (mgr.frameCount).
---Source: lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:27
function flowgraph_nodes_debug_displayFlow_C:work() end

