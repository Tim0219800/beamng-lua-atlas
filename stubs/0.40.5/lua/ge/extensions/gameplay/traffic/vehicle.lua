---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/traffic/vehicle.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_traffic_vehicle
local gameplay_traffic_vehicle = {}

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:98
function gameplay_traffic_vehicle:applyModelConfigData() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:319
function gameplay_traffic_vehicle:checkCollisions() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:492
function gameplay_traffic_vehicle:checkOffenses() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:550
---@param dtSim any
function gameplay_traffic_vehicle:checkPoliceVisibility(dtSim) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:412
---@param startPos any
---@param endPos any
function gameplay_traffic_vehicle:checkRayCast(startPos, endPos) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:599
function gameplay_traffic_vehicle:checkTimeOfDay() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:401
---@param rate any
---@param isFadeOut any
function gameplay_traffic_vehicle:fade(rate, isFadeOut) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:311
---@param speed any
---@param accel any
function gameplay_traffic_vehicle:getBrakingDistance(speed, accel) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:297
---@param pos any
---@param squared any
function gameplay_traffic_vehicle:getInteractiveDistance(pos, squared) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:213
---@param duration any
function gameplay_traffic_vehicle:honkHorn(duration) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:23
---@param id any
---@param role any
function gameplay_traffic_vehicle:init(id, role) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:305
---@param addActiveRadius any
---@param addInnerRadius any
function gameplay_traffic_vehicle:modifyRespawnValues(addActiveRadius, addInnerRadius) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:618
function gameplay_traffic_vehicle:onActiveDone() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:994
---@param data any
function gameplay_traffic_vehicle:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:755
---@param dt any
---@param dtSim any
function gameplay_traffic_vehicle:onPursuitUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:632
function gameplay_traffic_vehicle:onRefresh() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:622
function gameplay_traffic_vehicle:onRespawn() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:966
function gameplay_traffic_vehicle:onSerialize() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:668
---@param tickTime any
function gameplay_traffic_vehicle:onTrafficTick(tickTime) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:875
---@param dt any
---@param dtSim any
function gameplay_traffic_vehicle:onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:610
function gameplay_traffic_vehicle:onVehicleResetted() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:93
function gameplay_traffic_vehicle:postInit() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:207
function gameplay_traffic_vehicle:resetAll() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:200
function gameplay_traffic_vehicle:resetElectrics() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:168
function gameplay_traffic_vehicle:resetPursuit() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:177
function gameplay_traffic_vehicle:resetTracking() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:184
function gameplay_traffic_vehicle:resetValues() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:225
---@param mode any
---@param ignoreParams any
function gameplay_traffic_vehicle:setAiMode(mode, ignoreParams) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:253
---@param params any
function gameplay_traffic_vehicle:setAiParameters(params) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:278
---@param roleName any
function gameplay_traffic_vehicle:setRole(roleName) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:377
---@param otherId any
---@param dt any
function gameplay_traffic_vehicle:trackCollision(otherId, dt) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:473
---@param data any
function gameplay_traffic_vehicle:triggerOffense(data) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:439
function gameplay_traffic_vehicle:tryRespawn() end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:421
---@param tickTime any
function gameplay_traffic_vehicle:updateActiveRadius(tickTime) end

---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:218
---@param duration any
---@param disableAfterUse any
function gameplay_traffic_vehicle:useSiren(duration, disableAfterUse) end

