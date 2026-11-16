---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/highscores.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_highscores`: storage of the best scenario times in settings/highscores.json, organized by level, scenario and configuration key. Keeps the 50 best records of each combination. A modder uses it to record a time (setScenarioHighscores) or read the ranking (getScenarioHighscores).
--- Access: extension `core_highscores`: `extensions.load("core_highscores")`, then the global `core_highscores`
---@class core_highscores
core_highscores = {}

--- Reads and decodes the whole settings/highscores.json file (after possible migration of the old file).
---Source: lua/ge/extensions/core/highscores.lua:25
---@return table  Complete table, {} if the file is absent or empty.
function core_highscores.getHighscores() end

--- Records of a level/scenario/config combination, sorted from best to worst, with the `place` field added.
---Source: lua/ge/extensions/core/highscores.lua:38
---@param levelName string Level name.
---@param scenarioName string Scenario name.
---@param configKey string Configuration key (vehicle, options…).
---@return table[]  List of records, {} if none.
function core_highscores.getScenarioHighscores(levelName, scenarioName, configKey) end

--- Writes the complete highscores table to settings/highscores.json (indented JSON).
---Source: lua/ge/extensions/core/highscores.lua:34
---@param scores table Complete table level -> scenario -> config -> records.
function core_highscores.setHighscores(scores) end

--- Records a time with player and vehicle (builds the record then calls setScenarioHighscoresCustom).
---Source: lua/ge/extensions/core/highscores.lua:77
---@param timeInMillis number Time in milliseconds.
---@param vehicleBrand string Vehicle brand.
---@param vehicleName string Vehicle name.
---@param playerName string Player name.
---@param levelName string Level name.
---@param scenarioName string Scenario name.
---@param configKey string Configuration key.
---@return integer  Place obtained (1 = best), -1 if outside the top 50.
function core_highscores.setScenarioHighscores(timeInMillis, vehicleBrand, vehicleName, playerName, levelName, scenarioName, configKey) end

--- Records a time with a free-form record: completes record (detailed, timeStamp, formattedTimestamp, timeInMillis, formattedTime), inserts it, sorts, keeps the 50 best and saves.
---Source: lua/ge/extensions/core/highscores.lua:86
---@param timeInMillis number Time in milliseconds (rounded to the integer).
---@param record table Free data of the record; modified in place.
---@param levelName string Level name.
---@param scenarioName string Scenario name.
---@param configKey string Configuration key.
---@return integer  Place obtained (1 = best), -1 if outside the top 50.
function core_highscores.setScenarioHighscoresCustom(timeInMillis, record, levelName, scenarioName, configKey) end

