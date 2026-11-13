---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/walk.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_walk` : `extensions.load("gameplay_walk")`, puis la globale `gameplay_walk`
---@class gameplay_walk
gameplay_walk = {}

---Source : lua/ge/extensions/gameplay/walk.lua:561
---@param vehId any
function gameplay_walk.addVehicleToBlacklist(vehId) end

---Source : lua/ge/extensions/gameplay/walk.lua:306
---@param enabled any
---@param force any
---@param player any
function gameplay_walk.canSetWalkingMode(enabled, force, player) end

--- pos and rot are optional
---Source : lua/ge/extensions/gameplay/walk.lua:298
---@param force any
---@param player any
function gameplay_walk.canToggleWalkingMode(force, player) end

---Source : lua/ge/extensions/gameplay/walk.lua:573
function gameplay_walk.clearBlacklist() end

---Source : lua/ge/extensions/gameplay/walk.lua:553
---@param enabled any
function gameplay_walk.enableToggling(enabled) end

---Source : lua/ge/extensions/gameplay/walk.lua:577
function gameplay_walk.getBlacklist() end

--- returns the unicycle a player is currently in, no matter if it's the one saved under unicycleIds or not
---Source : lua/ge/extensions/gameplay/walk.lua:114
---@param player any
function gameplay_walk.getCurrentUnicycle(player) end

--- returns a position near the driver's door
---Source : lua/ge/extensions/gameplay/walk.lua:215
---@param veh any
function gameplay_walk.getDoorsidePosRot(veh) end

--- priority: the unicycle part (part selector), the splitscreen setting, the last known face, a random face
---Source : lua/ge/extensions/gameplay/walk.lua:135
---@param player any
function gameplay_walk.getFacePart(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:252
---@param vehicle any
---@param player any
function gameplay_walk.getInVehicle(vehicle, player) end

--- priority: the splitscreen persona paint, the unicycle paint (vehicle config menu), the last known paint, the saved color
---Source : lua/ge/extensions/gameplay/walk.lua:150
---@param player any
function gameplay_walk.getPaint(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:530
---@param player any
function gameplay_walk.getPosRot(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:538
---@param player any
function gameplay_walk.getPosXYZ(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:546
---@param player any
function gameplay_walk.getRotXYZW(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:357
---@param player any
function gameplay_walk.getStoredUnicycleId(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:510
---@param player any
function gameplay_walk.getVehicleInFront(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:181
---@param player any
function gameplay_walk.isAtParkingSpeed(player) end

---Source : lua/ge/extensions/gameplay/walk.lua:557
function gameplay_walk.isTogglingEnabled() end

---Source : lua/ge/extensions/gameplay/walk.lua:569
---@param vehId any
function gameplay_walk.isVehicleBlacklisted(vehId) end

---Source : lua/ge/extensions/gameplay/walk.lua:177
---@param player any
function gameplay_walk.isWalking(player) end

--- hide the unicycle in that player's own render view while they use the unicycle camera, or while the big map transition flies away from them
---Source : lua/ge/extensions/gameplay/walk.lua:598
---@param player any
---@param camName any
---@param vid any
function gameplay_walk.onCameraChanged(player, camName, vid) end

---Source : lua/ge/extensions/gameplay/walk.lua:586
---@param levelPath any
function gameplay_walk.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/gameplay/walk.lua:581
---@param levelPath any
function gameplay_walk.onClientStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/walk.lua:518
---@param data any
function gameplay_walk.onDeserialize(data) end

---Source : lua/ge/extensions/gameplay/walk.lua:514
function gameplay_walk.onSerialize() end

---Source : lua/ge/extensions/gameplay/walk.lua:593
---@param enabled any
---@param playerCount any
---@param layout any
---@param mode any
function gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode) end

---Source : lua/ge/extensions/gameplay/walk.lua:502
---@param dtReal any
---@param dtSim any
function gameplay_walk.onUpdate(dtReal, dtSim) end

---Source : lua/ge/extensions/gameplay/walk.lua:628
---@param vehId any
---@param index any
---@param paint any
function gameplay_walk.onVehicleColorChanged(vehId, index, paint) end

---Source : lua/ge/extensions/gameplay/walk.lua:654
---@param vehId any
function gameplay_walk.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/walk.lua:650
---@param vehId any
function gameplay_walk.onVehicleReplaced(vehId) end

---Source : lua/ge/extensions/gameplay/walk.lua:617
---@param oldId any
---@param newId any
---@param player any
function gameplay_walk.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/gameplay/walk.lua:565
---@param vehId any
function gameplay_walk.removeVehicleFromBlacklist(vehId) end

--- a walking player gets their unicycle respawned with the new face, otherwise the stored unicycle is dropped and respawned later
---Source : lua/ge/extensions/gameplay/walk.lua:163
---@param player any
---@param facePart any
function gameplay_walk.setFacePart(player, facePart) end

---Source : lua/ge/extensions/gameplay/walk.lua:287
---@param front any
---@param up any
---@param player any
function gameplay_walk.setRot(front, up, player) end

---Source : lua/ge/extensions/gameplay/walk.lua:311
---@param enabled any
---@param pos any
---@param rot any
---@param force any
---@param player any
function gameplay_walk.setWalkingMode(enabled, pos, rot, force, player) end

---Source : lua/ge/extensions/gameplay/walk.lua:361
---@param player any
function gameplay_walk.toggleWalkingMode(player) end

