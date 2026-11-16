---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_environment_setGravity_C
local flowgraph_nodes_environment_setGravity_C = {}

--- Stores the current gravity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:23
function flowgraph_nodes_environment_setGravity_C:_executionStarted() end

--- Restores the stored gravity if data.restoreGravity is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:26
function flowgraph_nodes_environment_setGravity_C:_executionStopped() end

--- Sets data.restoreGravity = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:19
---@param mgr table Flowgraph manager
function flowgraph_nodes_environment_setGravity_C:init(mgr) end

--- In repeat mode, reapplies the gravity every frame only if the value pin is used (connected).
---Source: lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:37
function flowgraph_nodes_environment_setGravity_C:work() end

--- Applies the gravity of the value pin once.
---Source: lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:33
function flowgraph_nodes_environment_setGravity_C:workOnce() end

