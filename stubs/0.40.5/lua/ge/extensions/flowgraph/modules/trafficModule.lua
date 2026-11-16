---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/trafficModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0) that wraps gameplay_traffic and gameplay_parking for traffic nodes. It remembers whether the flowgraph itself enabled traffic (trafficActive) or parked cars (parkedCarsActive) so as to disable them on stop only if it enabled them, unless keepTrafficState is true.
--- Access: `require("extensions/flowgraph/modules/trafficModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_trafficModule
flowgraph_modules_trafficModule = {}

--- Enables parked cars (gameplay_parking.processVehicles(vehList)). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param vehList integer[]|nil vehicle ids (inferred from code)
function flowgraph_modules_trafficModule.activateParkedCars(vehList) end

--- Enables traffic (gameplay_traffic.activate) with a list of vehicles. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param vehList integer[]|nil vehicle ids (inferred from code)
function flowgraph_modules_trafficModule.activateTraffic(vehList) end

--- Disables parked cars (processVehicles without arguments), only if enabled by the flowgraph. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.deactivateParkedCars() end

--- Disables traffic (gameplay_traffic.deactivate), only if it was enabled by the flowgraph. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.deactivateTraffic() end

--- Called when the project stops: resets the traffic, pursuit and parking variables then disables traffic and parked cars, unless keepTrafficState is true. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.executionStopped() end

--- Called when the module is created: trafficActive, parkedCarsActive and keepTrafficState are false. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.init() end

--- Adds a vehicle to the traffic (gameplay_traffic.insertTraffic) and updates the state. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param id integer vehicle id
function flowgraph_modules_trafficModule.insertTraffic(id) end

--- Removes a vehicle from the traffic (gameplay_traffic.removeTraffic) and updates the state. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param id integer vehicle id
function flowgraph_modules_trafficModule.removeTraffic(id) end

--- Updates parkedCarsActive from gameplay_parking.getParkedCarsData(). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.updateParkedCarsState() end

--- Updates trafficActive from gameplay_traffic.getTrafficData(). Use only if the flowgraph changed the traffic state. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.updateTrafficState() end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/trafficModule.lua
---@class flowgraph_modules_trafficModule_C
local flowgraph_modules_trafficModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:45
---@param vehList any
function flowgraph_modules_trafficModule_C:activateParkedCars(vehList) end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:33
---@param vehList any
function flowgraph_modules_trafficModule_C:activateTraffic(vehList) end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:50
function flowgraph_modules_trafficModule_C:deactivateParkedCars() end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:38
function flowgraph_modules_trafficModule_C:deactivateTraffic() end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:57
function flowgraph_modules_trafficModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:8
function flowgraph_modules_trafficModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:23
---@param id any
function flowgraph_modules_trafficModule_C:insertTraffic(id) end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:28
---@param id any
function flowgraph_modules_trafficModule_C:removeTraffic(id) end

---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:19
function flowgraph_modules_trafficModule_C:updateParkedCarsState() end

--- trafficActive and parkedCarsActive should only get updated if the flowgraph itself alters the traffic state
---Source: lua/ge/extensions/flowgraph/modules/trafficModule.lua:15
function flowgraph_modules_trafficModule_C:updateTrafficState() end

