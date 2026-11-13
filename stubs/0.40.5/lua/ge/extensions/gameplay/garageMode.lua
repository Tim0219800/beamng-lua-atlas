---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/garageMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_garageMode` : `extensions.load("gameplay_garageMode")`, puis la globale `gameplay_garageMode`
---@class gameplay_garageMode
---@field dependencies table
gameplay_garageMode = {}

---Source : lua/ge/extensions/gameplay/garageMode.lua:372
function gameplay_garageMode.garageModeStartStep() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:65
function gameplay_garageMode.getGarageMenuState() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:541
function gameplay_garageMode.getLastOwnedVehicleId() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:450
function gameplay_garageMode.getLighting() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:362
function gameplay_garageMode.initStepFinished() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:485
function gameplay_garageMode.isActive() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:493
function gameplay_garageMode.isObjectsAutohide() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:461
---@param levelPath any
function gameplay_garageMode.onClientPreStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:454
---@param levelPath any
function gameplay_garageMode.onClientStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:481
---@param v any
function gameplay_garageMode.onDeserialized(v) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:69
---@param vehicleId any
function gameplay_garageMode.onEnterVehicleFinished(vehicleId) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:146
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:545
function gameplay_garageMode.onLoadingScreenFadeout() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:475
function gameplay_garageMode.onSerialize() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:121
---@param vehicleId any
function gameplay_garageMode.onSpawnCCallback(vehicleId) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:497
---@param active any
function gameplay_garageMode.onThumbnailTriggered(active) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:377
function gameplay_garageMode.onVehicleSaveFinished() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:114
---@param vehicleId any
function gameplay_garageMode.onVehicleSpawned(vehicleId) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:84
---@param preset any
function gameplay_garageMode.setCamera(preset) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:56
---@param state any
function gameplay_garageMode.setGarageMenuState(state) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:318
---@param state any
function gameplay_garageMode.setLighting(state) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:489
---@param v any
function gameplay_garageMode.setObjectsAutohide(v) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:50
---@param vehicleDirty any
---@param switchedToNewVehicle any
function gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:385
---@param _useCurrentLocation any
---@param skipInventoryStep any
function gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:445
function gameplay_garageMode.stop() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:537
function gameplay_garageMode.testVehicle() end

---Source : lua/ge/extensions/gameplay/garageMode.lua:191
---@param vehicleId any
function gameplay_garageMode.vehicleByIdOrActive(vehicleId) end

---Source : lua/ge/extensions/gameplay/garageMode.lua:211
---@param value any
function gameplay_garageMode.zoom(value) end

