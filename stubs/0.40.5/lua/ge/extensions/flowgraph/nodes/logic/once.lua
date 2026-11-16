---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/once.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_once_C
local flowgraph_nodes_logic_once_C = {}

--- Rearms the node (ready = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/once.lua:27
function flowgraph_nodes_logic_once_C:_executionStopped() end

--- ready = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/once.lua:23
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_once_C:init(mgr, ...) end

--- If reset: rearms and output false. Otherwise, if ready and input flow: output true once then ready=false; in all other cases output false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/once.lua:31
---@param args any unused
function flowgraph_nodes_logic_once_C:work(args) end

