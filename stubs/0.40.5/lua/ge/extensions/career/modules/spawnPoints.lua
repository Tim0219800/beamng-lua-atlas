---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/spawnPoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Discovery of a level's spawn points in career. Every second, if the player is driving an inventory vehicle, it tests the distance to undiscovered points (threshold 75 m); on discovery it adds a logbook entry (career_modules_logbook.spawnPointUnlocked), emits the onSpawnPointUnlocked(spawnPoint) hook and clears gameplay_rawPois. The state is saved in <save>/career/spawnPoints.json.
--- Access: extension `career_modules_spawnPoints`: `extensions.load("career_modules_spawnPoints")`, then the global `career_modules_spawnPoints`
---@class career_modules_spawnPoints
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_spawnPoints = {}

--- Returns the table of discovered points, per level.
---Source: lua/ge/extensions/career/modules/spawnPoints.lua:77
---@return table<string, table<string, boolean>>  level -> point name -> true.
function career_modules_spawnPoints.getUnlockedSpawnpointsData() end

--- Indicates whether a spawn point is discovered (creates the level entry if needed).
---Source: lua/ge/extensions/career/modules/spawnPoints.lua:91
---@param level string Level identifier.
---@param spawnPointName string Point object name (objectname).
---@return boolean|nil  true if discovered, nil otherwise.
function career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName) end

--- Hook: loads the discovered points when the career becomes active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/spawnPoints.lua:103
---@param active boolean Nothing if false.
function career_modules_spawnPoints.onCareerActive(active) end

--- Hook: loads the discovered points if the career is already active (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/spawnPoints.lua:98
function career_modules_spawnPoints.onExtensionLoaded() end

--- Save hook: writes spawnPoints.json to <save>/career/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/spawnPoints.lua:109
---@param currentSavePath string Save folder.
function career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath) end

--- Hook called every frame: every second (accumulated dtReal), looks for an undiscovered point within 75 m of the player vehicle and unlocks it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/spawnPoints.lua:28
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation time (s), unused.
---@param dtRaw number Raw time (s), unused.
function career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw) end

