---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/customLua.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_customLua_C
local flowgraph_nodes_util_customLua_C = {}

--- Compiles the four blocks then runs _executionStarted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:131
function flowgraph_nodes_util_customLua_C:_executionStarted() end

--- Runs _executionStopped then releases the environment.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:137
function flowgraph_nodes_util_customLua_C:_executionStopped() end

--- Restores name and code then recompiles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:160
---@param data any
function flowgraph_nodes_util_customLua_C:_onDeserialized(data) end

--- Saves name and code.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:168
---@param data any
function flowgraph_nodes_util_customLua_C:_onSerialize(data) end

--- Builds (once) and returns the environment table of the user code: self, map, be, FS, scenetree, extensions, vec3/quat, JSON and math tools, all loaded extensions, etc. Also provides refreshExtensions, loadExtension, unloadExtension, log (also logs to the manager).
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:173
function flowgraph_nodes_util_customLua_C:buildBaseEnv() end

--- Compiles the given code block with the base environment; stores the error message in self.status, otherwise the function in self.compiled (nop on error).
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:44
---@param code string Block name: work, _executionStarted, _executionStopped or onPreRender.
function flowgraph_nodes_util_customLua_C:compile(code) end

--- Draws the editor: loading from the library, name, save button, and a multiline field per block with a compile error indicator. Returns the description of the change or false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:54
function flowgraph_nodes_util_customLua_C:drawCustomProperties() end

--- Runs the compiled block under pcall; on error, logs, marks the node as in error and adds an event to the manager.
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:145
---@param code string Block name.
function flowgraph_nodes_util_customLua_C:exec(code) end

--- Creates the four empty code blocks and allows custom input and output pins (savePins=true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:29
function flowgraph_nodes_util_customLua_C:init() end

--- Runs the onPreRender block (before rendering).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:141
---@param dt number Real-time delta.
---@param dtSim number Simulated time delta.
function flowgraph_nodes_util_customLua_C:onPreRender(dt, dtSim) end

--- Runs the work block.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/customLua.lua:156
function flowgraph_nodes_util_customLua_C:work() end

