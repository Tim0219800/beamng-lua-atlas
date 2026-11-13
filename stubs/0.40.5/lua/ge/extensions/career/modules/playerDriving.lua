---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerDriving.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_playerDriving` : `extensions.load("career_modules_playerDriving")`, puis la globale `career_modules_playerDriving`
---@class career_modules_playerDriving
---@field debugMode any
---@field dependencies table
career_modules_playerDriving = {}

---Source : lua/ge/extensions/career/modules/playerDriving.lua:15
function career_modules_playerDriving.getPlayerData() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:315
---@param active any
function career_modules_playerDriving.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:262
---@param vehId any
---@param action any
---@param data any
function career_modules_playerDriving.onPursuitAction(vehId, action, data) end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:283
function career_modules_playerDriving.onTrafficOrParkingReady() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:245
function career_modules_playerDriving.onTrafficStarted() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:258
function career_modules_playerDriving.onTrafficStopped() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:309
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:233
---@param vehId any
---@param data any
function career_modules_playerDriving.onVehicleParkingStatus(vehId, data) end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:303
---@param oldId any
---@param newId any
function career_modules_playerDriving.onVehicleSwitched(oldId, newId) end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:107
function career_modules_playerDriving.playerPursuitActive() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:111
function career_modules_playerDriving.resetPlayerState() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:141
function career_modules_playerDriving.restoreTrafficAfterTutorialPhase() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:157
function career_modules_playerDriving.retrieveFavoriteVehicle() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:125
function career_modules_playerDriving.setTrafficAfterTutorial() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:117
function career_modules_playerDriving.setTrafficForTutorial() end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:340
---@param pos any
function career_modules_playerDriving.showPosition(pos) end

---Source : lua/ge/extensions/career/modules/playerDriving.lua:205
---@param garageId any
---@param veh any
---@param resetVeh any
function career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh) end

