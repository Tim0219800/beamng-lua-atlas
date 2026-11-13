---@meta
-- tim19Atlas stub generated from lua/objectpool/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

---Source : lua/objectpool/main.lua:100
---@param t any
---@param key any
function __indexHandler(t, key) end

---Source : lua/objectpool/main.lua:96
---@param t any
---@param key any
---@param val any
function __newIndexHandler(t, key, val) end

---Source : lua/objectpool/main.lua:90
---@param objId any
---@param _obj any
function _setObj(objId, _obj) end

---Source : lua/objectpool/main.lua:40
---@param objId any
function deleteObject(objId) end

---Source : lua/objectpool/main.lua:24
---@param objId any
function getObject(objId) end

--- called in object Lua VM
---Source : lua/objectpool/main.lua:49
---@param path any
---@param initData any
function init(path, initData) end

--- thread Lua VM
---Source : lua/objectpool/main.lua:45
function initPool() end

---Source : lua/objectpool/main.lua:28
---@param objId any
function moveObject(objId) end

---Source : lua/objectpool/main.lua:81
---@param id any
---@param energy any
function onBeamBroke(id, energy) end

---Source : lua/objectpool/main.lua:84
---@param id any
---@param ratio any
function onBeamDeformed(id, ratio) end

---Source : lua/objectpool/main.lua:74
---@param id1 any
---@param pos any
---@param normal any
---@param nodeVel any
---@param perpendicularVel any
---@param slipVec any
---@param slipVel any
---@param slipForce any
---@param normalForce any
---@param depth any
---@param materialId1 any
---@param materialId2 any
function onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2) end

---Source : lua/objectpool/main.lua:78
---@param retainDebug any
function onVehicleReset(retainDebug) end

---Source : lua/objectpool/main.lua:18
---@param ... any
function print(...) end

---Source : lua/objectpool/main.lua:35
---@param objId any
---@param objDataStr any
function setObject(objId, objDataStr) end

---@type vec3
float3 = nil
---@type table
objData = nil
---@type string
vmType = nil
