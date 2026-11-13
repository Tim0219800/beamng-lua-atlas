---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/police.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_police` : `extensions.load("gameplay_police")`, puis la globale `gameplay_police`
---@class gameplay_police
---@field enabled boolean
gameplay_police = {}

---Source : lua/ge/extensions/gameplay/police.lua:456
---@param id any
---@param showMessages any
function gameplay_police.arrestVehicle(id, showMessages) end

---Source : lua/ge/extensions/gameplay/police.lua:56
---@param vehIds any
---@param rbWidth any
---@param useLength any
function gameplay_police.checkRoadblock(vehIds, rbWidth, useLength) end

---Source : lua/ge/extensions/gameplay/police.lua:493
---@param id any
---@param showMessages any
function gameplay_police.evadeVehicle(id, showMessages) end

---Source : lua/ge/extensions/gameplay/police.lua:277
---@param targetId any
---@param isVisible any
---@param isUsable any
function gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable) end

---Source : lua/ge/extensions/gameplay/police.lua:273
function gameplay_police.getPolice() end

---Source : lua/ge/extensions/gameplay/police.lua:603
function gameplay_police.getPoliceVars() end

---Source : lua/ge/extensions/gameplay/police.lua:273
function gameplay_police.getPoliceVehicles() end

---Source : lua/ge/extensions/gameplay/police.lua:594
---@param id any
function gameplay_police.getPursuitData(id) end

---Source : lua/ge/extensions/gameplay/police.lua:603
function gameplay_police.getPursuitVars() end

--- public interface
---Source : lua/ge/extensions/gameplay/police.lua:235
---@param propId any
function gameplay_police.insertProp(propId) end

---Source : lua/ge/extensions/gameplay/police.lua:299
---@param id any
---@param targetId any
function gameplay_police.isVehicleInPursuit(id, targetId) end

---Source : lua/ge/extensions/gameplay/police.lua:707
function gameplay_police.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/police.lua:762
---@param data any
function gameplay_police.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/police.lua:756
function gameplay_police.onSerialize() end

---Source : lua/ge/extensions/gameplay/police.lua:607
---@param id any
---@param action any
---@param data any
function gameplay_police.onTrafficAction(id, action, data) end

---Source : lua/ge/extensions/gameplay/police.lua:26
function gameplay_police.onTrafficSpecialVehiclesProviders() end

---Source : lua/ge/extensions/gameplay/police.lua:635
function gameplay_police.onTrafficStarted() end

---Source : lua/ge/extensions/gameplay/police.lua:642
function gameplay_police.onTrafficStopped() end

---Source : lua/ge/extensions/gameplay/police.lua:623
---@param id any
function gameplay_police.onTrafficVehicleAdded(id) end

---Source : lua/ge/extensions/gameplay/police.lua:629
---@param id any
function gameplay_police.onTrafficVehicleRemoved(id) end

---Source : lua/ge/extensions/gameplay/police.lua:712
---@param dt any
---@param dtSim any
function gameplay_police.onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/police.lua:700
---@param id any
function gameplay_police.onVehicleDestroyed(id) end

---Source : lua/ge/extensions/gameplay/police.lua:683
---@param id any
function gameplay_police.onVehicleResetted(id) end

---Source : lua/ge/extensions/gameplay/police.lua:646
---@param oldId any
---@param newId any
function gameplay_police.onVehicleSwitched(oldId, newId) end

---Source : lua/ge/extensions/gameplay/police.lua:91
---@param vehIds any
---@param pos any
---@param rot any
---@param placeData any
function gameplay_police.placeRoadblock(vehIds, pos, rot, placeData) end

---Source : lua/ge/extensions/gameplay/police.lua:519
---@param id any
---@param showMessages any
function gameplay_police.releaseVehicle(id, showMessages) end

---Source : lua/ge/extensions/gameplay/police.lua:242
---@param propId any
function gameplay_police.removeProp(propId) end

---Source : lua/ge/extensions/gameplay/police.lua:265
---@param data any
function gameplay_police.setPoliceVars(data) end

---Source : lua/ge/extensions/gameplay/police.lua:226
---@param active any
---@param reset any
function gameplay_police.setPropsActive(active, reset) end

---Source : lua/ge/extensions/gameplay/police.lua:325
---@param mode any
---@param targetId any
---@param policeIds any
function gameplay_police.setPursuitMode(mode, targetId, policeIds) end

---Source : lua/ge/extensions/gameplay/police.lua:265
---@param data any
function gameplay_police.setPursuitVars(data) end

---Source : lua/ge/extensions/gameplay/police.lua:429
---@param id any
function gameplay_police.setSuspect(id) end

---Source : lua/ge/extensions/gameplay/police.lua:439
---@param time any
function gameplay_police.setSuspectTimer(time) end

---Source : lua/ge/extensions/gameplay/police.lua:544
---@param suspectId any
---@param policeIds any
---@param options any
function gameplay_police.setupPursuitGameplay(suspectId, policeIds, options) end

---Source : lua/ge/extensions/gameplay/police.lua:136
---@param targetId any
---@param roadblockVehIds any
---@param roadblockPropIds any
---@param originPos any
---@param originDirVec any
---@param activeDist any
---@param spawnDist any
function gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist) end

