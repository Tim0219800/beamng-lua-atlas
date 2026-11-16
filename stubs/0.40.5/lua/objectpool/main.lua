---@meta
-- tim19Atlas stub generated from lua/objectpool/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Metatable of _G: reading a missing global is looked up in objData.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:100
---@param t table _G
---@param key any name of the global
---@return any  value found in objData, or nil
function __indexHandler(t, key) end

--- Metatable of _G: a global assignment is stored in objData instead of _G.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:96
---@param t table _G
---@param key any name of the global
---@param val any value
function __newIndexHandler(t, key, val) end

--- Selects the current object: sets the globals obj, objectId and objData (= objPool[objId]) with rawset.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:90
---@param objId integer object identifier
---@param _obj any engine handle of the object
function _setObj(objId, _obj) end

--- Removes the object from the pool.
---Source: lua/objectpool/main.lua:40
---@param objId integer object identifier
function deleteObject(objId) end

--- Returns the pool object encoded as an lpack string, without removing it.
---Source: lua/objectpool/main.lua:24
---@param objId integer object identifier
---@return string  encoded data
function getObject(objId) end

--- Called in the object's Lua VM: decodes initData (lpack), loads the vehicle with jbeam/stage2 (loadVehicleStage2) and stores it in objPool[obj:getId()] = {v = object}. Logs an error and returns false (unloads the Lua) if the data is invalid.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:49
---@param path string object path (unused)
---@param initData string spawn data encoded by lpack, with a vdata field
---@return boolean  true if the object is loaded, false otherwise
function init(path, initData) end

--- Initialization of the pool's "thread" VM; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:45
function initPool() end

--- Returns the encoded object and removes it from the pool (transfer to another VM).
---Source: lua/objectpool/main.lua:28
---@param objId integer object identifier
---@return string  encoded data
function moveObject(objId) end

--- Hook called by the engine when a beam breaks; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:81
---@param id integer beam identifier
---@param energy number break energy
function onBeamBroke(id, energy) end

--- Hook called by the engine when a beam deforms; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:84
---@param id integer beam identifier
---@param ratio number deformation rate
function onBeamDeformed(id, ratio) end

--- Node collision hook called by the engine; empty body in this VM.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:74
---@param id1 integer node identifier
---@param pos any contact position (inferred from code)
---@param normal any contact normal
---@param nodeVel any node velocity
---@param perpendicularVel any perpendicular velocity
---@param slipVec any slip vector
---@param slipVel number slip velocity
---@param slipForce number slip force
---@param normalForce number normal force
---@param depth number penetration depth
---@param materialId1 integer node material
---@param materialId2 integer material of the other surface
function onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2) end

--- Hook called by the engine on a reset; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:78
---@param retainDebug boolean debug retention flag (unused)
function onVehicleReset(retainDebug) end

--- Replaces print: writes to the log with level 'A' and tag 'print'. Only the first argument is converted (tostring(...)).
---*(internal: called by the engine or the main loop)*
---Source: lua/objectpool/main.lua:18
---@param ... any
function print(...) end

--- Decodes an lpack string and stores it in the pool under objId.
---Source: lua/objectpool/main.lua:35
---@param objId integer object identifier
---@param objDataStr string data encoded by lpack
function setObject(objId, objDataStr) end

---@type vec3
float3 = nil
---@type table
objData = nil
---@type string
vmType = nil
