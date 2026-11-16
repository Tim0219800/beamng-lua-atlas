---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/branches/landing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the career UI with the data of the progression landing page (domains, branches, skills): titles, breadcrumbs, level/XP, unlocks, leagues and formatted missions. Also adds the 'landing page APM' button to the computer menu. A modder mainly uses it to understand the format of the tables sent to the career.branchPage screen.
--- Access: extension `career_modules_branches_landing`: `extensions.load("career_modules_branches_landing")`, then the global `career_modules_branches_landing`
---@class career_modules_branches_landing
career_modules_branches_landing = {}

--- Formats a drift spot as a mission for the UI (skill 'drift', icon 'drift02', objectives completed as stars by default).
---Source: lua/ge/extensions/career/modules/branches/landing.lua:482
---@param ds table Drift spot (fields id, info, saveData).
---@return table  Entry formatted for the UI.
function career_modules_branches_landing.formatDriftSpot(ds) end

--- Formats a mission for the UI: skill, id, icon, label, description, type, formatted progress, startable, preview, thumbnail, locked (not visible) and canStartFromProgressScreen ('league' type trigger).
---Source: lua/ge/extensions/career/modules/branches/landing.lua:457
---@param m table Mission (gameplay_missions_missions).
---@return table  Mission formatted for the UI.
function career_modules_branches_landing.formatMission(m) end

--- Returns the info of a branch/skill card for the UI (name, descriptions, level, level label, max level reached, unlocked, icon, color…). Calls career_branches.checkUnlocks() beforehand.
---Source: lua/ge/extensions/career/modules/branches/landing.lua:342
---@param branchId string Branch id.
---@return table  branchInfo for the UI.
function career_modules_branches_landing.getBranchSkillCardData(branchId) end

--- Builds the whole table of the progression page: heading, description, branches, breadcrumbs, and for a branch: skillInfo, skills, leagues (formatted missions), isBranch.
---Source: lua/ge/extensions/career/modules/branches/landing.lua:603
---@param pathId string|nil Domain/branch id; nil, '' or 'undefined' for the root page.
---@return table  Page data for the UI.
function career_modules_branches_landing.getLandingPageData(pathId) end

--- Recursively walks the domain's branches/skills (excluding in-development ones) and returns up to two suggested missions: one never played (0 stars) and one partially completed (otherwise a second never played).
---Source: lua/ge/extensions/career/modules/branches/landing.lua:578
---@param domainId string|nil Domain id; 'apm' by default.
---@return table[]  Suggested formatted missions.
function career_modules_branches_landing.getSuggestedMissionsForDomain(domainId) end

--- Hook of career_modules_computer: if the facility has the function 'apmLandingPage', adds a general button that navigates to 'career.branchPage' (pathId 'apm', return 'career.computer'), disabled until the starter vehicle is bought.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/branches/landing.lua:739
---@param menuData table Menu data (computerFacility, hasBoughtStarterVehicle…).
---@param computerFunctions table Table {general, vehicleSpecific} to fill in.
function career_modules_branches_landing.onComputerAddFunctions(menuData, computerFunctions) end

--- Opens the big map (freeroam_bigMapMode.enterBigMap) instantly with the selected mission, return route 'career.branchPage.bigmap'.
---Source: lua/ge/extensions/career/modules/branches/landing.lua:443
---@param missionId string Id of the mission to select.
function career_modules_branches_landing.openBigMapWithMissionSelected(missionId) end

--- Translated title of a branch (branchHeading or name); if absent or missing, returns the translated title of the landing page (ui.career.landingPage.name).
---Source: lua/ge/extensions/career/modules/branches/landing.lua:594
---@param pathId string|nil Branch id.
---@return string  Translated title.
function career_modules_branches_landing.resolveBranchTitle(pathId) end

