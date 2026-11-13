---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/milestones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_milestones_milestones` : `extensions.load("career_modules_milestones_milestones")`, puis la globale `career_modules_milestones_milestones`
---@class career_modules_milestones_milestones
---@field colorGeneralGray string
---@field colorMissionBlue string
---@field colorOrange string
---@field saveData table
career_modules_milestones_milestones = {}

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:47
---@param id any
---@param noGuiEvent any
function career_modules_milestones_milestones.claim(id, noGuiEvent) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:67
function career_modules_milestones_milestones.claimAllUnclaimed() end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:89
---@param filter any
function career_modules_milestones_milestones.getMilestones(filter) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:136
function career_modules_milestones_milestones.loadSaveData() end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:186
---@param step any
function career_modules_milestones_milestones.majorLinear(step) end

--- put here so it can eventually be delayed if in a mission, grouped up if multiple...
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:122
---@param label any
function career_modules_milestones_milestones.milestoneReached(label) end

--- common reward functions
---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:185
---@param step any
function career_modules_milestones_milestones.minorLinear(step) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:169
---@param active any
function career_modules_milestones_milestones.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:145
function career_modules_milestones_milestones.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:112
---@param list any
function career_modules_milestones_milestones.onGetMilestones(list) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:218
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:223
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:150
---@param currentSavePath any
function career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:116
---@param filter any
function career_modules_milestones_milestones.requestMilestones(filter) end

---Source : lua/ge/extensions/career/modules/milestones/milestones.lua:155
function career_modules_milestones_milestones.unclaimedMilestonesCount() end

