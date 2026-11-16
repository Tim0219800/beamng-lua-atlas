---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playbookWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Records the history of played missions (missionId and stars) in playbook.json in the save's career folder. Loaded only when the career is active.
--- Access: extension `career_modules_playbookWriter`: `extensions.load("career_modules_playbookWriter")`, then the global `career_modules_playbookWriter`
---@class career_modules_playbookWriter
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_playbookWriter = {}

--- Appends {missionId, stars} to the end of the in-memory playbook.
---Source: lua/ge/extensions/career/modules/playbookWriter.lua:14
---@param missionId string Mission identifier.
---@param stars any Result in stars (inferred from code).
function career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars) end

--- Hook: reloads the playbook when the career becomes active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playbookWriter.lua:37
---@param active boolean Nothing if false.
function career_modules_playbookWriter.onCareerActive(active) end

--- Hook on extension load: loads the playbook if the career is active (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playbookWriter.lua:32
function career_modules_playbookWriter.onExtensionLoaded() end

--- Save hook: writes the playbook to <save>/career/playbook.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playbookWriter.lua:43
---@param currentSavePath string Save folder.
function career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath) end

