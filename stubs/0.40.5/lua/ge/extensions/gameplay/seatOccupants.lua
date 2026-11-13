---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/seatOccupants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_seatOccupants` : `extensions.load("gameplay_seatOccupants")`, puis la globale `gameplay_seatOccupants`
---@class gameplay_seatOccupants
---@field debugDisableOccupantSystem boolean
---@field debugDisableOccupantWeight boolean
---@field dependencies table
---@field enablePresenceDebugMessages boolean
---@field enableSeatEjection boolean
gameplay_seatOccupants = {}

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:365
---@param vehId any
---@param player any
function gameplay_seatOccupants.canEnterVehicle(vehId, player) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1497
---@param vehId any
function gameplay_seatOccupants.cheeseburger(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1422
---@param vehId any
---@param seatId any
function gameplay_seatOccupants.clearDummyOccupant(vehId, seatId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1434
---@param vehId any
function gameplay_seatOccupants.clearDummyOccupants(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:875
---@param vehId any
---@param seatIdOrPlayer any
function gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1597
---@param vehId any
---@param triggerId any
---@param player any
function gameplay_seatOccupants.enterSeat(vehId, triggerId, player) end

--- lowest player index allowed to drive the vehicle, or nil if only passengers are present
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1388
---@param vehId any
function gameplay_seatOccupants.getDriverPlayer(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:80
---@param vehId any
function gameplay_seatOccupants.getOccupantSystemVersion(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:287
---@param player any
function gameplay_seatOccupants.getPlayerPresence(player) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1520
---@param player any
---@param vehId any
function gameplay_seatOccupants.getSeatExitData(player, vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1322
---@param vehId any
function gameplay_seatOccupants.getSeats(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1371
---@param vehId any
function gameplay_seatOccupants.getVehiclePresences(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1809
---@param vehId any
function gameplay_seatOccupants.onBeforeVehicleReplaced(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1878
---@param enabled any
---@param _ any
---@param player any
function gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1756
---@param player any
---@param camName any
---@param vid any
function gameplay_seatOccupants.onCameraChanged(player, camName, vid) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1865
function gameplay_seatOccupants.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1971
---@param data any
function gameplay_seatOccupants.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1939
---@param data any
function gameplay_seatOccupants.onExtensionLoaded(data) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1952
function gameplay_seatOccupants.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1870
function gameplay_seatOccupants.onLocalParticipantsChanged() end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1962
function gameplay_seatOccupants.onSerialize() end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1746
function gameplay_seatOccupants.onSettingsChanged() end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1750
function gameplay_seatOccupants.onSplitScreenChanged() end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1833
---@param vehId any
function gameplay_seatOccupants.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1813
---@param vehId any
function gameplay_seatOccupants.onVehicleReplaced(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1826
---@param vehId any
function gameplay_seatOccupants.onVehicleResetted(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1793
---@param vehId any
function gameplay_seatOccupants.onVehicleSpawned(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1612
---@param oldId any
---@param newId any
---@param player any
function gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1067
---@param data any
function gameplay_seatOccupants.onVehicleTriggerActionLabel(data) end

--- Re-assert occupant mesh visibility after a path modified it without using the sync hooks
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:646
---@param vehId any
function gameplay_seatOccupants.refreshOccupantMeshes(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1202
---@param vehId any
---@param player any
---@param walkingPos any
function gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1138
---@param vehId any
---@param seatId any
---@param player any
---@param permissionOverride any
function gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1217
---@param player any
---@param vehId any
---@param permissionMode any
function gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1501
---@param vehId any
function gameplay_seatOccupants.salad(vehId) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1400
---@param vehId any
---@param seatId any
---@param weight any
function gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:842
---@param vehId any
---@param seatId any
---@param player any
---@param weight any
---@param permissionOverride any
function gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:478
---@param player any
---@param permissionMode any
function gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1718
---@param vehId any
---@param enabled any
function gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:379
---@param player any
function gameplay_seatOccupants.showVehicleFullMessage(player) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1254
---@param player any
---@param direction any
function gameplay_seatOccupants.switchSeat(player, direction) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1300
---@param player any
function gameplay_seatOccupants.toggleUnseated(player) end

---Source : lua/ge/extensions/gameplay/seatOccupants.lua:85
---@param vehId any
function gameplay_seatOccupants.usesSeatSystem(vehId) end

