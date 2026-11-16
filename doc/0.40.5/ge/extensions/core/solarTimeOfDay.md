# `core_solarTimeOfDay`

*File: `lua/ge/extensions/core/solarTimeOfDay.lua` · VM: Game Engine (GE) · 303 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_solarTimeOfDay`: `extensions.load("core_solarTimeOfDay")`, then the global `core_solarTimeOfDay`

Pure solar computations (no engine call): from a latitude, longitude, date and UTC offset, computes sunrise, solar noon, sunset and solar midnight, then converts them to the game's time convention (tod.time: 0 = noon, 0.25 = 6 pm, 0.5 = midnight, 0.75 = 6 am). Used for time-of-day choices (morning, afternoon, evening...) in the quick race menus, and handles polar cases (continuous day or night).

## Example

```lua
local state = {latitude = 45, longitude = 5, year = 2026, month = 6, day = 21}
local events = core_solarTimeOfDay.getSolarTimeOfDayEvents(state) -- local minutes
local values = core_solarTimeOfDay.getSolarTimeOfDayValues(state) -- tod.time values
```

## Notes

- The state parameter is a table {latitude, longitude (degrees, longitude positive east), year, month, day, utcOffset (h, optional), dstRule (optional)}. If utcOffset is missing, it is round(longitude/15) plus 1 if daylight saving time is active.
- dstRule: 'eu', 'us', 'au', 'none' or 'auto' (default); 'auto' chooses au (lat <= -30), eu or us (lat >= 30; us if -170 < lon < -30), otherwise none.
- The events are in whole local minutes since midnight (0 to 1439). The 'values' are in the tod.time convention (0 to 1).
- The functions return nil if fields of state are missing or non-numeric.
- Polar case: sunrise and sunset are nil and events.polar is 'day' or 'night'.
- The sunrise/sunset computation uses the zenith angle 90.833 degrees (refraction included) and the NOAA-style declination/equation of time.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_solarTimeOfDay.buildSolarTimeOfDayOptions(state, options)` | Builds the list of time-of-day options. In a polar case, returns only solarMidnight and solarNoon (translation keys ui.quickrace.tod.*). Otherwise copies each provided option adding value = solar value for its key (nil if unknown). | 265 |
| `core_solarTimeOfDay.getCivilOffsetHours(state)` | Civil time offset (hours): state.utcOffset if given, otherwise inferred from the longitude and the daylight saving rule. | 169 |
| `core_solarTimeOfDay.getSolarNightWindow(state)` | Night window: start (sunset) and end (sunrise) as tod.time values. | 256 |
| `core_solarTimeOfDay.getSolarTimeOfDayEvents(state)` | Computes the solar events in local minutes: sunrise, noon, sunset, night (solar midnight) and polar. | 200 |
| `core_solarTimeOfDay.getSolarTimeOfDayValues(state)` | Named tod.time values: sunrise, noon, sunset, night, plus morning (1/3 from sunrise to noon), earlyNoon (5/9), lateNoon (40% from noon to sunset), afternoon (70%) and evening (94%) when sunrise and sunset exist. | 252 |
| `core_solarTimeOfDay.getTimeValueForKey(key, state, options)` | Returns the tod.time value of the option whose key is given among those of buildSolarTimeOfDayOptions. | 291 |
| `core_solarTimeOfDay.timeFromMinutes(minutes)` | Converts local minutes since midnight into a tod.time value ((minutes/1440 - 0.5) modulo 1). The minutes are rounded then brought into 0..1439. | 165 |
| `core_solarTimeOfDay.timeFromNormalizedTime(normalizedTime, state)` | Converts a normalized time into game time following the real sun: 0 to 0.25 = noon to sunset, 0.25 to 0.5 = sunset to midnight, 0.5 to 0.75 = midnight to sunrise, 0.75 to 1 = sunrise to noon. In a polar case, uses only solar noon. Without valid solar events, returns the normalized time unchanged. | 173 |

### Parameter details

#### `core_solarTimeOfDay.buildSolarTimeOfDayOptions(state, options)`

Builds the list of time-of-day options. In a polar case, returns only solarMidnight and solarNoon (translation keys ui.quickrace.tod.*). Otherwise copies each provided option adding value = solar value for its key (nil if unknown).

- `state` (*table*) : See notes.
- `options` (*table[]|nil*) : Existing options with a key field (morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night, sunrise...).
- **returns**: table[] Options with a value field.

#### `core_solarTimeOfDay.getCivilOffsetHours(state)`

Civil time offset (hours): state.utcOffset if given, otherwise inferred from the longitude and the daylight saving rule.

- `state` (*table*) : See notes.
- **returns**: number|nil Offset in hours, nil if state is incomplete.

#### `core_solarTimeOfDay.getSolarNightWindow(state)`

Night window: start (sunset) and end (sunrise) as tod.time values.

- `state` (*table*) : See notes.
- **returns**: number|nil Start of night (sunset).
- **returns**: number|nil End of night (sunrise). nil if polar or state incomplete.

#### `core_solarTimeOfDay.getSolarTimeOfDayEvents(state)`

Computes the solar events in local minutes: sunrise, noon, sunset, night (solar midnight) and polar.

- `state` (*table*) : See notes.
- **returns**: {sunrise: integer|nil, noon: integer, sunset: integer|nil, night: integer, polar: string|nil}|nil Events, nil if state is incomplete.

#### `core_solarTimeOfDay.getSolarTimeOfDayValues(state)`

Named tod.time values: sunrise, noon, sunset, night, plus morning (1/3 from sunrise to noon), earlyNoon (5/9), lateNoon (40% from noon to sunset), afternoon (70%) and evening (94%) when sunrise and sunset exist.

- `state` (*table*) : See notes.
- **returns**: table<string, number>|nil Values by key, nil if state is incomplete.

#### `core_solarTimeOfDay.getTimeValueForKey(key, state, options)`

Returns the tod.time value of the option whose key is given among those of buildSolarTimeOfDayOptions.

- `key` (*string*) : Option key.
- `state` (*table*) : See notes.
- `options` (*table[]|nil*) : Candidate options.
- **returns**: number|nil Value, nil if the key is not text or not found.

#### `core_solarTimeOfDay.timeFromMinutes(minutes)`

Converts local minutes since midnight into a tod.time value ((minutes/1440 - 0.5) modulo 1). The minutes are rounded then brought into 0..1439.

- `minutes` (*number*) : Minutes since midnight.
- **returns**: number|nil tod.time value (0 = noon), nil if minutes is not a finite number.

#### `core_solarTimeOfDay.timeFromNormalizedTime(normalizedTime, state)`

Converts a normalized time into game time following the real sun: 0 to 0.25 = noon to sunset, 0.25 to 0.5 = sunset to midnight, 0.5 to 0.75 = midnight to sunrise, 0.75 to 1 = sunrise to noon. In a polar case, uses only solar noon. Without valid solar events, returns the normalized time unchanged.

- `normalizedTime` (*number*) : Normalized time; brought into 0..1 by modulo.
- `state` (*table*) : See notes.
- **returns**: number|nil tod.time value; -1 if normalizedTime is negative; nil if non-numeric.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/solarTimeOfDay.lua`.*
