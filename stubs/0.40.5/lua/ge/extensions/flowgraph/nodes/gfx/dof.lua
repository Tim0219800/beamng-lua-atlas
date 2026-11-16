---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gfx/dof.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gfx_dof_C
local flowgraph_nodes_gfx_dof_C = {}

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:61
function flowgraph_nodes_gfx_dof_C:_executionStopped() end

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:57
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gfx_dof_C:init(mgr, ...) end

--- Resets the timer and the mode to zero and restores the saved DOF variables.
---Source: lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:33
function flowgraph_nodes_gfx_dof_C:reset() end

--- Calls DOFPostEffect.updateDOFSettings() if the effect exists.
---Source: lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:26
function flowgraph_nodes_gfx_dof_C:updateSettings() end

--- Detects the mode (in/out), saves the DOF settings then advances the fade with dtSim; sets blurDone to true at the end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:65
function flowgraph_nodes_gfx_dof_C:work() end

