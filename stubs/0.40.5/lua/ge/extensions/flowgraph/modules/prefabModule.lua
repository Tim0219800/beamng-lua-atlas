---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/prefabModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 50) that spawns, tracks and deletes prefabs (groups of scene objects, .prefab.json) during a project. When a prefab is added, it lists all child objects by class, stores the vehicles' transforms, detects whether colliders or waypoints / roads (navgraph) are contained, then reloads the collision (be:reloadCollision) and the navgraph (map.reset) at the right time. On stop, it deletes all prefabs not marked dontDelete.
--- Access: `require("extensions/flowgraph/modules/prefabModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_prefabModule
flowgraph_modules_prefabModule = {}

--- Tracks an existing prefab in the scene: lists its children, its vehicles, detects colliders and navgraph and schedules the necessary reloads. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id in the scene
---@param moreData table|nil fields copied into the data; skipCollisionReload, skipNavgraphReload
function flowgraph_modules_prefabModule.addPrefab(id, moreData) end

--- Called after the graph tick: reloads the collision and rebuilds the navgraph (map.reset, except during loading) if the flags are raised. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.afterTrigger() end

--- Clears prefabs, flags and sortedIds. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.clear() end

--- Deletes the prefab (except dontDelete without force), removes it from tracking and schedules a collision reload if it contained any. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
---@param force boolean|nil ignore dontDelete
function flowgraph_modules_prefabModule.deletePrefab(id, force) end

--- Called when the project stops: deletes all tracked prefabs not marked dontDelete, reloads collision and navgraph if needed, then calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.executionStopped() end

--- Returns the data of the tracked prefab, or an empty table. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
---@return table  prefab data
function flowgraph_modules_prefabModule.getPrefab(id) end

--- Returns the ids of the vehicles contained in the prefab, sorted. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
---@return integer[]  ids
function flowgraph_modules_prefabModule.getVehicleIdsForPrefab(id) end

--- Creates the tables prefabs, sortedIds, flags then calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.init() end

--- Computes {pos, rot, up} for each vehicle (BeamNGVehicle) of the prefab and adds them to the manager's vehicle module. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param data table prefab data, with allChildrenIds
---@return table<integer, table>  transforms by vehicle id
function flowgraph_modules_prefabModule.originalVehicleTransforms(data) end

--- Puts the prefab's vehicles back at their original position and rotation and resets the physics and the deformations. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
function flowgraph_modules_prefabModule.restoreVehiclePositions(id) end

--- Marks the prefab as to be kept when the project stops (dontDelete). Warns if the prefab is not tracked. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
---@param keep boolean keep
function flowgraph_modules_prefabModule.setKeepPrefab(id, keep) end

--- Indicates whether the vehicles must be extracted before the prefab is deleted. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
---@param set boolean extract the vehicles
function flowgraph_modules_prefabModule.setUnpackVehiclesBeforeDeletion(id, set) end

--- Creates a prefab from <name>.prefab.json (path relative to the project), adds it to MissionGroup and tracks it via addPrefab. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param fileName string prefab name (without extension)
---@return integer  prefab object id
function flowgraph_modules_prefabModule.spawnPrefab(fileName) end

--- Explodes the prefab (obj:explode), deletes the prefab then reinserts its vehicles into MissionGroup at their current position before deleting the remaining group. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer prefab id
---@param obj userdata prefab object in the scene
function flowgraph_modules_prefabModule.unpackPrefabAndDelete(id, obj) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/prefabModule.lua
---@class flowgraph_modules_prefabModule_C
local flowgraph_modules_prefabModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:152
---@param id any
---@param moreData any
function flowgraph_modules_prefabModule_C:addPrefab(id, moreData) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:20
function flowgraph_modules_prefabModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:14
function flowgraph_modules_prefabModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:284
---@param id any
---@param force any
function flowgraph_modules_prefabModule_C:deletePrefab(id, force) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:307
function flowgraph_modules_prefabModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:135
---@param id any
function flowgraph_modules_prefabModule_C:getPrefab(id) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:239
---@param id any
function flowgraph_modules_prefabModule_C:getVehicleIdsForPrefab(id) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:7
function flowgraph_modules_prefabModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:92
---@param data any
function flowgraph_modules_prefabModule_C:originalVehicleTransforms(data) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:225
---@param id any
function flowgraph_modules_prefabModule_C:restoreVehiclePositions(id) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:277
---@param id any
---@param keep any
function flowgraph_modules_prefabModule_C:setKeepPrefab(id, keep) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:271
---@param id any
---@param set any
function flowgraph_modules_prefabModule_C:setUnpackVehiclesBeforeDeletion(id, set) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:139
---@param fileName any
function flowgraph_modules_prefabModule_C:spawnPrefab(fileName) end

---Source: lua/ge/extensions/flowgraph/modules/prefabModule.lua:248
---@param id any
---@param obj any
function flowgraph_modules_prefabModule_C:unpackPrefabAndDelete(id, obj) end

