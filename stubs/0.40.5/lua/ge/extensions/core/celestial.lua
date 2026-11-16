---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/celestial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Real astronomical sky driven by the level's TimeOfDay. The clock (time, play, dayLength) and the observer's place/date (latitude, longitude, year, month, day) come from the TimeOfDay; the extension positions the sun, the moon (size and phase) and the orientation of the star field at that same instant (ScatterSky object). It also handles shooting stars, solar eclipses, a per-level sky profile (atmosphere, bodies) and a detail card on hovering stars/constellations. A modder uses it to change the place, the date, the moon size, display grids or replace the sky computation (setDriver).
--- Access: extension `core_celestial`: `extensions.load("core_celestial")`, then the global `core_celestial`
---@class core_celestial
---@field hover table Public settings of the hover detail card, modifiable without forking the file: dist (16 m in front of the camera), starHeight 4.6, constHeight 2.5, rightFrac 0.82, downFrac 0.10, tilt -0.22, res 2 (texture supersampling), starPickDeg 1.5 (angular distance to pick a star), constPickDeg 6 (to pick a constellation), shimmerDist 40, shimmerRadiusFrac 0.025, shimmerColor {r,g,b}, leaderColor {r,g,b,a}, and the replacement functions starTemplate(), constTemplate(), starVars(meta), constVars(id). After replacing a *Template, call refreshHoverCards().
core_celestial = {}

--- Looks for the next solar eclipse visible from the level observer's location, starting from the current TimeOfDay instant.
---Source: lua/ge/extensions/core/celestial.lua:708
---@return table|nil  {year, month, day, time} at the eclipse maximum, nil if none in the search range or no TimeOfDay
function core_celestial.findNextSolarEclipse() end

--- Active sky profile.
---Source: lua/ge/extensions/core/celestial.lua:813
---@return table|nil  profile
function core_celestial.getActiveProfile() end

--- State of the display layers.
---Source: lua/ge/extensions/core/celestial.lua:782
---@return table  {hasSky=boolean, constellationLines=..., ...}; only hasSky if there is no sky
function core_celestial.getDisplayState() end

--- Returns the current custom sky driver.
---Source: lua/ge/extensions/core/celestial.lua:717
---@return function|nil  driver or nil if the built-in computation is used
function core_celestial.getDriver() end

--- Last hover result (constellation + star).
---Source: lua/ge/extensions/core/celestial.lua:724
---@return table|nil  card of the last hover or nil
function core_celestial.getHover() end

--- Current north offset.
---Source: lua/ge/extensions/core/celestial.lua:726
---@return number  degrees
function core_celestial.getNorthOffset() end

--- Configuration snapshot for debug tools/scripts.
---Source: lua/ge/extensions/core/celestial.lua:817
---@return table  enabled, hoverEnabled, northOffsetDeg, azimuthSign, moonScale, latitude, longitude, year, month, day, time, meteor{name,test,ratePreset,rate,showerFraction}, display
function core_celestial.getState() end

--- Tells whether the real astronomical sky is enabled.
---Source: lua/ge/extensions/core/celestial.lua:712
---@return boolean  state
function core_celestial.isEnabled() end

--- Loads or replaces the sky profile (atmosphere, bodies). The atmosphere block is pushed to ScatterSky on the next frame.
---Source: lua/ge/extensions/core/celestial.lua:806
---@param profile string|table path of a JSON or already decoded table
---@return boolean  false if the profile is neither a table nor a readable JSON
function core_celestial.loadProfile(profile) end

--- Hook: end of the level; empties the caches and forgets the profile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/celestial.lua:1103
function core_celestial.onClientEndMission() end

--- Hook: a level has just been loaded; empties the caches and reloads the sky profile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/celestial.lua:1102
function core_celestial.onClientPostStartMission() end

--- Hook: sets the extension to manual unloading.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/celestial.lua:1088
function core_celestial.onExtensionLoaded() end

--- Hook: language change; rebuilds the name atlas and the hover cards (free if nothing changes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/celestial.lua:1107
function core_celestial.onLanguageChanged() end

--- Per-frame hook: applies the profile's atmosphere, then computes the position of the sun, moon and stars from the TimeOfDay and updates hovering; or restores the original sky if disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/celestial.lua:1071
---@param dtReal number real seconds
---@param dtSim number simulation seconds (unused)
function core_celestial.onPreRender(dtReal, dtSim) end

--- Hook: hot reload of the language files; same effect as onLanguageChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/celestial.lua:1107
function core_celestial.onReloadLocales() end

--- Destroys the hover cards so they are rebuilt from M.hover on the next hover (to call after replacing a *Template).
---Source: lua/ge/extensions/core/celestial.lua:970
function core_celestial.refreshHoverCards() end

--- Self-test of the math part (JD, sun, moon, refraction, parallax, time zone, meteors, eclipses). Raises an assertion error on a mismatch.
---Source: lua/ge/extensions/core/celestial.lua:1112
---@return boolean  true if everything passes
function core_celestial.selftest() end

--- Reverses the east-west direction of the sky if the sun/stars appear mirrored.
---Source: lua/ge/extensions/core/celestial.lua:727
---@param s number negative = -1, otherwise 1
function core_celestial.setAzimuthSign(s) end

--- Writes year/month/day to the level's TimeOfDay; nil arguments are ignored.
---Source: lua/ge/extensions/core/celestial.lua:792
---@param y integer|nil year
---@param mo integer|nil month 1-12
---@param d integer|nil day
function core_celestial.setDate(y, mo, d) end

--- Enables/disables a sky display layer (see notes for valid keys). No effect if no ScatterSky or unknown key.
---Source: lua/ge/extensions/core/celestial.lua:776
---@param key string constellationLines, constellationLabels, horizonGrid, equatorialGrid, meridianGrid, moonGrid
---@param value boolean show or not
function core_celestial.setDisplayOption(key, value) end

--- Replaces the sky computation every frame. fn(ctx) receives the prefilled real sky values (ctx.sunAz/sunEl, ctx.bodies, ctx.star*, ctx.meteor*, ctx.time/jd/lst/lat/lon) and a utility ctx.altAz(raDeg, decDeg); it modifies them to move the sky. nil restores the built-in computation.
---Source: lua/ge/extensions/core/celestial.lua:716
---@param fn function|nil function fn(ctx); any non-function value is treated as nil
function core_celestial.setDriver(fn) end

--- Enables or disables the real astronomical sky (enabled by default); the transition is applied on the next frame.
---Source: lua/ge/extensions/core/celestial.lua:704
---@param on boolean true = real sky; false = restores the level's original night ambiance
function core_celestial.setEnabled(on) end

--- Enables the detail card on hovering stars (the UI overlay enables it while shown). Disabling clears the last result.
---Source: lua/ge/extensions/core/celestial.lua:720
---@param on boolean enable hovering
function core_celestial.setHoverEnabled(on) end

--- Writes latitude/longitude to the level's TimeOfDay (source of truth). Does nothing without a TimeOfDay.
---Source: lua/ge/extensions/core/celestial.lua:786
---@param latDeg number latitude in degrees (north positive)
---@param lonDeg number longitude in degrees (east positive)
function core_celestial.setLocation(latDeg, lonDeg) end

--- Chooses a shooting star rate preset.
---Source: lua/ge/extensions/core/celestial.lua:739
---@param preset string|nil default (real calendar), low (10), moderate (30), high (120); nil = default; unknown value = no effect
function core_celestial.setMeteorRatePreset(preset) end

--- Debug: forces a heavy meteor shower even out of season.
---Source: lua/ge/extensions/core/celestial.lua:736
---@param on boolean enable
function core_celestial.setMeteorTest(on) end

--- Debug: sets the shooting star rate and enables test mode.
---Source: lua/ge/extensions/core/celestial.lua:737
---@param r number meteors per minute (30 by default)
function core_celestial.setMeteorTestRate(r) end

--- Changes the moon size (applied immediately if the real sky is active).
---Source: lua/ge/extensions/core/celestial.lua:729
---@param s number scale; 0.05 by default, the levels' default (~0.2) is huge
function core_celestial.setMoonScale(s) end

--- Offsets true north relative to the world's +Y axis.
---Source: lua/ge/extensions/core/celestial.lua:725
---@param deg number degrees (0 if non-numeric)
function core_celestial.setNorthOffset(deg) end

--- Civil time zone of the observer. A level can also set tod.utcOffset / tod.dstRule directly.
---Source: lua/ge/extensions/core/celestial.lua:799
---@param stdOffsetHours number|nil standard UTC offset in hours; nil = deduced from the longitude
---@param rule string|nil daylight saving rule: auto, eu, us, au, none; nil = unchanged
function core_celestial.setTimezone(stdOffsetHours, rule) end

