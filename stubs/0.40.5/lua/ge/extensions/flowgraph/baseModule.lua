---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/baseModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Base class of the flowgraph manager's modules (the "modules" attached to the manager, as opposed to nodes). It defines a class C with empty hooks (clear, onUpdate, executionStarted, executionStopped) that derived modules override. The file is not a usable extension on its own: it is used by flowgraph modules via M.use(mgr, derivedClass).
--- Access: extension `flowgraph_baseModule`: `extensions.load("flowgraph_baseModule")`, then the global `flowgraph_baseModule`
---@class flowgraph_baseModule
flowgraph_baseModule = {}

--- Creates an instance of the base class: a table with C as metatable, then calls init(...) (so init(mgr)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseModule.lua:27
---@param ... any arguments passed to init, normally the flowgraph manager mgr
---@return table  base module instance
function flowgraph_baseModule.createBase(...) end

--- Creates a base module, copies all fields/methods of derivedClass onto it (override), then calls init() again if the derived class redefined it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseModule.lua:35
---@param mgr table flowgraph manager that owns the module
---@param derivedClass table table of methods/fields that replace those of the base
---@return table  module instance
function flowgraph_baseModule.use(mgr, derivedClass) end

--- Base class of a flowgraph module. The empty methods are meant to be overridden.
---@class flowgraph_baseModule_C
local flowgraph_baseModule_C = {}

--- Empty hook "usable" by derived modules to clear their state.
---Source: lua/ge/extensions/flowgraph/baseModule.lua:15
function flowgraph_baseModule_C:clear() end

--- Empty hook called when the flowgraph execution starts.
---Source: lua/ge/extensions/flowgraph/baseModule.lua:18
function flowgraph_baseModule_C:executionStarted() end

--- Empty hook called when the flowgraph execution stops.
---Source: lua/ge/extensions/flowgraph/baseModule.lua:17
function flowgraph_baseModule_C:executionStopped() end

--- Stores the manager in self.mgr.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseModule.lua:10
---@param mgr table flowgraph manager
function flowgraph_baseModule_C:init(mgr) end

--- Calls self:executionStopped(). Serves as the reaction to the manager being cleared.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/baseModule.lua:19
function flowgraph_baseModule_C:onClear() end

--- Empty hook called on every manager update (overridden by modules).
---Source: lua/ge/extensions/flowgraph/baseModule.lua:16
---@param dtReal number real time delta (s)
---@param dtSim number simulation time delta (s)
---@param dtRaw number raw time delta (s)
function flowgraph_baseModule_C:onUpdate(dtReal, dtSim, dtRaw) end

