---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/trafficModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/trafficModule.lua
---@class flowgraph_modules_trafficModule_C
local flowgraph_modules_trafficModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:45
---@param vehList any
function flowgraph_modules_trafficModule_C:activateParkedCars(vehList) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:33
---@param vehList any
function flowgraph_modules_trafficModule_C:activateTraffic(vehList) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:50
function flowgraph_modules_trafficModule_C:deactivateParkedCars() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:38
function flowgraph_modules_trafficModule_C:deactivateTraffic() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:57
function flowgraph_modules_trafficModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:8
function flowgraph_modules_trafficModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:23
---@param id any
function flowgraph_modules_trafficModule_C:insertTraffic(id) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:28
---@param id any
function flowgraph_modules_trafficModule_C:removeTraffic(id) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:19
function flowgraph_modules_trafficModule_C:updateParkedCarsState() end

--- trafficActive and parkedCarsActive should only get updated if the flowgraph itself alters the traffic state
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:15
function flowgraph_modules_trafficModule_C:updateTrafficState() end

