---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/spawnPoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_spawnPoints` : `extensions.load("career_modules_spawnPoints")`, puis la globale `career_modules_spawnPoints`
---@class career_modules_spawnPoints
---@field dependencies table
career_modules_spawnPoints = {}

---Source : lua/ge/extensions/career/modules/spawnPoints.lua:77
function career_modules_spawnPoints.getUnlockedSpawnpointsData() end

---Source : lua/ge/extensions/career/modules/spawnPoints.lua:91
---@param level any
---@param spawnPointName any
function career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName) end

---Source : lua/ge/extensions/career/modules/spawnPoints.lua:103
---@param active any
function career_modules_spawnPoints.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/spawnPoints.lua:98
function career_modules_spawnPoints.onExtensionLoaded() end

--- this should only be loaded when the career is active
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:109
---@param currentSavePath any
function career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/spawnPoints.lua:28
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw) end

