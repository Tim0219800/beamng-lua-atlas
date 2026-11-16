---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/environment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_environment`: single entry point to read and modify the level environment (time of day, clouds, wind, fog, precipitation, gravity, temperature) and to load ground models (art/groundmodels.json + the level's groundModels/*.json). It acts on scene objects (TimeOfDay, CloudLayer, LevelInfo, Precipitation) found by class, turns night lights on/off according to the time, and sends the state to the UI. A modder uses it to change the time, wind or gravity by script, or to react to `onEnvironmentChanged`.
--- Access: extension `core_environment`: `extensions.load("core_environment")`, then the global `core_environment`
---@class core_environment
---@field dayCyclePresets table[] {speed, seconds}: real seconds per day/night cycle: fast 900, normal 1800, slow 7200, realtime 86400.
---@field defaultSolarTimeOfDayOptions table[] Deep copy of defaultTimeOfDayOptions, base for the astronomically computed options.
---@field defaultTimeOfDayOptions table[] List {key, value, label} of key moments: sunrise 0.775, morning 0.825, earlyNoon 0.9, noon 0, lateNoon 0.1, afternoon 0.175, evening 0.23, sunset 0.245, night 0.5. label = translation key.
---@field dependencies string[] {'core_solarTimeOfDay'}: extension loaded before this one (solar computation: night window, sunrise/sunset events).
---@field gravityPresets table[] Presets {key, title, value} in m/s² (earth -9.81, moon -1.62, mars -3.71, sun -274, jupiter -24.92, neptune -11.15, saturn -10.44, uranus -8.87, venus -8.87, mercury -3.7, pluto -0.58, zero 0, inverted earth 9.81).
---@field groundModels table<string, {cdata: any, isAlias: boolean, parent: string}> Known ground models, keys in UPPERCASE. cdata = C++ ground_model structure; isAlias/parent indicate whether the entry is an alias of another model. Rebuilt by reloadGroundModels.
---@field loadedGroundModelFiles string[] Paths of the loaded ground model JSON files (common + level). Used by onFilesChanged to detect a hot modification.
---@field simSpeedPresets table[] {key, label, value}: simulation slow-motion factors (value = divisor: 1 real time, 2 = 1/2x, 4, 10, 25, 50, 100, 1000).
---@field timeOfDayKeyToTime table<string, number> Table key -> time value for the default key moments (noon -> 0, night -> 0.5, …).
core_environment = {}

--- Indicates whether environment modifications are allowed.
---Source: lua/ge/extensions/core/environment.lua:1769
---@return boolean  State of the flag set by enableChanges (true by default).
function core_environment.canChange() end

--- Cycles the time through three values: if time < 0.2 -> 0.23 (evening), if time >= 0.5 -> 0.05 (day), otherwise -> 0.5 (night).
---Source: lua/ge/extensions/core/environment.lua:776
function core_environment.cycleTimeOfDay() end

--- Writes groundmodels_dump.json with the physical properties of each registered ground model (friction, resistance, fluid density…). Debug tool.
---Source: lua/ge/extensions/core/environment.lua:1579
function core_environment.dumpGroundModels() end

--- Allows or forbids environment modifications and notifies the UI.
---Source: lua/ge/extensions/core/environment.lua:1764
---@param enabled boolean false = the setters no longer write to the scene.
function core_environment.enableChanges(enabled) end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:833
---@return nil  nil
function core_environment.getAmbientScaleGradientFile() end

--- Searches the *.level.json files in the level folder (excluding /scenarios/) for a dayLength value explicitly written in the TimeOfDay object (the engine fills in dayLength even if absent from the file).
---Source: lua/ge/extensions/core/environment.lua:2005
---@param levelDir string Level folder.
---@return number|nil  Seconds (> 0) or nil.
function core_environment.getAuthoredDayLength(levelDir) end

--- Cloud altitude in km.
---Source: lua/ge/extensions/core/environment.lua:947
---@return number|nil  km.
function core_environment.getCloudAltitudeKm() end

--- Altitude (km) of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1107
---@param objectID integer Object id.
---@return number|nil  km.
function core_environment.getCloudAltitudeKmByID(objectID) end

--- Cirrus altitude.
---Source: lua/ge/extensions/core/environment.lua:1015
---@return number|nil  km.
function core_environment.getCloudCirrusAltitudeKm() end

--- Cirrus altitude (km) of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1120
---@param objectID integer Object id.
---@return number|nil  km.
function core_environment.getCloudCirrusAltitudeKmByID(objectID) end

--- Cirrus coverage.
---Source: lua/ge/extensions/core/environment.lua:1023
---@return number|nil  Value of the cirrusCoverage field.
function core_environment.getCloudCirrusCoverage() end

--- Cirrus coverage of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1133
---@param objectID integer Object id.
---@return number|nil  cirrusCoverage.
function core_environment.getCloudCirrusCoverageByID(objectID) end

--- Cirrus density.
---Source: lua/ge/extensions/core/environment.lua:1031
---@return number|nil  Value of the cirrusDensity field.
function core_environment.getCloudCirrusDensity() end

--- Cirrus density of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1146
---@param objectID integer Object id.
---@return number|nil  cirrusDensity.
function core_environment.getCloudCirrusDensityByID(objectID) end

--- Reads CloudLayer.coverage of the first CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:912
---@return number|nil  Coverage, nil without a CloudLayer.
function core_environment.getCloudCover() end

--- Coverage of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1041
---@param objectID integer Scene object id.
---@return number|nil  coverage.
function core_environment.getCloudCoverByID(objectID) end

--- Deprecated: logs a warning.
---Source: lua/ge/extensions/core/environment.lua:1054
---@param objectID integer Ignored.
---@return nil  Always nil.
function core_environment.getCloudExposureByID(objectID) end

--- height field of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1076
---@param objectID integer Object id.
---@return number|nil  height.
function core_environment.getCloudHeightByID(objectID) end

--- Offset of the cloud weather map (CloudLayer.getWeatherOffsetKm).
---Source: lua/ge/extensions/core/environment.lua:952
---@return vec3|nil  Offset in km; nil if the C++ API is not available.
function core_environment.getCloudWeatherOffsetKm() end

--- windSpeed of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1063
---@param objectID integer Object id.
---@return number|nil  windSpeed.
function core_environment.getCloudWindByID(objectID) end

--- Cloud wind direction.
---Source: lua/ge/extensions/core/environment.lua:929
---@return vec3|nil  vec3(x, y, 0); nil without a CloudLayer.
function core_environment.getCloudWindDirection() end

--- Wind direction of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1089
---@param objectID integer Object id.
---@return vec3|nil  vec3(x, y, 0).
function core_environment.getCloudWindDirectionByID(objectID) end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:815
---@return nil  nil
function core_environment.getColorizeGradientFile() end

--- Returns M.dayCyclePresets.
---Source: lua/ge/extensions/core/environment.lua:1982
---@return table[]  {speed, seconds}.
function core_environment.getDayCyclePresets() end

--- Duration in real seconds of the day/night cycle for a preset.
---Source: lua/ge/extensions/core/environment.lua:1986
---@param speed string 'fast', 'normal', 'slow' or 'realtime'.
---@return number|nil  900, 1800, 7200 or 86400; nil if unknown.
function core_environment.getDayCycleSeconds(speed) end

--- Returns M.defaultTimeOfDayOptions.
---Source: lua/ge/extensions/core/environment.lua:718
---@return table[]  Default key moments.
function core_environment.getDefaultTimeOfDayOptions() end

--- Fog atmosphere height.
---Source: lua/ge/extensions/core/environment.lua:1201
---@return number  0.0 without LevelInfo.
function core_environment.getFogAtmosphereHeight() end

--- Raw fog density of LevelInfo.
---Source: lua/ge/extensions/core/environment.lua:1174
---@return number  fogDensity, 0.0 without LevelInfo.
---@return userdata|nil  LevelInfo object.
function core_environment.getFogDensity() end

--- Deprecated: logs a warning.
---Source: lua/ge/extensions/core/environment.lua:1187
---@return nil  Always nil.
function core_environment.getFogDensityOffset() end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:842
---@return nil  nil
function core_environment.getFogScaleGradientFile() end

--- Level gravity (LevelInfo.gravity).
---Source: lua/ge/extensions/core/environment.lua:1223
---@return number  m/s² (negative downwards); -9.81 if LevelInfo is absent.
function core_environment.getGravity() end

--- Returns M.gravityPresets.
---Source: lua/ge/extensions/core/environment.lua:1974
---@return table[]  Gravity presets.
function core_environment.getGravityPresets() end

--- Returns the internal ground wind vec3 (direct reference, do not modify).
---Source: lua/ge/extensions/core/environment.lua:878
---@return vec3  Wind in m/s.
function core_environment.getGroundWind() end

--- Copy of the state captured at level load (onClientPostStartMission), with temperatureProfile computed on the level's original curve and possibly authoredDayLength.
---Source: lua/ge/extensions/core/environment.lua:1757
---@return table  Initial state.
function core_environment.getInitState() end

--- World lighting state: day or night. Returns {time, phase = 'day'|'night', isNight, nightLightsActive, nightStart, nightEnd}. nightLightsActive reflects what the engine actually applied.
---Source: lua/ge/extensions/core/environment.lua:541
---@return table|nil  nil if there is no TimeOfDay.
function core_environment.getLightState() end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:860
---@return nil  nil
function core_environment.getNightFogGradientFile() end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:851
---@return nil  nil
function core_environment.getNightGradientFile() end

--- Number of drops of the Precipitation object.
---Source: lua/ge/extensions/core/environment.lua:1241
---@return number|nil  nil without a Precipitation object.
function core_environment.getPrecipitation() end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:797
---@return nil  nil
function core_environment.getShadowDistance() end

--- Returns M.simSpeedPresets.
---Source: lua/ge/extensions/core/environment.lua:1978
---@return table[]  Slow-motion presets.
function core_environment.getSimSpeedPresets() end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:806
---@return nil  nil
function core_environment.getSkyBrightness() end

--- Moment options computed for the state's solar position and date, from the default options.
---Source: lua/ge/extensions/core/environment.lua:722
---@param state table|nil TimeOfDay state; default getTimeOfDay().
---@return table  Options.
function core_environment.getSolarTimeOfDayOptions(state) end

--- Time value for a moment key (e.g. 'sunrise') with the state's date/position.
---Source: lua/ge/extensions/core/environment.lua:726
---@param key string Key: sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night.
---@param state table|nil TimeOfDay state; default getTimeOfDay().
---@return number|nil  normalized time 0..1 (per core_solarTimeOfDay).
function core_environment.getSolarTimeOfDayValue(key, state) end

--- Builds the full environment state. Keys: TimeOfDay fields (time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile), windSpeed, groundWind, cloudCover, cloudWindDirection, cloudAltitudeKm, cloudWeatherOffsetKm, cloudCirrus*, fogDensity (x1000), fogAtmosphereHeight, numOfDrops, gravity, temperatureC (°C), temperatureProfile, temperatureCurveOverrideC.
---Source: lua/ge/extensions/core/environment.lua:1364
---@return table|nil  State table (never nil in practice because temperatureCurveOverrideC is always present).
function core_environment.getState() end

--- Deprecated: returns nil.
---Source: lua/ge/extensions/core/environment.lua:824
---@return nil  nil
function core_environment.getSunScaleGradientFile() end

--- Sea level air temperature currently sent to the engine.
---Source: lua/ge/extensions/core/environment.lua:1250
---@return number  Kelvins (0.0 until the curve has been evaluated).
function core_environment.getTemperatureK() end

--- Reads the TimeOfDay scene object and returns a shared state (the same table is reused on every call: copy before keeping it).
---Source: lua/ge/extensions/core/environment.lua:514
---@return table|nil  {time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile}; nil if there is no TimeOfDay object (main menu).
function core_environment.getTimeOfDay() end

--- Time-of-day options adapted to the level, computed astronomically (core_solarTimeOfDay) from the level's options (core_levels).
---Source: lua/ge/extensions/core/environment.lua:713
---@param levelIdentifier string|nil Level identifier; default getCurrentLevelIdentifier().
---@return table  List of options {key, value, label…}.
function core_environment.getTimeOfDayOptions(levelIdentifier) end

--- Converts a normalized time via core_solarTimeOfDay.timeFromNormalizedTime for the given state (exact meaning defined in core_solarTimeOfDay).
---Source: lua/ge/extensions/core/environment.lua:730
---@param normalizedTime number Normalized time.
---@param state table|nil TimeOfDay state; default getTimeOfDay().
---@return number|nil  Time value.
function core_environment.getTimeOfDayValueForNormalizedTime(normalizedTime, state) end

--- Reads CloudLayer.windSpeed of the first CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:896
---@return number|nil  nil without a CloudLayer.
function core_environment.getWindSpeed() end

--- Loads tire marks from a file.
---Source: lua/ge/extensions/core/environment.lua:1968
---@param filename string|nil Default 'tiremarks.dat'.
function core_environment.loadTireMarks(filename) end

--- Hook at level end: stops the TimeOfDay clock, resets the wind to 0, clears the night lights and calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1870
function core_environment.onClientEndMission() end

--- Hook after level start: stores the initial state (init_env), adds authoredDayLength to it then re-applies it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1782
---@param levelPath string Level path.
function core_environment.onClientPostStartMission(levelPath) end

--- Hook before a level starts: re-reads the temperature curve, removes the override, reloads the ground models.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1773
---@param levelPath string Level path.
function core_environment.onClientPreStartMission(levelPath) end

--- Hook at level start: clears the object cache, lists the night lights, applies the wind and regenerates the weather map with a random seed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1835
---@param levelPath string Level path.
function core_environment.onClientStartMission(levelPath) end

--- Restore hook: re-applies the saved ground wind.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1890
---@param data table Table returned by onSerialize.
function core_environment.onDeserialized(data) end

--- Hook after saving: restores the state of the night lights.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1863
function core_environment.onEditorAfterSaveLevel() end

--- Hook before the level is saved in the editor: turns off the night lights so they are not saved turned on.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1854
function core_environment.onEditorBeforeSaveLevel() end

--- Hook on editor exit: clears the cache and lists the night lights again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1849
function core_environment.onEditorDeactivated() end

--- Hook called when files change: if a loaded ground model file is modified, calls reset() and be:reloadCollision().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1793
---@param files table[] List of entries with a filename field.
function core_environment.onFilesChanged(files) end

--- Alias of reset: called when the extension loads.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1742
function core_environment.onInit() end

--- Save hook before extensions reload: returns {groundWind}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1887
---@return table  {groundWind = vec3}.
function core_environment.onSerialize() end

--- Per-frame hook: advances the state transition, applies the night lights and updates the effective temperature according to the time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1818
---@param dtReal number Real-time delta in seconds.
function core_environment.onUpdate(dtReal) end

--- Hook: re-applies the ground wind (alias of applyGroundWind).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:49
function core_environment.onVehicleResetted() end

--- Hook: re-applies the ground wind to vehicles (alias of applyGroundWind, receives the vehicle id but ignores it).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:49
function core_environment.onVehicleSpawned() end

--- Scans the scene for lights to turn on at night (nightLight field), lights with day/night intensity (dayIntensity/nightIntensity), and emissive TSStatics (nightEmissive or linked to a light by the `child` field), then applies the current state. To be called after adding such objects during gameplay.
---Source: lua/ge/extensions/core/environment.lua:559
function core_environment.refreshnightLightsObjects() end

--- Regenerates the weather map (cloud shape) with a seed. Called with a random seed on every level load.
---Source: lua/ge/extensions/core/environment.lua:986
---@param seed integer|nil Seed, rounded and clamped to 0..2147483647; random if nil.
---@return boolean  true if executed.
---@return integer|nil  Normalized seed used (absent if the C++ API is missing).
function core_environment.regenerateWeatherMap(seed) end

--- Resets then reloads all ground models: art/groundmodels.json, then the *.json files of <level>/groundModels/. ASPHALT is submitted first (index 0), then the others in alphabetical order. Names are uppercased and truncated to 30 characters if > 31.
---Source: lua/ge/extensions/core/environment.lua:1712
---@param levelPath string|nil Level path; default getMissionFilename().
function core_environment.reloadGroundModels(levelPath) end

--- Alias of sendState: sends the current state to the UI (guihooks EnvironmentStateUpdate) and the state of the canChange flag.
---Source: lua/ge/extensions/core/environment.lua:1812
function core_environment.requestState() end

--- Re-reads the level's temperature curve, removes the temperature override, notifies the UI and reloads the ground models. Also serves as onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/environment.lua:1742
function core_environment.reset() end

--- Resets the weather offset to (0,0,0).
---Source: lua/ge/extensions/core/environment.lua:977
---@return boolean  Result of setCloudWeatherOffsetKm.
function core_environment.resetCloudWeatherOffsetKm() end

--- Removes the override and goes back to the level's temperature curve.
---Source: lua/ge/extensions/core/environment.lua:1433
function core_environment.resetTemperatureProfile() end

--- Clears all tire marks (be:resetTireMarks).
---Source: lua/ge/extensions/core/environment.lua:1956
function core_environment.resetTireMarks() end

--- Re-applies the level's initial state (setState(init_env)).
---Source: lua/ge/extensions/core/environment.lua:1753
function core_environment.reset_init() end

--- Saves the tire marks to a file.
---Source: lua/ge/extensions/core/environment.lua:1962
---@param filename string|nil Default 'tiremarks.dat'.
function core_environment.saveTireMarks(filename) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:838
---@param ambientScaleGradientFile any Ignored.
function core_environment.setAmbientScaleGradientFile(ambientScaleGradientFile) end

--- Altitude of the cloud layer.
---Source: lua/ge/extensions/core/environment.lua:937
---@param altitudeKm number Altitude in kilometers.
function core_environment.setCloudAltitudeKm(altitudeKm) end

--- Sets the altitude (km) of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1112
---@param objectID integer Object id.
---@param altitudeKm number km.
function core_environment.setCloudAltitudeKmByID(objectID, altitudeKm) end

--- Sets the cirrus altitude.
---Source: lua/ge/extensions/core/environment.lua:1019
---@param altitudeKm number km.
function core_environment.setCloudCirrusAltitudeKm(altitudeKm) end

--- Sets the cirrus altitude of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1125
---@param objectID integer Object id.
---@param altitudeKm number km.
function core_environment.setCloudCirrusAltitudeKmByID(objectID, altitudeKm) end

--- Sets the cirrus coverage.
---Source: lua/ge/extensions/core/environment.lua:1027
---@param coverage number Value of cirrusCoverage.
function core_environment.setCloudCirrusCoverage(coverage) end

--- Sets the cirrus coverage of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1138
---@param objectID integer Object id.
---@param coverage number Coverage.
function core_environment.setCloudCirrusCoverageByID(objectID, coverage) end

--- Sets the cirrus density.
---Source: lua/ge/extensions/core/environment.lua:1035
---@param density number Value of cirrusDensity.
function core_environment.setCloudCirrusDensity(density) end

--- Sets the cirrus density of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1151
---@param objectID integer Object id.
---@param density number Density.
function core_environment.setCloudCirrusDensityByID(objectID, density) end

--- Sets CloudLayer.coverage of the first CloudLayer and cancels an ongoing state transition.
---Source: lua/ge/extensions/core/environment.lua:901
---@param cloud number Cloud coverage (lerp range 0..3 in setState).
function core_environment.setCloudCover(cloud) end

--- Sets the coverage of a specific CloudLayer (no hook, no enableChanges check).
---Source: lua/ge/extensions/core/environment.lua:1046
---@param objectID integer Object id.
---@param coverage number Coverage.
function core_environment.setCloudCoverByID(objectID, coverage) end

--- Deprecated: logs a warning, does nothing.
---Source: lua/ge/extensions/core/environment.lua:1059
---@param objectID integer Ignored.
---@param exposure any Ignored.
function core_environment.setCloudExposureByID(objectID, exposure) end

--- Sets the height field of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1081
---@param objectID integer Object id.
---@param height number Height.
function core_environment.setCloudHeightByID(objectID, height) end

--- Offsets the cloud weather map. Emits onEnvironmentChanged.
---Source: lua/ge/extensions/core/environment.lua:962
---@param ... vec3|number A vec3 or 3 numbers x, y, z in km.
---@return boolean  true if applied, false if the API is missing or changes are disabled (nil if the argument is nil).
function core_environment.setCloudWeatherOffsetKm(...) end

--- Sets windSpeed of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1068
---@param objectID integer Object id.
---@param windSpeed number Speed.
function core_environment.setCloudWindByID(objectID, windSpeed) end

--- Sets CloudLayer.windDirection (Point2F) of the first CloudLayer; only x and y are used.
---Source: lua/ge/extensions/core/environment.lua:918
---@param ... vec3|number A vec3 or two numbers x, y.
function core_environment.setCloudWindDirection(...) end

--- Sets the wind direction of a specific CloudLayer.
---Source: lua/ge/extensions/core/environment.lua:1098
---@param objectID integer Object id.
---@param ... vec3|number A vec3 or two numbers x, y.
function core_environment.setCloudWindDirectionByID(objectID, ...) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:820
---@param colorizeGradientFile any Ignored.
function core_environment.setColorizeGradientFile(colorizeGradientFile) end

--- Sets LevelInfo.FogAtmosphereHeight. Does not emit onEnvironmentChanged and ignores enableChanges.
---Source: lua/ge/extensions/core/environment.lua:1192
---@param fogHeight number Fog atmosphere height (UI range up to ~2000, inferred from lerpRanges).
function core_environment.setFogAtmosphereHeight(fogHeight) end

--- Sets LevelInfo.fogDensity (raw value, very small: the UI uses 1000x this value) and cancels an ongoing transition. Emits onEnvironmentChanged({fogDensity}) with the raw value.
---Source: lua/ge/extensions/core/environment.lua:1163
---@param fog number Raw fog density (e.g. 0.002).
function core_environment.setFogDensity(fog) end

--- Deprecated: logs a warning, does nothing.
---Source: lua/ge/extensions/core/environment.lua:1183
---@param fogOffset any Ignored.
function core_environment.setFogDensityOffset(fogOffset) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:847
---@param fogScaleGradientFile any Ignored.
function core_environment.setFogScaleGradientFile(fogScaleGradientFile) end

--- Sets gravity: writes LevelInfo.gravity (for future spawns) and sends obj:setGravity to all vehicles. Emits onEnvironmentChanged({gravity}).
---Source: lua/ge/extensions/core/environment.lua:1210
---@param grav number Acceleration in m/s², negative downwards (-9.81 = Earth). nil/false: ignored; 0 is accepted.
function core_environment.setGravity(grav) end

--- Sets the ground wind applied to the world and to all vehicles (obj:setWind + be:setGroundWind).
---Source: lua/ge/extensions/core/environment.lua:870
---@param ... vec3|number A vec3, or 3 numbers x, y, z (m/s, world frame, inferred from code).
function core_environment.setGroundWind(...) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:865
---@param nightFogGradientFile any Ignored.
function core_environment.setNightFogGradientFile(nightFogGradientFile) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:856
---@param nightGradientFile any Ignored.
function core_environment.setNightGradientFile(nightGradientFile) end

--- Sets Precipitation.numDrops (number of rain drops/particles). No hook, no enableChanges check.
---Source: lua/ge/extensions/core/environment.lua:1234
---@param rainDrops number Number of drops.
function core_environment.setPrecipitation(rainDrops) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:802
---@param shadowDistance any Ignored.
function core_environment.setShadowDistance(shadowDistance) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:811
---@param skyBrightness any Ignored.
function core_environment.setSkyBrightness(skyBrightness) end

--- Applies a state (same format as getState). Emits onEnvironmentChanged. With lerpSeconds > 0, cloudCover, fogDensity, fogAtmosphereHeight and time are interpolated (smootherstep curve, shorter duration if the gap is small, minimum 0.12 s); the other fields are applied immediately.
---Source: lua/ge/extensions/core/environment.lua:1511
---@param state table Partial or full state; fogDensity expected x1000; time optional (without time the clock is not moved).
---@param lerpSeconds number|nil Maximum transition duration in real seconds; nil or <= 0 = immediate.
function core_environment.setState(state, lerpSeconds) end

--- Deprecated: warning only.
---Source: lua/ge/extensions/core/environment.lua:829
---@param sunScaleGradientFile any Ignored.
function core_environment.setSunScaleGradientFile(sunScaleGradientFile) end

--- Creates an override of the day's temperature curve: shifts the curve to reach the average, then stretches the troughs/peaks to reach min and max. Values clamped to -50..60 °C. Ignored if enableChanges(false) or invalid table.
---Source: lua/ge/extensions/core/environment.lua:1408
---@param profile table {averageC?, minC?, maxC?} in °C; at least one finite numeric field required.
function core_environment.setTemperatureProfile(profile) end

--- Applies time-of-day fields to the TimeOfDay object. Does nothing if the table contains no known field. Emits onEnvironmentChanged and updates the night lights if time is provided. Changing year/month/day/latitude forces a recomputation of the sun position.
---Source: lua/ge/extensions/core/environment.lua:734
---@param timeOfDay table Optional fields: time (0..1, 0 = noon, 0.5 = midnight), play (boolean), dayLength (real s), startTime, latitude, longitude (degrees, inferred from code), year, month, day, utcOffset (hours), dstRule, celestialProfile (name, reloads core_celestial).
function core_environment.setTimeOfDay(timeOfDay) end

--- Sets CloudLayer.windSpeed of the first CloudLayer in the scene.
---Source: lua/ge/extensions/core/environment.lua:886
---@param windSpeed number Cloud wind speed (unit of the engine field, not specified in the code).
function core_environment.setWindSpeed(windSpeed) end

--- Sets the game time to the computer's real local time (os.date('*t')), keeping the play state.
---Source: lua/ge/extensions/core/environment.lua:1913
---@param lerpSeconds number|nil Transition duration in seconds.
function core_environment.syncTimeToRealClock(lerpSeconds) end

--- Sets the game time AND date to the real UTC instant converted to the level's time zone (utcOffset/dstRule).
---Source: lua/ge/extensions/core/environment.lua:1940
---@param lerpSeconds number|nil Transition duration in seconds.
function core_environment.syncTimeToRealClockUtc(lerpSeconds) end

