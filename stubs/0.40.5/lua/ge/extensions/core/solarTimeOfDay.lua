---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/solarTimeOfDay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pure solar computations (no engine call): from a latitude, longitude, date and UTC offset, computes sunrise, solar noon, sunset and solar midnight, then converts them to the game's time convention (tod.time: 0 = noon, 0.25 = 6 pm, 0.5 = midnight, 0.75 = 6 am). Used for time-of-day choices (morning, afternoon, evening...) in the quick race menus, and handles polar cases (continuous day or night).
--- Access: extension `core_solarTimeOfDay`: `extensions.load("core_solarTimeOfDay")`, then the global `core_solarTimeOfDay`
---@class core_solarTimeOfDay
core_solarTimeOfDay = {}

--- Builds the list of time-of-day options. In a polar case, returns only solarMidnight and solarNoon (translation keys ui.quickrace.tod.*). Otherwise copies each provided option adding value = solar value for its key (nil if unknown).
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:265
---@param state table See notes.
---@param options table[]|nil Existing options with a key field (morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night, sunrise...).
---@return table[]  Options with a value field.
function core_solarTimeOfDay.buildSolarTimeOfDayOptions(state, options) end

--- Civil time offset (hours): state.utcOffset if given, otherwise inferred from the longitude and the daylight saving rule.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:169
---@param state table See notes.
---@return number|nil  Offset in hours, nil if state is incomplete.
function core_solarTimeOfDay.getCivilOffsetHours(state) end

--- Night window: start (sunset) and end (sunrise) as tod.time values.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:256
---@param state table See notes.
---@return number|nil  Start of night (sunset).
---@return number|nil  End of night (sunrise). nil if polar or state incomplete.
function core_solarTimeOfDay.getSolarNightWindow(state) end

--- Computes the solar events in local minutes: sunrise, noon, sunset, night (solar midnight) and polar.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:200
---@param state table See notes.
---@return {sunrise: integer|nil, noon: integer, sunset: integer|nil, night: integer, polar: string|nil}|nil  Events, nil if state is incomplete.
function core_solarTimeOfDay.getSolarTimeOfDayEvents(state) end

--- Named tod.time values: sunrise, noon, sunset, night, plus morning (1/3 from sunrise to noon), earlyNoon (5/9), lateNoon (40% from noon to sunset), afternoon (70%) and evening (94%) when sunrise and sunset exist.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:252
---@param state table See notes.
---@return table<string, number>|nil  Values by key, nil if state is incomplete.
function core_solarTimeOfDay.getSolarTimeOfDayValues(state) end

--- Returns the tod.time value of the option whose key is given among those of buildSolarTimeOfDayOptions.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:291
---@param key string Option key.
---@param state table See notes.
---@param options table[]|nil Candidate options.
---@return number|nil  Value, nil if the key is not text or not found.
function core_solarTimeOfDay.getTimeValueForKey(key, state, options) end

--- Converts local minutes since midnight into a tod.time value ((minutes/1440 - 0.5) modulo 1). The minutes are rounded then brought into 0..1439.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:165
---@param minutes number Minutes since midnight.
---@return number|nil  tod.time value (0 = noon), nil if minutes is not a finite number.
function core_solarTimeOfDay.timeFromMinutes(minutes) end

--- Converts a normalized time into game time following the real sun: 0 to 0.25 = noon to sunset, 0.25 to 0.5 = sunset to midnight, 0.5 to 0.75 = midnight to sunrise, 0.75 to 1 = sunrise to noon. In a polar case, uses only solar noon. Without valid solar events, returns the normalized time unchanged.
---Source: lua/ge/extensions/core/solarTimeOfDay.lua:173
---@param normalizedTime number Normalized time; brought into 0..1 by modulo.
---@param state table See notes.
---@return number|nil  tod.time value; -1 if normalizedTime is negative; nil if non-numeric.
function core_solarTimeOfDay.timeFromNormalizedTime(normalizedTime, state) end

