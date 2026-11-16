---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_playerAttribute_C
local flowgraph_nodes_career_playerAttribute_C = {}

--- Calls onNodeReset when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua:30
function flowgraph_nodes_career_playerAttribute_C:_executionStarted() end

--- Sets the applied flag back to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua:26
function flowgraph_nodes_career_playerAttribute_C:onNodeReset() end

--- If career is active and not yet applied, adds amount (signed according to add) to the attribute and marks it applied; resets if the reset pin is active.
---Source: lua/ge/extensions/flowgraph/nodes/career/playerAttribute.lua:34
function flowgraph_nodes_career_playerAttribute_C:work() end

