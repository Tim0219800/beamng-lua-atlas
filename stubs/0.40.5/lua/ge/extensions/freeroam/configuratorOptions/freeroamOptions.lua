---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Adds to the freeroam configurator (the level selection screen in freeroam) the freeroam-specific options: traffic mode (disabled, parked cars, normal, police), time of day, date and day progression (day/night cycle). It reacts to the hooks onFreeroamConfiguratorGetOptions (menu construction) and onFreeroamConfiguratorApplyOptions (chosen values) and writes the choices into freeroam_freeroam.spawningOptionsHelper. A modder can copy this pattern to add their own options.
--- Access: extension `freeroam_configuratorOptions_freeroamOptions`: `extensions.load("freeroam_configuratorOptions_freeroamOptions")`, then the global `freeroam_configuratorOptions_freeroamOptions`
---@class freeroam_configuratorOptions_freeroamOptions
freeroam_configuratorOptions_freeroamOptions = {}

--- Default date of a level for the environment.
---Source: lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua:167
---@param levelName string Level name (resolved via core_levels.getLevelByName).
---@return integer  os.time() timestamp of the date (time set to 12:00).
function freeroam_configuratorOptions_freeroamOptions.getDefaultEnvironmentDate(levelName) end

--- Hook called when the player confirms the configurator: passes the options traffic_trafficMode, environment_timeOfDay, environment_date and environment_timePlay to freeroam_freeroam.spawningOptionsHelper (the traffic mode is converted into trafficMode, trafficPolice and trafficParked).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua:149
---@param options table<string, any> Chosen values, keyed by the option's key.
function freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorApplyOptions(options) end

--- Hook called when the configurator builds its options for a level: inserts the traffic and time/date/day progression groups into options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua:14
---@param level table Level data (supportsTraffic, levelName, dir, defaultDate).
---@param options table[] List of option groups to complete (modified in place).
function freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorGetOptions(level, options) end

