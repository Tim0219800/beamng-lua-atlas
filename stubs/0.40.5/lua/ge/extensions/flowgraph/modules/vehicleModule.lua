---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/vehicleModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/vehicleModule.lua
---@class flowgraph_modules_vehicleModule_C
local flowgraph_modules_vehicleModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:135
---@param id any
---@param off any
---@param tag any
function flowgraph_modules_vehicleModule_C:addCouplerOffset(id, off, tag) end

--- call this to add a vehicle that is not spawned by FG, but should still be tracked
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:27
---@param veh any
---@param moreData any
function flowgraph_modules_vehicleModule_C:addForeignVehicle(veh, moreData) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:33
---@param veh any
---@param moreData any
function flowgraph_modules_vehicleModule_C:addVehicle(veh, moreData) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:16
function flowgraph_modules_vehicleModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:150
function flowgraph_modules_vehicleModule_C:executionStarted() end

--- this function will remove all vehicles, except if marked to not delete.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:195
function flowgraph_modules_vehicleModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:22
function flowgraph_modules_vehicleModule_C:getSpawnedVehicles() end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:58
---@param id any
function flowgraph_modules_vehicleModule_C:getVehicle(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:62
---@param name any
function flowgraph_modules_vehicleModule_C:getVehicleIdByInternalName(name) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:71
---@param name any
function flowgraph_modules_vehicleModule_C:getVehiclesIdByInternalNameMatch(name) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:8
function flowgraph_modules_vehicleModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:281
---@param id any
function flowgraph_modules_vehicleModule_C:isBus(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:272
---@param id any
function flowgraph_modules_vehicleModule_C:isBusDoorOpen(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:271
---@param id any
function flowgraph_modules_vehicleModule_C:isBusKneel(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:243
---@param id any
function flowgraph_modules_vehicleModule_C:isCoupled(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:244
---@param id any
---@param other any
function flowgraph_modules_vehicleModule_C:isCoupledTo(id, other) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:234
---@param objId1 any
---@param objId2 any
---@param nodeId any
---@param obj2nodeId any
function flowgraph_modules_vehicleModule_C:onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:238
---@param objId1 any
---@param objId2 any
---@param nodeId any
---@param obj2nodeId any
function flowgraph_modules_vehicleModule_C:onCouplerDetached(objId1, objId2, nodeId, obj2nodeId) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:81
function flowgraph_modules_vehicleModule_C:onUpdate() end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:289
---@param id any
function flowgraph_modules_vehicleModule_C:onVehicleResetted(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:105
---@param id any
function flowgraph_modules_vehicleModule_C:readyUpVehicle(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:263
---@param id any
function flowgraph_modules_vehicleModule_C:registerBusChangeNotification(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:247
---@param id any
function flowgraph_modules_vehicleModule_C:requestBusData(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:274
---@param id any
---@param data any
function flowgraph_modules_vehicleModule_C:requestBusStop(id, data) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:170
---@param id any
---@param keep any
function flowgraph_modules_vehicleModule_C:setKeepVehicle(id, keep) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:155
---@param id any
function flowgraph_modules_vehicleModule_C:storeFuelAmount(id) end

---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:255
---@param id any
---@param data any
function flowgraph_modules_vehicleModule_C:updateBusDisplayData(id, data) end

