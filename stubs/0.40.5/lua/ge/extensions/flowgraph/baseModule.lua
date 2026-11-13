---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/baseModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `flowgraph_baseModule` : `extensions.load("flowgraph_baseModule")`, puis la globale `flowgraph_baseModule`
---@class flowgraph_baseModule
flowgraph_baseModule = {}

---Source : lua/ge/extensions/flowgraph/baseModule.lua:27
---@param ... any
function flowgraph_baseModule.createBase(...) end

---Source : lua/ge/extensions/flowgraph/baseModule.lua:35
---@param mgr any
---@param derivedClass any
function flowgraph_baseModule.use(mgr, derivedClass) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/baseModule.lua
---@class flowgraph_baseModule_C
local flowgraph_baseModule_C = {}

--- functions you can use
---Source : lua/ge/extensions/flowgraph/baseModule.lua:15
function flowgraph_baseModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/baseModule.lua:18
function flowgraph_baseModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/baseModule.lua:17
function flowgraph_baseModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/baseModule.lua:10
---@param mgr any
function flowgraph_baseModule_C:init(mgr) end

---Source : lua/ge/extensions/flowgraph/baseModule.lua:19
function flowgraph_baseModule_C:onClear() end

---Source : lua/ge/extensions/flowgraph/baseModule.lua:16
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_baseModule_C:onUpdate(dtReal, dtSim, dtRaw) end

