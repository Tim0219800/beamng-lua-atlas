# `core_celestial`

*File: `lua/ge/extensions/core/celestial.lua` · VM: Game Engine (GE) · 1183 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_celestial`: `extensions.load("core_celestial")`, then the global `core_celestial`

Real astronomical sky driven by the level's TimeOfDay. The clock (time, play, dayLength) and the observer's place/date (latitude, longitude, year, month, day) come from the TimeOfDay; the extension positions the sun, the moon (size and phase) and the orientation of the star field at that same instant (ScatterSky object). It also handles shooting stars, solar eclipses, a per-level sky profile (atmosphere, bodies) and a detail card on hovering stars/constellations. A modder uses it to change the place, the date, the moon size, display grids or replace the sky computation (setDriver).

## Example

```lua
core_celestial.setLocation(47.0, 8.0)   -- latitude, longitude in degrees
core_celestial.setDate(2026, 8, 12)    -- Perseids peak
core_celestial.setMoonScale(0.08)
core_celestial.setDisplayOption('constellationLines', true)
local ecl = core_celestial.findNextSolarEclipse() -- {year, month, day, time} or nil
```

## Notes

- Stays loaded between levels (setExtensionUnloadMode manual). At each level, the caches are emptied and the sky profile is re-read (onClientPostStartMission) from tod.celestialProfile (bare name -> /art/skies/profiles/<name>.json, or path starting with /) otherwise from celestial.json in the level folder; at the end of the level the profile is forgotten.
- Positioning is done in onPreRender (not onUpdate) because the C++ TimeOfDay advances its time between the two: no one-frame lag.
- Default values if the TimeOfDay has no place/date: latitude 47, longitude 8, 2026-06-20. Default moon size 0.05; north offset 0; azimuthSign 1 (set to -1 if the sky is mirrored east-west).
- The astronomical models (Schlyter's Sun and Moon, refraction, lunar parallax, civil time zone + daylight saving time) are contained in this file; setTimezone(nil) deduces the time zone from the longitude.
- Shooting star presets: default (real calendar), low = 10, moderate = 30, high = 120 meteors/min.
- setDisplayOption keys -> ScatterSky fields: constellationLines -> constellationsEnabled, constellationLabels -> constellationNamesEnabled, horizonGrid -> gridEnabled, equatorialGrid -> equatorialGridEnabled, meridianGrid -> meridianEnabled, moonGrid -> moonPathEnabled.
- Hovering sends the guihook "CelestialHover" when the target changes; selection is limited to about 16 Hz and only if the sky is visible.
- The extracted field `hover` is described here; the file's other local functions (computations, star maps, ~1000 lines) are not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_celestial.findNextSolarEclipse()` | Looks for the next solar eclipse visible from the level observer's location, starting from the current TimeOfDay instant. | 708 |
| `core_celestial.getActiveProfile()` | Active sky profile. | 813 |
| `core_celestial.getDisplayState()` | State of the display layers. | 782 |
| `core_celestial.getDriver()` | Returns the current custom sky driver. | 717 |
| `core_celestial.getHover()` | Last hover result (constellation + star). | 724 |
| `core_celestial.getNorthOffset()` | Current north offset. | 726 |
| `core_celestial.getState()` | Configuration snapshot for debug tools/scripts. | 817 |
| `core_celestial.isEnabled()` | Tells whether the real astronomical sky is enabled. | 712 |
| `core_celestial.loadProfile(profile)` | Loads or replaces the sky profile (atmosphere, bodies). The atmosphere block is pushed to ScatterSky on the next frame. | 806 |
| `core_celestial.onClientEndMission()` | Hook: end of the level; empties the caches and forgets the profile. *(internal)* *(hook)* | 1103 |
| `core_celestial.onClientPostStartMission()` | Hook: a level has just been loaded; empties the caches and reloads the sky profile. *(internal)* *(hook)* | 1102 |
| `core_celestial.onExtensionLoaded()` | Hook: sets the extension to manual unloading. *(internal)* *(hook)* | 1088 |
| `core_celestial.onLanguageChanged()` | Hook: language change; rebuilds the name atlas and the hover cards (free if nothing changes). *(internal)* *(hook)* | 1107 |
| `core_celestial.onPreRender(dtReal, dtSim)` | Per-frame hook: applies the profile's atmosphere, then computes the position of the sun, moon and stars from the TimeOfDay and updates hovering; or restores the original sky if disabled. *(internal)* *(hook)* | 1071 |
| `core_celestial.onReloadLocales()` | Hook: hot reload of the language files; same effect as onLanguageChanged. *(internal)* *(hook)* | 1107 |
| `core_celestial.refreshHoverCards()` | Destroys the hover cards so they are rebuilt from M.hover on the next hover (to call after replacing a *Template). | 970 |
| `core_celestial.selftest()` | Self-test of the math part (JD, sun, moon, refraction, parallax, time zone, meteors, eclipses). Raises an assertion error on a mismatch. | 1112 |
| `core_celestial.setAzimuthSign(s)` | Reverses the east-west direction of the sky if the sun/stars appear mirrored. | 727 |
| `core_celestial.setDate(y, mo, d)` | Writes year/month/day to the level's TimeOfDay; nil arguments are ignored. | 792 |
| `core_celestial.setDisplayOption(key, value)` | Enables/disables a sky display layer (see notes for valid keys). No effect if no ScatterSky or unknown key. | 776 |
| `core_celestial.setDriver(fn)` | Replaces the sky computation every frame. fn(ctx) receives the prefilled real sky values (ctx.sunAz/sunEl, ctx.bodies, ctx.star*, ctx.meteor*, ctx.time/jd/lst/lat/lon) and a utility ctx.altAz(raDeg, decDeg); it modifies them to move the sky. nil restores the built-in computation. | 716 |
| `core_celestial.setEnabled(on)` | Enables or disables the real astronomical sky (enabled by default); the transition is applied on the next frame. | 704 |
| `core_celestial.setHoverEnabled(on)` | Enables the detail card on hovering stars (the UI overlay enables it while shown). Disabling clears the last result. | 720 |
| `core_celestial.setLocation(latDeg, lonDeg)` | Writes latitude/longitude to the level's TimeOfDay (source of truth). Does nothing without a TimeOfDay. | 786 |
| `core_celestial.setMeteorRatePreset(preset)` | Chooses a shooting star rate preset. | 739 |
| `core_celestial.setMeteorTest(on)` | Debug: forces a heavy meteor shower even out of season. | 736 |
| `core_celestial.setMeteorTestRate(r)` | Debug: sets the shooting star rate and enables test mode. | 737 |
| `core_celestial.setMoonScale(s)` | Changes the moon size (applied immediately if the real sky is active). | 729 |
| `core_celestial.setNorthOffset(deg)` | Offsets true north relative to the world's +Y axis. | 725 |
| `core_celestial.setTimezone(stdOffsetHours, rule)` | Civil time zone of the observer. A level can also set tod.utcOffset / tod.dstRule directly. | 799 |

### Parameter details

#### `core_celestial.findNextSolarEclipse()`

Looks for the next solar eclipse visible from the level observer's location, starting from the current TimeOfDay instant.

- **returns**: table|nil {year, month, day, time} at the eclipse maximum, nil if none in the search range or no TimeOfDay

#### `core_celestial.getActiveProfile()`

Active sky profile.

- **returns**: table|nil profile

#### `core_celestial.getDisplayState()`

State of the display layers.

- **returns**: table {hasSky=boolean, constellationLines=..., ...}; only hasSky if there is no sky

#### `core_celestial.getDriver()`

Returns the current custom sky driver.

- **returns**: function|nil driver or nil if the built-in computation is used

#### `core_celestial.getHover()`

Last hover result (constellation + star).

- **returns**: table|nil card of the last hover or nil

#### `core_celestial.getNorthOffset()`

Current north offset.

- **returns**: number degrees

#### `core_celestial.getState()`

Configuration snapshot for debug tools/scripts.

- **returns**: table enabled, hoverEnabled, northOffsetDeg, azimuthSign, moonScale, latitude, longitude, year, month, day, time, meteor{name,test,ratePreset,rate,showerFraction}, display

#### `core_celestial.isEnabled()`

Tells whether the real astronomical sky is enabled.

- **returns**: boolean state

#### `core_celestial.loadProfile(profile)`

Loads or replaces the sky profile (atmosphere, bodies). The atmosphere block is pushed to ScatterSky on the next frame.

- `profile` (*string|table*) : path of a JSON or already decoded table
- **returns**: boolean false if the profile is neither a table nor a readable JSON

#### `core_celestial.onPreRender(dtReal, dtSim)`

Per-frame hook: applies the profile's atmosphere, then computes the position of the sun, moon and stars from the TimeOfDay and updates hovering; or restores the original sky if disabled.

- `dtReal` (*number*) : real seconds
- `dtSim` (*number*) : simulation seconds (unused)

#### `core_celestial.selftest()`

Self-test of the math part (JD, sun, moon, refraction, parallax, time zone, meteors, eclipses). Raises an assertion error on a mismatch.

- **returns**: boolean true if everything passes

#### `core_celestial.setAzimuthSign(s)`

Reverses the east-west direction of the sky if the sun/stars appear mirrored.

- `s` (*number*) : negative = -1, otherwise 1

#### `core_celestial.setDate(y, mo, d)`

Writes year/month/day to the level's TimeOfDay; nil arguments are ignored.

- `y` (*integer|nil*) : year
- `mo` (*integer|nil*) : month 1-12
- `d` (*integer|nil*) : day

#### `core_celestial.setDisplayOption(key, value)`

Enables/disables a sky display layer (see notes for valid keys). No effect if no ScatterSky or unknown key.

- `key` (*string*) : constellationLines, constellationLabels, horizonGrid, equatorialGrid, meridianGrid, moonGrid
- `value` (*boolean*) : show or not

#### `core_celestial.setDriver(fn)`

Replaces the sky computation every frame. fn(ctx) receives the prefilled real sky values (ctx.sunAz/sunEl, ctx.bodies, ctx.star*, ctx.meteor*, ctx.time/jd/lst/lat/lon) and a utility ctx.altAz(raDeg, decDeg); it modifies them to move the sky. nil restores the built-in computation.

- `fn` (*function|nil*) : function fn(ctx); any non-function value is treated as nil

#### `core_celestial.setEnabled(on)`

Enables or disables the real astronomical sky (enabled by default); the transition is applied on the next frame.

- `on` (*boolean*) : true = real sky; false = restores the level's original night ambiance

#### `core_celestial.setHoverEnabled(on)`

Enables the detail card on hovering stars (the UI overlay enables it while shown). Disabling clears the last result.

- `on` (*boolean*) : enable hovering

#### `core_celestial.setLocation(latDeg, lonDeg)`

Writes latitude/longitude to the level's TimeOfDay (source of truth). Does nothing without a TimeOfDay.

- `latDeg` (*number*) : latitude in degrees (north positive)
- `lonDeg` (*number*) : longitude in degrees (east positive)

#### `core_celestial.setMeteorRatePreset(preset)`

Chooses a shooting star rate preset.

- `preset` (*string|nil*) : default (real calendar), low (10), moderate (30), high (120); nil = default; unknown value = no effect

#### `core_celestial.setMeteorTest(on)`

Debug: forces a heavy meteor shower even out of season.

- `on` (*boolean*) : enable

#### `core_celestial.setMeteorTestRate(r)`

Debug: sets the shooting star rate and enables test mode.

- `r` (*number*) : meteors per minute (30 by default)

#### `core_celestial.setMoonScale(s)`

Changes the moon size (applied immediately if the real sky is active).

- `s` (*number*) : scale; 0.05 by default, the levels' default (~0.2) is huge

#### `core_celestial.setNorthOffset(deg)`

Offsets true north relative to the world's +Y axis.

- `deg` (*number*) : degrees (0 if non-numeric)

#### `core_celestial.setTimezone(stdOffsetHours, rule)`

Civil time zone of the observer. A level can also set tod.utcOffset / tod.dstRule directly.

- `stdOffsetHours` (*number|nil*) : standard UTC offset in hours; nil = deduced from the longitude
- `rule` (*string|nil*) : daylight saving rule: auto, eu, us, au, none; nil = unchanged

## Fields

| Field | Type | Description |
|---|---|---|
| `hover` | table | Public settings of the hover detail card, modifiable without forking the file: dist (16 m in front of the camera), starHeight 4.6, constHeight 2.5, rightFrac 0.82, downFrac 0.10, tilt -0.22, res 2 (texture supersampling), starPickDeg 1.5 (angular distance to pick a star), constPickDeg 6 (to pick a constellation), shimmerDist 40, shimmerRadiusFrac 0.025, shimmerColor {r,g,b}, leaderColor {r,g,b,a}, and the replacement functions starTemplate(), constTemplate(), starVars(meta), constVars(id). After replacing a *Template, call refreshHoverCards(). |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLine`
- `obj:` `getID`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/celestial.lua`.*
