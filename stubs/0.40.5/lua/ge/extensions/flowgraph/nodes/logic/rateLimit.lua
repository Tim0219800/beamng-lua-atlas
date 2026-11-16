---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_rateLimit_C
local flowgraph_nodes_logic_rateLimit_C = {}

--- Resets time and prevFps to their initial value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:39
function flowgraph_nodes_logic_rateLimit_C:_executionStarted() end

--- Cycle progress bar.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:44
---@param builder any
---@param style any
function flowgraph_nodes_logic_rateLimit_C:drawMiddle(builder, style) end

--- time=0, prevFps=-1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:34
function flowgraph_nodes_logic_rateLimit_C:init() end

--- Resets the timer on reset or when input changes; with flow, decrements time by dt; when time <= 0, adds 1/fps (or input in duration mode) and emits flow=true this frame, otherwise false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:51
function flowgraph_nodes_logic_rateLimit_C:work() end

