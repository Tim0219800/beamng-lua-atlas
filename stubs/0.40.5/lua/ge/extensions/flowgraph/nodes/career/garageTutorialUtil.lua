---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_garageTutorialUtil_C
local flowgraph_nodes_career_garageTutorialUtil_C = {}

--- Timer at 0 when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua:24
function flowgraph_nodes_career_garageTutorialUtil_C:_executionStarted() end

--- Timer at 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua:20
function flowgraph_nodes_career_garageTutorialUtil_C:init() end

--- Every frame: computes parkedInGarage and isRepaired; every second, calls career_modules_inventory.updatePartConditions for the player's vehicle if they are not walking.
---Source: lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua:28
---@param args any unused
function flowgraph_nodes_career_garageTutorialUtil_C:work(args) end

