---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/tasklist.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_tasklist` : `extensions.load("career_modules_delivery_tasklist")`, puis la globale `career_modules_delivery_tasklist`
---@class career_modules_delivery_tasklist
---@field dependencies table
career_modules_delivery_tasklist = {}

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:150
function career_modules_delivery_tasklist.clearAll() end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:143
---@param offerId any
function career_modules_delivery_tasklist.clearTasklistForOfferId(offerId) end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:8
function career_modules_delivery_tasklist.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:301
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:22
function career_modules_delivery_tasklist.sendCargoToTasklist() end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:159
function career_modules_delivery_tasklist.updateCargoTasklistElements() end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:129
---@param cargoId any
function career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId) end

---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:136
---@param offerId any
function career_modules_delivery_tasklist.updateTasklistForOfferId(offerId) end

