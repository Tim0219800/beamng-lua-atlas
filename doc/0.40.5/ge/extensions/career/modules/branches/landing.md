# `career_modules_branches_landing`

*File: `lua/ge/extensions/career/modules/branches/landing.lua` · VM: Game Engine (GE) · 756 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_branches_landing`: `extensions.load("career_modules_branches_landing")`, then the global `career_modules_branches_landing`

Provides the career UI with the data of the progression landing page (domains, branches, skills): titles, breadcrumbs, level/XP, unlocks, leagues and formatted missions. Also adds the 'landing page APM' button to the computer menu. A modder mainly uses it to understand the format of the tables sent to the career.branchPage screen.

## Example

```lua
local data = career_modules_branches_landing.getLandingPageData('apm')
print(data.heading, #data.branches)
```

## Notes

- Without a pathId (nil, '' or 'undefined'), getLandingPageData lists the domains (branch.isDomain) with target 'landing' if they have child branches, otherwise 'skillPage'.
- With a pathId, the page lists the children (target 'skillPage'), computes level/XP (career_branches.calcBranchLevelFromValue), the reward multiplier inherited from the parents and, for a branch or skill, its leagues with formatted missions.
- The default domain of the suggestions is 'apm'.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_branches_landing.formatDriftSpot(ds)` | Formats a drift spot as a mission for the UI (skill 'drift', icon 'drift02', objectives completed as stars by default). | 482 |
| `career_modules_branches_landing.formatMission(m)` | Formats a mission for the UI: skill, id, icon, label, description, type, formatted progress, startable, preview, thumbnail, locked (not visible) and canStartFromProgressScreen ('league' type trigger). | 457 |
| `career_modules_branches_landing.getBranchSkillCardData(branchId)` | Returns the info of a branch/skill card for the UI (name, descriptions, level, level label, max level reached, unlocked, icon, color…). Calls career_branches.checkUnlocks() beforehand. | 342 |
| `career_modules_branches_landing.getLandingPageData(pathId)` | Builds the whole table of the progression page: heading, description, branches, breadcrumbs, and for a branch: skillInfo, skills, leagues (formatted missions), isBranch. | 603 |
| `career_modules_branches_landing.getSuggestedMissionsForDomain(domainId)` | Recursively walks the domain's branches/skills (excluding in-development ones) and returns up to two suggested missions: one never played (0 stars) and one partially completed (otherwise a second never played). | 578 |
| `career_modules_branches_landing.onComputerAddFunctions(menuData, computerFunctions)` | Hook of career_modules_computer: if the facility has the function 'apmLandingPage', adds a general button that navigates to 'career.branchPage' (pathId 'apm', return 'career.computer'), disabled until the starter vehicle is bought. *(internal)* *(hook)* | 739 |
| `career_modules_branches_landing.openBigMapWithMissionSelected(missionId)` | Opens the big map (freeroam_bigMapMode.enterBigMap) instantly with the selected mission, return route 'career.branchPage.bigmap'. | 443 |
| `career_modules_branches_landing.resolveBranchTitle(pathId)` | Translated title of a branch (branchHeading or name); if absent or missing, returns the translated title of the landing page (ui.career.landingPage.name). | 594 |

### Parameter details

#### `career_modules_branches_landing.formatDriftSpot(ds)`

Formats a drift spot as a mission for the UI (skill 'drift', icon 'drift02', objectives completed as stars by default).

- `ds` (*table*) : Drift spot (fields id, info, saveData).
- **returns**: table Entry formatted for the UI.

#### `career_modules_branches_landing.formatMission(m)`

Formats a mission for the UI: skill, id, icon, label, description, type, formatted progress, startable, preview, thumbnail, locked (not visible) and canStartFromProgressScreen ('league' type trigger).

- `m` (*table*) : Mission (gameplay_missions_missions).
- **returns**: table Mission formatted for the UI.

#### `career_modules_branches_landing.getBranchSkillCardData(branchId)`

Returns the info of a branch/skill card for the UI (name, descriptions, level, level label, max level reached, unlocked, icon, color…). Calls career_branches.checkUnlocks() beforehand.

- `branchId` (*string*) : Branch id.
- **returns**: table branchInfo for the UI.

#### `career_modules_branches_landing.getLandingPageData(pathId)`

Builds the whole table of the progression page: heading, description, branches, breadcrumbs, and for a branch: skillInfo, skills, leagues (formatted missions), isBranch.

- `pathId` (*string|nil*) : Domain/branch id; nil, '' or 'undefined' for the root page.
- **returns**: table Page data for the UI.

#### `career_modules_branches_landing.getSuggestedMissionsForDomain(domainId)`

Recursively walks the domain's branches/skills (excluding in-development ones) and returns up to two suggested missions: one never played (0 stars) and one partially completed (otherwise a second never played).

- `domainId` (*string|nil*) : Domain id; 'apm' by default.
- **returns**: table[] Suggested formatted missions.

#### `career_modules_branches_landing.onComputerAddFunctions(menuData, computerFunctions)`

Hook of career_modules_computer: if the facility has the function 'apmLandingPage', adds a general button that navigates to 'career.branchPage' (pathId 'apm', return 'career.computer'), disabled until the starter vehicle is bought.

- `menuData` (*table*) : Menu data (computerFacility, hasBoughtStarterVehicle…).
- `computerFunctions` (*table*) : Table {general, vehicleSpecific} to fill in.

#### `career_modules_branches_landing.openBigMapWithMissionSelected(missionId)`

Opens the big map (freeroam_bigMapMode.enterBigMap) instantly with the selected mission, return route 'career.branchPage.bigmap'.

- `missionId` (*string*) : Id of the mission to select.

#### `career_modules_branches_landing.resolveBranchTitle(pathId)`

Translated title of a branch (branchHeading or name); if absent or missing, returns the translated title of the landing page (ui.career.landingPage.name).

- `pathId` (*string|nil*) : Branch id.
- **returns**: string Translated title.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCareerProgressPageGetTasklistData` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/branches/landing.lua`.*
