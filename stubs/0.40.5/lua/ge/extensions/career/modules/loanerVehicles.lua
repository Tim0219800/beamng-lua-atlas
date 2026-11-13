---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/loanerVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_loanerVehicles` : `extensions.load("career_modules_loanerVehicles")`, puis la globale `career_modules_loanerVehicles`
---@class career_modules_loanerVehicles
---@field dependencies table
---@field spawnAndLoanVehicle any
career_modules_loanerVehicles = {}

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:288
---@param facility any
function career_modules_loanerVehicles.formatLoanerOfferForUi(facility) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:254
function career_modules_loanerVehicles.formatSpawnedLoanersForUi() end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:139
---@param organizationId any
function career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:210
---@param vehId any
function career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:18
---@param offer any
function career_modules_loanerVehicles.markForSpawning(offer) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:151
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:33
---@param id any
function career_modules_loanerVehicles.onVehicleAdded(id) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:114
---@param inventoryId any
---@param callback any
function career_modules_loanerVehicles.returnVehicle(inventoryId, callback) end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:37
function career_modules_loanerVehicles.spawnAllOffers() end

---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:27
function career_modules_loanerVehicles.unmarkAllForSpawning() end

