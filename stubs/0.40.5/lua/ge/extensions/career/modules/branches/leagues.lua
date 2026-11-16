---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/branches/leagues.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the career "leagues": groups of missions (and drift spots) attached to a skill, loaded from the /gameplay/**/*.leagues.json files on career activation. Computes whether a league is unlocked (conditions leagueStars, branchLevel, skillStars, branchStars, inDevelopment), the stars obtained/available, the display order, and checks the consistency of the missions (a single league, skill, showInCareer).
--- Access: extension `career_modules_branches_leagues`: `extensions.load("career_modules_branches_leagues")`, then the global `career_modules_branches_leagues`
---@class career_modules_branches_leagues
career_modules_branches_leagues = {}

--- Computes league._order: grouped by skill, sorted by required stars then file order, unlocked 'highlightIfUnlocked' leagues first, then skill order (career_branches.getOrder).
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:223
function career_modules_branches_leagues.addLeagueSortOrder() end

--- Checks a mission's configuration against the leagues (startCondition consistent with the league, careerSetup.skill equal to the league's skill, showInCareer true) and logs 'E' errors.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:455
---@param mission table Mission to check.
function career_modules_branches_leagues.checkMission(mission) end

--- Clears each league's unlock cache and the per-skill star cache.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:15
function career_modules_branches_leagues.clearLeagueUnlockCache() end

--- Deep copy of a league enriched for the UI: totalStarsAvailable, totalStarsObtained (missions and drift objectives), icon and accentColor of the skill ('badgeRoundStar' if certification).
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:129
---@param l table Raw league.
---@return table  Formatted league.
function career_modules_branches_leagues.formatLeague(l) end

--- Returns the league with the given id (raw table, not formatted).
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:9
---@param id string League id.
---@return table|nil  League or nil.
function career_modules_branches_leagues.getLeagueById(id) end

--- Returns the league that contains the given mission.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:10
---@param mId string Mission id.
---@return table|nil  League or nil.
function career_modules_branches_leagues.getLeagueOfMission(mId) end

--- Lists the formatted (sorted) leagues that contain the given mission.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:206
---@param missionId string Mission id.
---@return table[]  Formatted leagues.
function career_modules_branches_leagues.getLeaguesForMission(missionId) end

--- Lists the formatted leagues of a branch (and of its sub-skills unless ignoreSubSkills), sorted by _order. Without branchId, all leagues.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:167
---@param branchId string|nil Branch or skill id.
---@param ignoreSubSkills boolean|nil If true, only keeps the leagues of the skill itself.
---@return table[]  Sorted formatted leagues.
function career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills) end

--- Compares two unlock statuses and returns the newly unlocked leagues (formatted, sorted); unlocks the NEW_TERRITORY achievement if there are any.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:183
---@param before table<string, boolean> Status before.
---@param after table<string, boolean> Status after.
---@return table[]  Newly unlocked leagues.
function career_modules_branches_leagues.getLeaguesForUnlockChange(before, after) end

--- Obsolete: logs the error 'Deprecated' and does nothing.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:200
---@param skill any Not used.
---@param missions any Not used.
---@param driftSpots any Not used.
function career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots) end

--- Clears the cache then returns a table league id -> unlocked (boolean) for all leagues.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:19
---@return table<string, boolean>  Unlock status per league.
function career_modules_branches_leagues.getSimpleUnlockedStatus() end

--- Shortcut for getStarsForSkills for a single skill.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:389
---@param skillId string Skill id.
---@return integer  Total default stars.
---@return integer  Unlocked stars.
function career_modules_branches_leagues.getStarsForSkill(skillId) end

--- Sum of the default stars available and unlocked for all missions whose careerSetup.skill is in the given table.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:376
---@param skillIds table<string, boolean> Set of skill ids.
---@return integer  Total default stars.
---@return integer  Default stars unlocked.
function career_modules_branches_leagues.getStarsForSkills(skillIds) end

--- Fills map[leagueId] = true for each 'league' condition found in a startCondition (recursive on cond.nested).
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:391
---@param cond table Mission start condition.
---@param map table<string, boolean> Output table.
function career_modules_branches_leagues.getStartConditionLeagueId(cond, map) end

--- Evaluates (with cache) a league's unlock conditions; without conditions it is unlocked.
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:28
---@param id string League id.
---@return boolean  true if all conditions are met (false if the league does not exist).
---@return table[]|nil  Condition labels (unlockLabels).
function career_modules_branches_leagues.isLeagueUnlocked(id) end

--- Hook: when the career becomes active, loads the leagues from the *.leagues.json files in /gameplay/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/branches/leagues.lua:367
---@param active boolean true on activation.
function career_modules_branches_leagues.onCareerActive(active) end

