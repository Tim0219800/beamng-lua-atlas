---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/progress.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_progress` : `extensions.load("career_modules_delivery_progress")`, puis la globale `career_modules_delivery_progress`
---@class career_modules_delivery_progress
career_modules_delivery_progress = {}

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:629
---@param soundLabel any
---@param active any
function career_modules_delivery_progress.activateSound(soundLabel, active) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:107
function career_modules_delivery_progress.aggregateAfter() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:98
function career_modules_delivery_progress.aggregateBefore() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:366
function career_modules_delivery_progress.confirmDropOffCheckComplete() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:300
---@param confirmedDropOffs any
---@param facId any
---@param psPath any
function career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:599
---@param direction any
function career_modules_delivery_progress.getFacilityCountForCargoCount(direction) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:612
---@param skill any
---@param tier any
function career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:37
function career_modules_delivery_progress.getProgress() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:550
---@param facId any
function career_modules_delivery_progress.isFacilityUnlocked(facId) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:574
---@param facId any
---@param isCargoDeliveryTutorialActive any
function career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:617
---@param skill any
---@param tier any
function career_modules_delivery_progress.onBranchTierReached(skill, tier) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:7
function career_modules_delivery_progress.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:41
---@param cargoItems any
function career_modules_delivery_progress.onCargoDelivered(cargoItems) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:77
---@param offers any
function career_modules_delivery_progress.onVehicleTasksFinished(offers) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:199
function career_modules_delivery_progress.openDropOffScreenGatheringComplete() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:124
---@param facId any
---@param psPath any
function career_modules_delivery_progress.requestDropOffData(facId, psPath) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:33
---@param data any
function career_modules_delivery_progress.setProgress(data) end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:537
function career_modules_delivery_progress.unloadCargoPopupClosed() end

---Source : lua/ge/extensions/career/modules/delivery/progress.lua:193
---@param cargoId any
---@param destination any
function career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination) end

