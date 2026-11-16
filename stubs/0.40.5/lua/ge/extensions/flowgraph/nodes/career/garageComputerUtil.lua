---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_garageComputerUtil_C
local flowgraph_nodes_career_garageComputerUtil_C = {}

--- Creates the flag table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:28
function flowgraph_nodes_career_garageComputerUtil_C:init() end

--- Hook: tuning applied.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:55
function flowgraph_nodes_career_garageComputerUtil_C:onCareerTuningApplied() end

--- Hook: tuning started.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:51
function flowgraph_nodes_career_garageComputerUtil_C:onCareerTuningStarted() end

--- Hook: garage computer menu opened.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:47
function flowgraph_nodes_career_garageComputerUtil_C:onComputerMenuOpened() end

--- Hook: part installed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:63
---@param data table part data (unused)
function flowgraph_nodes_career_garageComputerUtil_C:onPartShoppingPartInstalled(data) end

--- Hook: parts shopping opened.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:59
function flowgraph_nodes_career_garageComputerUtil_C:onPartShoppingStarted() end

--- Hook: purchase transaction completed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:67
function flowgraph_nodes_career_garageComputerUtil_C:onPartShoppingTransactionComplete() end

--- Every frame: sets all outputs to false, applies the received flags then clears them.
---Source: lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:33
---@param args any unused
function flowgraph_nodes_career_garageComputerUtil_C:work(args) end

