---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/branches/leagues.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_branches_leagues` : `extensions.load("career_modules_branches_leagues")`, puis la globale `career_modules_branches_leagues`
---@class career_modules_branches_leagues
career_modules_branches_leagues = {}

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:223
function career_modules_branches_leagues.addLeagueSortOrder() end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:455
---@param mission any
function career_modules_branches_leagues.checkMission(mission) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:15
function career_modules_branches_leagues.clearLeagueUnlockCache() end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:129
---@param l any
function career_modules_branches_leagues.formatLeague(l) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:9
---@param id any
function career_modules_branches_leagues.getLeagueById(id) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:10
---@param mId any
function career_modules_branches_leagues.getLeagueOfMission(mId) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:206
---@param missionId any
function career_modules_branches_leagues.getLeaguesForMission(missionId) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:167
---@param branchId any
---@param ignoreSubSkills any
function career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:183
---@param before any
---@param after any
function career_modules_branches_leagues.getLeaguesForUnlockChange(before, after) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:200
---@param skill any
---@param missions any
---@param driftSpots any
function career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:19
function career_modules_branches_leagues.getSimpleUnlockedStatus() end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:389
---@param skillId any
function career_modules_branches_leagues.getStarsForSkill(skillId) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:376
---@param skillIds any
function career_modules_branches_leagues.getStarsForSkills(skillIds) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:391
---@param cond any
---@param map any
function career_modules_branches_leagues.getStartConditionLeagueId(cond, map) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:28
---@param id any
function career_modules_branches_leagues.isLeagueUnlocked(id) end

---Source : lua/ge/extensions/career/modules/branches/leagues.lua:367
---@param active any
function career_modules_branches_leagues.onCareerActive(active) end

