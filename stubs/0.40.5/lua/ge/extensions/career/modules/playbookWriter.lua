---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playbookWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_playbookWriter` : `extensions.load("career_modules_playbookWriter")`, puis la globale `career_modules_playbookWriter`
---@class career_modules_playbookWriter
---@field dependencies table
career_modules_playbookWriter = {}

---Source : lua/ge/extensions/career/modules/playbookWriter.lua:14
---@param missionId any
---@param stars any
function career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars) end

---Source : lua/ge/extensions/career/modules/playbookWriter.lua:37
---@param active any
function career_modules_playbookWriter.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/playbookWriter.lua:32
function career_modules_playbookWriter.onExtensionLoaded() end

--- this should only be loaded when the career is active
---Source : lua/ge/extensions/career/modules/playbookWriter.lua:43
---@param currentSavePath any
function career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath) end

