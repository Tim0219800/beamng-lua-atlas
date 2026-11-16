---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_frameDelay_C
local flowgraph_nodes_logic_frameDelay_C = {}

--- Resets counter and running to zero at start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:28
function flowgraph_nodes_logic_frameDelay_C:_executionStarted() end

--- Reads data.duration back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:37
---@param res any
function flowgraph_nodes_logic_frameDelay_C:_onDeserialized(res) end

--- Saves data.duration (legacy field, not used elsewhere).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:33
---@param res any
function flowgraph_nodes_logic_frameDelay_C:_onSerialize(res) end

--- Progress bar counter/frames and Reset button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:49
---@param builder any
---@param style any
function flowgraph_nodes_logic_frameDelay_C:drawMiddle(builder, style) end

--- Initializes counter=0 and running=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:23
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_frameDelay_C:init(mgr, ...) end

--- If running, increments the counter and stops when it exceeds 'frames'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:41
function flowgraph_nodes_logic_frameDelay_C:updateCounter() end

--- Handles reset, starts counting when there is flow, calls updateCounter; output flow = (counter >= frames).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:59
---@param args any unused
function flowgraph_nodes_logic_frameDelay_C:work(args) end

