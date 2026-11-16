---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career reaction to speed traps (gameplay_speedTraps): fines for speeding and running red lights, UI messages, flash sound, and recording into the speed trap leaderboards (gameplay_speedTrapLeaderboards) saved in <save>/career/speedTrapLeaderboards/. Only the player's vehicle (index 0) is concerned.
--- Access: extension `career_modules_speedTraps`: `extensions.load("career_modules_speedTraps")`, then the global `career_modules_speedTraps`
---@class career_modules_speedTraps
---@field dependencies table<integer, string> Extensions loaded before: career_career, gameplay_speedTraps.
career_modules_speedTraps = {}

--- Hook: loads the profile's speed trap leaderboards if the career is active (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/speedTraps.lua:122
function career_modules_speedTraps.onExtensionLoaded() end

--- Hook called when a red light camera triggers: fine of 500 with message and sound if the player's vehicle is identifiable by a plate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/speedTraps.lua:97
---@param speedTrapData table Camera data (subjectID).
---@param playerSpeed number Recorded speed (not used here).
function career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed) end

--- Save hook: writes the speed trap leaderboards to career/speedTrapLeaderboards/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/speedTraps.lua:129
---@param currentSavePath string Save folder.
function career_modules_speedTraps.onSaveCurrentProfile(currentSavePath) end

--- Hook called when a speed trap triggers: applies the fine or penalty depending on the plate and vehicle type, then updates the speed trap's leaderboard.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/speedTraps.lua:35
---@param speedTrapData table Speed trap data (speedLimit, subjectID...).
---@param playerSpeed number Recorded speed in m/s.
---@param overSpeed number Excess over the limit in m/s.
function career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed) end

