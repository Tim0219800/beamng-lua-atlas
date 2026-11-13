---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/variableStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/variableStorage.lua (instanciée par la fonction renvoyée par le module)
---@class flowgraph_variableStorage
local flowgraph_variableStorage = {}

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:340
function flowgraph_variableStorage:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:336
function flowgraph_variableStorage:_onClear() end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:372
---@param data any
function flowgraph_variableStorage:_onDeserialized(data) end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:351
function flowgraph_variableStorage:_onSerialize() end

--- returns false if variable already exists, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:119
---@param name any
---@param value any
---@param type any
---@param mergeStrat any
---@param fixedType any
---@param undeletable any
function flowgraph_variableStorage:addVariable(name, value, type, mergeStrat, fixedType, undeletable) end

--- returns false if variable nonexistent or value is nil, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:314
---@param name any
---@param value any
function flowgraph_variableStorage:change(name, value) end

--- returns false if variable nonexistent or type mismatch, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:291
---@param name any
---@param value any
function flowgraph_variableStorage:changeBase(name, value) end

--- moves the variable with "name" to be after "newIdx" index (relative to original order indexes)
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:101
---@param name any
---@param newIdx any
function flowgraph_variableStorage:changeCustomVariableOrder(name, newIdx) end

--- returns false if variable nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:305
---@param name any
---@param value any
function flowgraph_variableStorage:changeInstant(name, value) end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:82
function flowgraph_variableStorage:clear() end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:328
function flowgraph_variableStorage:finalizeChanges() end

--- second return value is false if the variable is nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:57
---@param name any
function flowgraph_variableStorage:get(name) end

--- second return value is false if the variable is nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:70
---@param name any
function flowgraph_variableStorage:getFull(name) end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:111
function flowgraph_variableStorage:getMaxSortIndex() end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:48
---@param type any
function flowgraph_variableStorage:getMergeStrats(type) end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:40
function flowgraph_variableStorage:getName() end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:44
function flowgraph_variableStorage:getTypes() end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:25
---@param mgr any
function flowgraph_variableStorage:init(mgr) end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:88
function flowgraph_variableStorage:refreshSortedVariableNames() end

--- returns false if variable nonexistent or undeletable, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:236
---@param name any
function flowgraph_variableStorage:removeVariable(name) end

--- returns false if already exists, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:255
---@param name any
---@param newName any
function flowgraph_variableStorage:renameVariable(name, newName) end

--- returns false if variable nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:208
---@param name any
---@param fixedType any
function flowgraph_variableStorage:setFixedType(name, fixedType) end

--- returns false if variable nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:226
---@param name any
---@param keep any
function flowgraph_variableStorage:setKeepAfterStop(name, keep) end

--- returns false if variable nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:140
---@param name any
---@param strat any
function flowgraph_variableStorage:setMergeStrat(name, strat) end

--- returns false if variable nonexistent, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:217
---@param name any
---@param monitor any
function flowgraph_variableStorage:setMonitor(name, monitor) end

--- returns false if variable nonexistent or has fixed type, otherwise true
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:163
---@param name any
---@param type any
function flowgraph_variableStorage:updateType(name, type) end

---Source : lua/ge/extensions/flowgraph/variableStorage.lua:52
---@param name any
function flowgraph_variableStorage:variableExists(name) end

