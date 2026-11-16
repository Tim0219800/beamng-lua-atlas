---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_multiseat_C
local flowgraph_nodes_gameplay_multiseat_C = {}

--- Resets self.activated to false when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua:20
function flowgraph_nodes_gameplay_multiseat_C:_executionStarted() end

--- If the node had enabled multiseat, restores the original value of the setting.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua:30
function flowgraph_nodes_gameplay_multiseat_C:_executionStopped() end

--- Initializes self.activated to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua:16
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_multiseat_C:init(mgr, ...) end

--- Reads the 'multiseat' setting (default false), stores it in self.previous then sets 'multiseat' to true via settings.setValue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua:24
function flowgraph_nodes_gameplay_multiseat_C:workOnce() end

