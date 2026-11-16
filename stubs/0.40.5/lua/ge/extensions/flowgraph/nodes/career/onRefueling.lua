---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_onRefueling_C
local flowgraph_nodes_career_onRefueling_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:26
function flowgraph_nodes_career_onRefueling_C:init() end

--- Hook: raises paidPrice.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:66
---@param data any unused
function flowgraph_nodes_career_onRefueling_C:onPaidRefuelling(data) end

--- Hook: raises closedMenu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:70
function flowgraph_nodes_career_onRefueling_C:onRefuelingEndTransaction() end

--- Hook: raises openedMenu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:54
---@param data any unused
function flowgraph_nodes_career_onRefueling_C:onRefuelingStartTransaction(data) end

--- Hook: raises tankFilled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:58
---@param data any unused
function flowgraph_nodes_career_onRefueling_C:onRefuelingStopFueling(data) end

--- Every frame: sets the flow pins back to false, applies the flags, updates currentlyFueling and tankPercent, clears the flags.
---Source: lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:30
---@param args any unused
function flowgraph_nodes_career_onRefueling_C:work(args) end

