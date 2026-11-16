# `freeroam_configuratorOptions_freeroamOptions`

*File: `lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua` · VM: Game Engine (GE) · 172 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_configuratorOptions_freeroamOptions`: `extensions.load("freeroam_configuratorOptions_freeroamOptions")`, then the global `freeroam_configuratorOptions_freeroamOptions`

Adds to the freeroam configurator (the level selection screen in freeroam) the freeroam-specific options: traffic mode (disabled, parked cars, normal, police), time of day, date and day progression (day/night cycle). It reacts to the hooks onFreeroamConfiguratorGetOptions (menu construction) and onFreeroamConfiguratorApplyOptions (chosen values) and writes the choices into freeroam_freeroam.spawningOptionsHelper. A modder can copy this pattern to add their own options.

## Notes

- The traffic group has order = 100, the time/date group has order = 200; each option is a table {label, icon, value, key, type, options...} where type is 'select' or 'date'.
- Without traffic support or without time options (core_levels.getTimeOfDayOptions), a disabled option with an "unsupported" text is added instead.
- Traffic modes -> spawningOptionsHelper: disabled = nothing; parkedOnly = trafficParked only; enabled = trafficMode + trafficParked; police = all three enabled.
- The default date is level.defaultDate (year, month, day) or, failing that, June 20, 2026, at 12:00 (os.time).
- The options' 'value' values are defaults; they are replaced by the current configuration on the UI side.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_configuratorOptions_freeroamOptions.getDefaultEnvironmentDate(levelName)` | Default date of a level for the environment. | 167 |
| `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorApplyOptions(options)` | Hook called when the player confirms the configurator: passes the options traffic_trafficMode, environment_timeOfDay, environment_date and environment_timePlay to freeroam_freeroam.spawningOptionsHelper (the traffic mode is converted into trafficMode, trafficPolice and trafficParked). *(internal)* *(hook)* | 149 |
| `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorGetOptions(level, options)` | Hook called when the configurator builds its options for a level: inserts the traffic and time/date/day progression groups into options. *(internal)* *(hook)* | 14 |

### Parameter details

#### `freeroam_configuratorOptions_freeroamOptions.getDefaultEnvironmentDate(levelName)`

Default date of a level for the environment.

- `levelName` (*string*) : Level name (resolved via core_levels.getLevelByName).
- **returns**: integer os.time() timestamp of the date (time set to 12:00).

#### `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorApplyOptions(options)`

Hook called when the player confirms the configurator: passes the options traffic_trafficMode, environment_timeOfDay, environment_date and environment_timePlay to freeroam_freeroam.spawningOptionsHelper (the traffic mode is converted into trafficMode, trafficPolice and trafficParked).

- `options` (*table<string, any>*) : Chosen values, keyed by the option's key.

#### `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorGetOptions(level, options)`

Hook called when the configurator builds its options for a level: inserts the traffic and time/date/day progression groups into options.

- `level` (*table*) : Level data (supportsTraffic, levelName, dir, defaultDate).
- `options` (*table[]*) : List of option groups to complete (modified in place).

## Calls into the engine (C++)

- `core_environment.` `getAuthoredDayLength`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua`.*
