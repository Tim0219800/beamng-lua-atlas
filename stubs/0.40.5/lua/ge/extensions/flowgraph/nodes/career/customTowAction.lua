---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_customTowAction_C
local flowgraph_nodes_career_customTowAction_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua:21
function flowgraph_nodes_career_customTowAction_C:init() end

--- Career hook: raises the tow flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua:33
---@param poiId any point of interest id (unused)
function flowgraph_nodes_career_customTowAction_C:onCareerCustomTowHook(poiId) end

--- Every frame: sets tow to false, applies the received flags then clears them.
---Source: lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua:25
---@param args any unused
function flowgraph_nodes_career_customTowAction_C:work(args) end

