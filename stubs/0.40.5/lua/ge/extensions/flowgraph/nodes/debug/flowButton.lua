---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_flowButton_C
local flowgraph_nodes_debug_flowButton_C = {}

--- Editor: draws the button; a click arms doTrigger if the graph is in the "running" state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:26
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_debug_flowButton_C:drawMiddle(builder, style) end

--- Label "Push" and doTrigger false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:21
---@param mgr table manager (unused)
---@param ... any
function flowgraph_nodes_debug_flowButton_C:init(mgr, ...) end

--- Editor hook: renames the button after the pin or target node if the name is still "Push".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:44
---@param link table created link
function flowgraph_nodes_debug_flowButton_C:onLink(link) end

--- Editor hook: resets the label to "Push".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:53
---@param link table deleted link
function flowgraph_nodes_debug_flowButton_C:onUnlink(link) end

--- Sets the flow output to doTrigger then resets it to false.
---Source: lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:39
function flowgraph_nodes_debug_flowButton_C:work() end

