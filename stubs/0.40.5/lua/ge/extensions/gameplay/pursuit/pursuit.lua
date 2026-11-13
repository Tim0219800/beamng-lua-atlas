---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/pursuit/pursuit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_pursuit_pursuit` : `extensions.load("gameplay_pursuit_pursuit")`, puis la globale `gameplay_pursuit_pursuit`
---@class gameplay_pursuit_pursuit
gameplay_pursuit_pursuit = {}

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:280
---@param parkingSpots any
---@param chaseAmount any
---@param fleeAmount any
function gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:507
function gameplay_pursuit_pursuit.getManager() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:106
---@param vehId any
---@param isChase any
---@param isAiControlled any
---@param options any
function gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:746
---@param data any
function gameplay_pursuit_pursuit.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:511
---@param vehId any
---@param action any
---@param pursuit any
function gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:719
function gameplay_pursuit_pursuit.onSerialize() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:716
function gameplay_pursuit_pursuit.onTrafficAmountChanged() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:704
function gameplay_pursuit_pursuit.onTrafficStarted() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:713
function gameplay_pursuit_pursuit.onTrafficStopped() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:560
---@param dt any
---@param dtSim any
function gameplay_pursuit_pursuit.onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:682
---@param vehList any
---@param groupId any
---@param groupName any
function gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:159
---@param vehId any
function gameplay_pursuit_pursuit.removeVeh(vehId) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:221
function gameplay_pursuit_pursuit.reset() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:241
function gameplay_pursuit_pursuit.restart() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:70
---@param options any
function gameplay_pursuit_pursuit.setupGoals(options) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:310
---@param chaseVehId any
---@param fleeVehId any
---@param options any
---@param pursuitVars any
function gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:342
---@param chaseVehIds any
---@param fleeVehIds any
---@param options any
---@param pursuitVars any
function gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:420
---@param chaseAmount any
---@param fleeAmount any
---@param chaseVehGroup any
---@param fleeVehGroup any
---@param parkingSpots any
---@param options any
---@param pursuitVars any
function gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:448
---@param chaseAmount any
---@param fleeAmount any
---@param chaseVehGroupFile any
---@param fleeVehGroupFile any
---@param sitesFile any
---@param options any
---@param pursuitVars any
function gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars) end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:250
function gameplay_pursuit_pursuit.start() end

---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:258
---@param winner any
function gameplay_pursuit_pursuit.stop(winner) end

