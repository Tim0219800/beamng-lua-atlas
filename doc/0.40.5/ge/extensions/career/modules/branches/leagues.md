# `career_modules_branches_leagues`

*File: `lua/ge/extensions/career/modules/branches/leagues.lua` · VM: Game Engine (GE) · 486 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_branches_leagues`: `extensions.load("career_modules_branches_leagues")`, then the global `career_modules_branches_leagues`

Manages the career "leagues": groups of missions (and drift spots) attached to a skill, loaded from the /gameplay/**/*.leagues.json files on career activation. Computes whether a league is unlocked (conditions leagueStars, branchLevel, skillStars, branchStars, inDevelopment), the stars obtained/available, the display order, and checks the consistency of the missions (a single league, skill, showInCareer).

## Notes

- The leagues are loaded by loadLeagues in onCareerActive(true); getLeagueById/getLeagueOfMission fail if called before (leaguesById is nil).
- The unlock status is cached (league._unlocked); clearLeagueUnlockCache resets it as well as the per-skill star cache.
- isLeagueUnlocked also writes condition.met/progress/label on the league's conditions and league.unlockLabels.
- getLeaguesForUnlockChange unlocks the NEW_TERRITORY achievement if at least one league goes from locked to unlocked.
- An 'inDevelopment' league gets unlock = {{type='inDevelopment'}} and an empty mission list.
- Probable inconsistency: checkStartConditionLeague tests table.getn(lMap) > 1 on a keyed table (always 0), so the error 'several leagues in startCondition' never triggers.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_branches_leagues.addLeagueSortOrder()` | Computes league._order: grouped by skill, sorted by required stars then file order, unlocked 'highlightIfUnlocked' leagues first, then skill order (career_branches.getOrder). | 223 |
| `career_modules_branches_leagues.checkMission(mission)` | Checks a mission's configuration against the leagues (startCondition consistent with the league, careerSetup.skill equal to the league's skill, showInCareer true) and logs 'E' errors. | 455 |
| `career_modules_branches_leagues.clearLeagueUnlockCache()` | Clears each league's unlock cache and the per-skill star cache. | 15 |
| `career_modules_branches_leagues.formatLeague(l)` | Deep copy of a league enriched for the UI: totalStarsAvailable, totalStarsObtained (missions and drift objectives), icon and accentColor of the skill ('badgeRoundStar' if certification). | 129 |
| `career_modules_branches_leagues.getLeagueById(id)` | Returns the league with the given id (raw table, not formatted). | 9 |
| `career_modules_branches_leagues.getLeagueOfMission(mId)` | Returns the league that contains the given mission. | 10 |
| `career_modules_branches_leagues.getLeaguesForMission(missionId)` | Lists the formatted (sorted) leagues that contain the given mission. | 206 |
| `career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills)` | Lists the formatted leagues of a branch (and of its sub-skills unless ignoreSubSkills), sorted by _order. Without branchId, all leagues. | 167 |
| `career_modules_branches_leagues.getLeaguesForUnlockChange(before, after)` | Compares two unlock statuses and returns the newly unlocked leagues (formatted, sorted); unlocks the NEW_TERRITORY achievement if there are any. | 183 |
| `career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots)` | Obsolete: logs the error 'Deprecated' and does nothing. | 200 |
| `career_modules_branches_leagues.getSimpleUnlockedStatus()` | Clears the cache then returns a table league id -> unlocked (boolean) for all leagues. | 19 |
| `career_modules_branches_leagues.getStarsForSkill(skillId)` | Shortcut for getStarsForSkills for a single skill. | 389 |
| `career_modules_branches_leagues.getStarsForSkills(skillIds)` | Sum of the default stars available and unlocked for all missions whose careerSetup.skill is in the given table. | 376 |
| `career_modules_branches_leagues.getStartConditionLeagueId(cond, map)` | Fills map[leagueId] = true for each 'league' condition found in a startCondition (recursive on cond.nested). | 391 |
| `career_modules_branches_leagues.isLeagueUnlocked(id)` | Evaluates (with cache) a league's unlock conditions; without conditions it is unlocked. | 28 |
| `career_modules_branches_leagues.onCareerActive(active)` | Hook: when the career becomes active, loads the leagues from the *.leagues.json files in /gameplay/. *(internal)* *(hook)* | 367 |

### Parameter details

#### `career_modules_branches_leagues.checkMission(mission)`

Checks a mission's configuration against the leagues (startCondition consistent with the league, careerSetup.skill equal to the league's skill, showInCareer true) and logs 'E' errors.

- `mission` (*table*) : Mission to check.

#### `career_modules_branches_leagues.formatLeague(l)`

Deep copy of a league enriched for the UI: totalStarsAvailable, totalStarsObtained (missions and drift objectives), icon and accentColor of the skill ('badgeRoundStar' if certification).

- `l` (*table*) : Raw league.
- **returns**: table Formatted league.

#### `career_modules_branches_leagues.getLeagueById(id)`

Returns the league with the given id (raw table, not formatted).

- `id` (*string*) : League id.
- **returns**: table|nil League or nil.

#### `career_modules_branches_leagues.getLeagueOfMission(mId)`

Returns the league that contains the given mission.

- `mId` (*string*) : Mission id.
- **returns**: table|nil League or nil.

#### `career_modules_branches_leagues.getLeaguesForMission(missionId)`

Lists the formatted (sorted) leagues that contain the given mission.

- `missionId` (*string*) : Mission id.
- **returns**: table[] Formatted leagues.

#### `career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills)`

Lists the formatted leagues of a branch (and of its sub-skills unless ignoreSubSkills), sorted by _order. Without branchId, all leagues.

- `branchId` (*string|nil*) : Branch or skill id.
- `ignoreSubSkills` (*boolean|nil*) : If true, only keeps the leagues of the skill itself.
- **returns**: table[] Sorted formatted leagues.

#### `career_modules_branches_leagues.getLeaguesForUnlockChange(before, after)`

Compares two unlock statuses and returns the newly unlocked leagues (formatted, sorted); unlocks the NEW_TERRITORY achievement if there are any.

- `before` (*table<string, boolean>*) : Status before.
- `after` (*table<string, boolean>*) : Status after.
- **returns**: table[] Newly unlocked leagues.

#### `career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots)`

Obsolete: logs the error 'Deprecated' and does nothing.

- `skill` (*any*) : Not used.
- `missions` (*any*) : Not used.
- `driftSpots` (*any*) : Not used.

#### `career_modules_branches_leagues.getSimpleUnlockedStatus()`

Clears the cache then returns a table league id -> unlocked (boolean) for all leagues.

- **returns**: table<string, boolean> Unlock status per league.

#### `career_modules_branches_leagues.getStarsForSkill(skillId)`

Shortcut for getStarsForSkills for a single skill.

- `skillId` (*string*) : Skill id.
- **returns**: integer Total default stars.
- **returns**: integer Unlocked stars.

#### `career_modules_branches_leagues.getStarsForSkills(skillIds)`

Sum of the default stars available and unlocked for all missions whose careerSetup.skill is in the given table.

- `skillIds` (*table<string, boolean>*) : Set of skill ids.
- **returns**: integer Total default stars.
- **returns**: integer Default stars unlocked.

#### `career_modules_branches_leagues.getStartConditionLeagueId(cond, map)`

Fills map[leagueId] = true for each 'league' condition found in a startCondition (recursive on cond.nested).

- `cond` (*table*) : Mission start condition.
- `map` (*table<string, boolean>*) : Output table.

#### `career_modules_branches_leagues.isLeagueUnlocked(id)`

Evaluates (with cache) a league's unlock conditions; without conditions it is unlocked.

- `id` (*string*) : League id.
- **returns**: boolean true if all conditions are met (false if the league does not exist).
- **returns**: table[]|nil Condition labels (unlockLabels).

#### `career_modules_branches_leagues.onCareerActive(active)`

Hook: when the career becomes active, loads the leagues from the *.leagues.json files in /gameplay/.

- `active` (*boolean*) : true on activation.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/branches/leagues.lua`.*
