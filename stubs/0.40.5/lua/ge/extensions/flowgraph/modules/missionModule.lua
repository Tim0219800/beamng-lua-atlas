---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/missionModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder -100) that links a flowgraph project to the mission that launched it (self.mgr.activity). It manages mission vehicles (keeping or hiding the player vehicle and the traffic), prepares a vehicle (headlights at night, dummy driver), deletes the stashed player vehicle and relays custom events to the mission. On stop, it stops the mission if it is running and emits onMissionFinished.
--- Access: `require("extensions/flowgraph/modules/missionModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_missionModule
flowgraph_modules_missionModule = {}

--- Sets processed back to false. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.clear() end

--- Called when the project starts: triggers the UI event hotlappingReevaluateControlsEnabled and calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.executionStarted() end

--- Called when the project stops: stops the mission if it is running (gameplay_missions_missionManager.stop), emits extensions.hook('onMissionFinished') and triggers the UI event hotlappingReevaluateControlsEnabled. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.executionStopped() end

--- Returns the id of the player vehicle from before the mission (mission._startingInfo.vehId). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@return integer|nil  id or nil
function flowgraph_modules_missionModule.getOriginalPlayerId() end

--- Called when the module is created: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.init() end

--- Calls mission:onMissionCustomEvent(name, data) if the mission defines it, and logs the event. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@param name string event name
---@param data any data
function flowgraph_modules_missionModule.missionHook(name, data) end

--- Empty function. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.onClear() end

--- Prepares a vehicle for the mission: if the game time is within the solar night window, turns on the headlights (electrics.setLightsState(2)); if addDummyDriver and the enableSeatOccupants setting, places a dummy occupant in the driver seat. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@param id integer|nil vehicle id (default: player vehicle 0)
---@param addDummyDriver boolean|nil add a dummy driver
function flowgraph_modules_missionModule.prepareVehicle(id, addDummyDriver) end

--- Applies the mission's keepPlayer and keepTraffic options: enables or disables the original player vehicle and updates mission.setupData.stashedVehicles, and unfreezes the traffic via gameplay_traffic.unfreezeState if keepTraffic is true. Warns if already called. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
---@param params table fields keepPlayer (boolean) and keepTraffic (boolean)
function flowgraph_modules_missionModule.processVehicles(params) end

--- Permanently deletes the stashed player vehicle (it will no longer be reactivated at the end of the project). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:dyn
function flowgraph_modules_missionModule.removeStashedPlayerVehicle() end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/missionModule.lua
---@class flowgraph_modules_missionModule_C
local flowgraph_modules_missionModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:11
function flowgraph_modules_missionModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:127
function flowgraph_modules_missionModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:114
function flowgraph_modules_missionModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:87
function flowgraph_modules_missionModule_C:getOriginalPlayerId() end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:7
function flowgraph_modules_missionModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:107
---@param name any
---@param data any
function flowgraph_modules_missionModule_C:missionHook(name, data) end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:124
function flowgraph_modules_missionModule_C:onClear() end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:63
---@param id any
---@param addDummyDriver any
function flowgraph_modules_missionModule_C:prepareVehicle(id, addDummyDriver) end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:15
---@param params any
function flowgraph_modules_missionModule_C:processVehicles(params) end

---Source: lua/ge/extensions/flowgraph/modules/missionModule.lua:93
function flowgraph_modules_missionModule_C:removeStashedPlayerVehicle() end

