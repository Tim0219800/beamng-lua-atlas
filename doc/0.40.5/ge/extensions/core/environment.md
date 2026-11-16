# `core_environment`

*File: `lua/ge/extensions/core/environment.lua` · VM: Game Engine (GE) · 2135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_environment`: `extensions.load("core_environment")`, then the global `core_environment`

GE extension `core_environment`: single entry point to read and modify the level environment (time of day, clouds, wind, fog, precipitation, gravity, temperature) and to load ground models (art/groundmodels.json + the level's groundModels/*.json). It acts on scene objects (TimeOfDay, CloudLayer, LevelInfo, Precipitation) found by class, turns night lights on/off according to the time, and sends the state to the UI. A modder uses it to change the time, wind or gravity by script, or to react to `onEnvironmentChanged`.

## Example

```lua
extensions.load('core_environment')
-- noon (time = 0), day lasting 30 real minutes, clock running
core_environment.setTimeOfDay({time = 0, play = true, dayLength = 1800})
core_environment.setGravity(-1.62)            -- m/s², negative = downwards
core_environment.setGroundWind(5, 0, 0)       -- m/s in world frame
core_environment.setFogDensity(0.002)         -- raw LevelInfo value
print(core_environment.getTemperatureK() - 273.15)
```

## Notes

- Time: `time` is normalized 0..1 and wraps (modulo 1). 0 = noon (key `noon`), 0.25 = roughly sunset (`sunset` 0.245), 0.5 = midnight (`night`), 0.775 = sunrise. To convert a clock time: time = (seconds_since_midnight / 86400 - 0.5) % 1 (formula used by syncTimeToRealClock).
- `dayLength` = real seconds for a full day/night cycle (presets: 900, 1800, 7200, 86400). `play` enables time flow (also writes the legacy `animate` field).
- Gravity: m/s², NEGATIVE value to go downwards (-9.81 by default, fallback of getGravity). 0 = weightlessness, +9.81 = inverted gravity. setGravity updates LevelInfo.gravity AND sends obj:setGravity to all vehicles (queueAllObjectLua).
- Wind: setGroundWind(x,y,z) is a world vec3 in m/s (inferred from code: passed as is to be:setGroundWind and obj:setWind). setWindSpeed/getWindSpeed act on CloudLayer.windSpeed (cloud movement speed), not on the physical wind of vehicles.
- Fog: LevelInfo.fogDensity is a very small raw value; the UI manipulates fogDensity*1000 (getState returns fogDensity*1000, applyStateNow divides by 1000). The setFogDensity/getFogDensity functions use the raw value. fogAtmosphereHeight: fog atmosphere height (UI lerp range ~0..2000, inferred from lerpRanges).
- Clouds: altitudes in kilometers (`...Km`), coverage of CloudLayer (lerp range 0..3 in setState), cirrus coverage/density are the cirrusCoverage/cirrusDensity fields of CloudLayer. The `...ByID` variants target a specific CloudLayer by scene object id; they do not emit onEnvironmentChanged and ignore enableChanges.
- Temperature: getTemperatureK() returns kelvins (sea level temperature sent to the engine via be:setSeaLevelTemperatureK). The level curve (LevelInfo:getTemperatureCurveC, in °C, points {t 0..1, °C}) is evaluated according to the time at each onUpdate. setTemperatureProfile works in °C, clamped to -50..60 (UI); the override curve is clamped to -273.15..200 °C at normalization.
- enableChanges(false) blocks all writes to the scene (but the onEnvironmentChanged hooks are still emitted for most setters). Used by scenarios to freeze the sky.
- Emitted hook: `onEnvironmentChanged(changedTable)` on each setter (except during a global state update). UI events: `EnvironmentStateUpdate` (full state) and `EnvironmentCanUpdateChanged` (boolean).
- Deprecated functions that only log a warning and return nil: get/setShadowDistance, get/setSkyBrightness, all get/set...GradientFile, get/setFogDensityOffset, get/setCloudExposureByID.
- Inconsistencies: setFogDensityOffset is exported (M.setFogDensityOffset) but absent from the automatic list; setFogAtmosphereHeight does not emit onEnvironmentChanged unlike setFogDensity; setPrecipitation emits no hook and ignores enableChanges; the internal setTemperatureK is not exported (no direct temperature setting, only via setTemperatureProfile). onVehicleResetted and onVehicleSpawned are both bound to applyGroundWind (re-applies the wind to vehicles).

**Dependencies (loaded first):** `core_solarTimeOfDay`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_environment.canChange()` | Indicates whether environment modifications are allowed. | 1769 |
| `core_environment.cycleTimeOfDay()` | Cycles the time through three values: if time < 0.2 -> 0.23 (evening), if time >= 0.5 -> 0.05 (day), otherwise -> 0.5 (night). | 776 |
| `core_environment.dumpGroundModels()` | Writes groundmodels_dump.json with the physical properties of each registered ground model (friction, resistance, fluid density…). Debug tool. | 1579 |
| `core_environment.enableChanges(enabled)` | Allows or forbids environment modifications and notifies the UI. | 1764 |
| `core_environment.getAmbientScaleGradientFile()` | Deprecated: returns nil. | 833 |
| `core_environment.getAuthoredDayLength(levelDir)` | Searches the *.level.json files in the level folder (excluding /scenarios/) for a dayLength value explicitly written in the TimeOfDay object (the engine fills in dayLength even if absent from the file). | 2005 |
| `core_environment.getCloudAltitudeKm()` | Cloud altitude in km. | 947 |
| `core_environment.getCloudAltitudeKmByID(objectID)` | Altitude (km) of a specific CloudLayer. | 1107 |
| `core_environment.getCloudCirrusAltitudeKm()` | Cirrus altitude. | 1015 |
| `core_environment.getCloudCirrusAltitudeKmByID(objectID)` | Cirrus altitude (km) of a specific CloudLayer. | 1120 |
| `core_environment.getCloudCirrusCoverage()` | Cirrus coverage. | 1023 |
| `core_environment.getCloudCirrusCoverageByID(objectID)` | Cirrus coverage of a specific CloudLayer. | 1133 |
| `core_environment.getCloudCirrusDensity()` | Cirrus density. | 1031 |
| `core_environment.getCloudCirrusDensityByID(objectID)` | Cirrus density of a specific CloudLayer. | 1146 |
| `core_environment.getCloudCover()` | Reads CloudLayer.coverage of the first CloudLayer. | 912 |
| `core_environment.getCloudCoverByID(objectID)` | Coverage of a specific CloudLayer. | 1041 |
| `core_environment.getCloudExposureByID(objectID)` | Deprecated: logs a warning. | 1054 |
| `core_environment.getCloudHeightByID(objectID)` | height field of a specific CloudLayer. | 1076 |
| `core_environment.getCloudWeatherOffsetKm()` | Offset of the cloud weather map (CloudLayer.getWeatherOffsetKm). | 952 |
| `core_environment.getCloudWindByID(objectID)` | windSpeed of a specific CloudLayer. | 1063 |
| `core_environment.getCloudWindDirection()` | Cloud wind direction. | 929 |
| `core_environment.getCloudWindDirectionByID(objectID)` | Wind direction of a specific CloudLayer. | 1089 |
| `core_environment.getColorizeGradientFile()` | Deprecated: returns nil. | 815 |
| `core_environment.getDayCyclePresets()` | Returns M.dayCyclePresets. | 1982 |
| `core_environment.getDayCycleSeconds(speed)` | Duration in real seconds of the day/night cycle for a preset. | 1986 |
| `core_environment.getDefaultTimeOfDayOptions()` | Returns M.defaultTimeOfDayOptions. | 718 |
| `core_environment.getFogAtmosphereHeight()` | Fog atmosphere height. | 1201 |
| `core_environment.getFogDensity()` | Raw fog density of LevelInfo. | 1174 |
| `core_environment.getFogDensityOffset()` | Deprecated: logs a warning. | 1187 |
| `core_environment.getFogScaleGradientFile()` | Deprecated: returns nil. | 842 |
| `core_environment.getGravity()` | Level gravity (LevelInfo.gravity). | 1223 |
| `core_environment.getGravityPresets()` | Returns M.gravityPresets. | 1974 |
| `core_environment.getGroundWind()` | Returns the internal ground wind vec3 (direct reference, do not modify). | 878 |
| `core_environment.getInitState()` | Copy of the state captured at level load (onClientPostStartMission), with temperatureProfile computed on the level's original curve and possibly authoredDayLength. | 1757 |
| `core_environment.getLightState()` | World lighting state: day or night. Returns {time, phase = 'day'\|'night', isNight, nightLightsActive, nightStart, nightEnd}. nightLightsActive reflects what the engine actually applied. | 541 |
| `core_environment.getNightFogGradientFile()` | Deprecated: returns nil. | 860 |
| `core_environment.getNightGradientFile()` | Deprecated: returns nil. | 851 |
| `core_environment.getPrecipitation()` | Number of drops of the Precipitation object. | 1241 |
| `core_environment.getShadowDistance()` | Deprecated: returns nil. | 797 |
| `core_environment.getSimSpeedPresets()` | Returns M.simSpeedPresets. | 1978 |
| `core_environment.getSkyBrightness()` | Deprecated: returns nil. | 806 |
| `core_environment.getSolarTimeOfDayOptions(state)` | Moment options computed for the state's solar position and date, from the default options. | 722 |
| `core_environment.getSolarTimeOfDayValue(key, state)` | Time value for a moment key (e.g. 'sunrise') with the state's date/position. | 726 |
| `core_environment.getState()` | Builds the full environment state. Keys: TimeOfDay fields (time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile), windSpeed, groundWind, cloudCover, cloudWindDirection, cloudAltitudeKm, cloudWeatherOffsetKm, cloudCirrus*, fogDensity (x1000), fogAtmosphereHeight, numOfDrops, gravity, temperatureC (°C), temperatureProfile, temperatureCurveOverrideC. | 1364 |
| `core_environment.getSunScaleGradientFile()` | Deprecated: returns nil. | 824 |
| `core_environment.getTemperatureK()` | Sea level air temperature currently sent to the engine. | 1250 |
| `core_environment.getTimeOfDay()` | Reads the TimeOfDay scene object and returns a shared state (the same table is reused on every call: copy before keeping it). | 514 |
| `core_environment.getTimeOfDayOptions(levelIdentifier)` | Time-of-day options adapted to the level, computed astronomically (core_solarTimeOfDay) from the level's options (core_levels). | 713 |
| `core_environment.getTimeOfDayValueForNormalizedTime(normalizedTime, state)` | Converts a normalized time via core_solarTimeOfDay.timeFromNormalizedTime for the given state (exact meaning defined in core_solarTimeOfDay). | 730 |
| `core_environment.getWindSpeed()` | Reads CloudLayer.windSpeed of the first CloudLayer. | 896 |
| `core_environment.loadTireMarks(filename)` | Loads tire marks from a file. | 1968 |
| `core_environment.onClientEndMission()` | Hook at level end: stops the TimeOfDay clock, resets the wind to 0, clears the night lights and calls reset. *(internal)* *(hook)* | 1870 |
| `core_environment.onClientPostStartMission(levelPath)` | Hook after level start: stores the initial state (init_env), adds authoredDayLength to it then re-applies it. *(internal)* *(hook)* | 1782 |
| `core_environment.onClientPreStartMission(levelPath)` | Hook before a level starts: re-reads the temperature curve, removes the override, reloads the ground models. *(internal)* *(hook)* | 1773 |
| `core_environment.onClientStartMission(levelPath)` | Hook at level start: clears the object cache, lists the night lights, applies the wind and regenerates the weather map with a random seed. *(internal)* *(hook)* | 1835 |
| `core_environment.onDeserialized(data)` | Restore hook: re-applies the saved ground wind. *(internal)* *(hook)* | 1890 |
| `core_environment.onEditorAfterSaveLevel()` | Hook after saving: restores the state of the night lights. *(internal)* *(hook)* | 1863 |
| `core_environment.onEditorBeforeSaveLevel()` | Hook before the level is saved in the editor: turns off the night lights so they are not saved turned on. *(internal)* *(hook)* | 1854 |
| `core_environment.onEditorDeactivated()` | Hook on editor exit: clears the cache and lists the night lights again. *(internal)* *(hook)* | 1849 |
| `core_environment.onFilesChanged(files)` | Hook called when files change: if a loaded ground model file is modified, calls reset() and be:reloadCollision(). *(internal)* *(hook)* | 1793 |
| `core_environment.onInit()` | Alias of reset: called when the extension loads. *(internal)* *(hook)* | 1742 |
| `core_environment.onSerialize()` | Save hook before extensions reload: returns {groundWind}. *(internal)* *(hook)* | 1887 |
| `core_environment.onUpdate(dtReal)` | Per-frame hook: advances the state transition, applies the night lights and updates the effective temperature according to the time. *(internal)* *(hook)* | 1818 |
| `core_environment.onVehicleResetted()` | Hook: re-applies the ground wind (alias of applyGroundWind). *(internal)* *(hook)* | 49 |
| `core_environment.onVehicleSpawned()` | Hook: re-applies the ground wind to vehicles (alias of applyGroundWind, receives the vehicle id but ignores it). *(internal)* *(hook)* | 49 |
| `core_environment.refreshnightLightsObjects()` | Scans the scene for lights to turn on at night (nightLight field), lights with day/night intensity (dayIntensity/nightIntensity), and emissive TSStatics (nightEmissive or linked to a light by the `child` field), then applies the current state. To be called after adding such objects during gameplay. | 559 |
| `core_environment.regenerateWeatherMap(seed)` | Regenerates the weather map (cloud shape) with a seed. Called with a random seed on every level load. | 986 |
| `core_environment.reloadGroundModels(levelPath)` | Resets then reloads all ground models: art/groundmodels.json, then the *.json files of <level>/groundModels/. ASPHALT is submitted first (index 0), then the others in alphabetical order. Names are uppercased and truncated to 30 characters if > 31. | 1712 |
| `core_environment.requestState()` | Alias of sendState: sends the current state to the UI (guihooks EnvironmentStateUpdate) and the state of the canChange flag. | 1812 |
| `core_environment.reset()` | Re-reads the level's temperature curve, removes the temperature override, notifies the UI and reloads the ground models. Also serves as onInit. *(internal)* | 1742 |
| `core_environment.resetCloudWeatherOffsetKm()` | Resets the weather offset to (0,0,0). | 977 |
| `core_environment.resetTemperatureProfile()` | Removes the override and goes back to the level's temperature curve. | 1433 |
| `core_environment.resetTireMarks()` | Clears all tire marks (be:resetTireMarks). | 1956 |
| `core_environment.reset_init()` | Re-applies the level's initial state (setState(init_env)). | 1753 |
| `core_environment.saveTireMarks(filename)` | Saves the tire marks to a file. | 1962 |
| `core_environment.setAmbientScaleGradientFile(ambientScaleGradientFile)` | Deprecated: warning only. | 838 |
| `core_environment.setCloudAltitudeKm(altitudeKm)` | Altitude of the cloud layer. | 937 |
| `core_environment.setCloudAltitudeKmByID(objectID, altitudeKm)` | Sets the altitude (km) of a specific CloudLayer. | 1112 |
| `core_environment.setCloudCirrusAltitudeKm(altitudeKm)` | Sets the cirrus altitude. | 1019 |
| `core_environment.setCloudCirrusAltitudeKmByID(objectID, altitudeKm)` | Sets the cirrus altitude of a specific CloudLayer. | 1125 |
| `core_environment.setCloudCirrusCoverage(coverage)` | Sets the cirrus coverage. | 1027 |
| `core_environment.setCloudCirrusCoverageByID(objectID, coverage)` | Sets the cirrus coverage of a specific CloudLayer. | 1138 |
| `core_environment.setCloudCirrusDensity(density)` | Sets the cirrus density. | 1035 |
| `core_environment.setCloudCirrusDensityByID(objectID, density)` | Sets the cirrus density of a specific CloudLayer. | 1151 |
| `core_environment.setCloudCover(cloud)` | Sets CloudLayer.coverage of the first CloudLayer and cancels an ongoing state transition. | 901 |
| `core_environment.setCloudCoverByID(objectID, coverage)` | Sets the coverage of a specific CloudLayer (no hook, no enableChanges check). | 1046 |
| `core_environment.setCloudExposureByID(objectID, exposure)` | Deprecated: logs a warning, does nothing. | 1059 |
| `core_environment.setCloudHeightByID(objectID, height)` | Sets the height field of a specific CloudLayer. | 1081 |
| `core_environment.setCloudWeatherOffsetKm(...)` | Offsets the cloud weather map. Emits onEnvironmentChanged. | 962 |
| `core_environment.setCloudWindByID(objectID, windSpeed)` | Sets windSpeed of a specific CloudLayer. | 1068 |
| `core_environment.setCloudWindDirection(...)` | Sets CloudLayer.windDirection (Point2F) of the first CloudLayer; only x and y are used. | 918 |
| `core_environment.setCloudWindDirectionByID(objectID, ...)` | Sets the wind direction of a specific CloudLayer. | 1098 |
| `core_environment.setColorizeGradientFile(colorizeGradientFile)` | Deprecated: warning only. | 820 |
| `core_environment.setFogAtmosphereHeight(fogHeight)` | Sets LevelInfo.FogAtmosphereHeight. Does not emit onEnvironmentChanged and ignores enableChanges. | 1192 |
| `core_environment.setFogDensity(fog)` | Sets LevelInfo.fogDensity (raw value, very small: the UI uses 1000x this value) and cancels an ongoing transition. Emits onEnvironmentChanged({fogDensity}) with the raw value. | 1163 |
| `core_environment.setFogDensityOffset(fogOffset)` | Deprecated: logs a warning, does nothing. | 1183 |
| `core_environment.setFogScaleGradientFile(fogScaleGradientFile)` | Deprecated: warning only. | 847 |
| `core_environment.setGravity(grav)` | Sets gravity: writes LevelInfo.gravity (for future spawns) and sends obj:setGravity to all vehicles. Emits onEnvironmentChanged({gravity}). | 1210 |
| `core_environment.setGroundWind(...)` | Sets the ground wind applied to the world and to all vehicles (obj:setWind + be:setGroundWind). | 870 |
| `core_environment.setNightFogGradientFile(nightFogGradientFile)` | Deprecated: warning only. | 865 |
| `core_environment.setNightGradientFile(nightGradientFile)` | Deprecated: warning only. | 856 |
| `core_environment.setPrecipitation(rainDrops)` | Sets Precipitation.numDrops (number of rain drops/particles). No hook, no enableChanges check. | 1234 |
| `core_environment.setShadowDistance(shadowDistance)` | Deprecated: warning only. | 802 |
| `core_environment.setSkyBrightness(skyBrightness)` | Deprecated: warning only. | 811 |
| `core_environment.setState(state, lerpSeconds)` | Applies a state (same format as getState). Emits onEnvironmentChanged. With lerpSeconds > 0, cloudCover, fogDensity, fogAtmosphereHeight and time are interpolated (smootherstep curve, shorter duration if the gap is small, minimum 0.12 s); the other fields are applied immediately. | 1511 |
| `core_environment.setSunScaleGradientFile(sunScaleGradientFile)` | Deprecated: warning only. | 829 |
| `core_environment.setTemperatureProfile(profile)` | Creates an override of the day's temperature curve: shifts the curve to reach the average, then stretches the troughs/peaks to reach min and max. Values clamped to -50..60 °C. Ignored if enableChanges(false) or invalid table. | 1408 |
| `core_environment.setTimeOfDay(timeOfDay)` | Applies time-of-day fields to the TimeOfDay object. Does nothing if the table contains no known field. Emits onEnvironmentChanged and updates the night lights if time is provided. Changing year/month/day/latitude forces a recomputation of the sun position. | 734 |
| `core_environment.setWindSpeed(windSpeed)` | Sets CloudLayer.windSpeed of the first CloudLayer in the scene. | 886 |
| `core_environment.syncTimeToRealClock(lerpSeconds)` | Sets the game time to the computer's real local time (os.date('*t')), keeping the play state. | 1913 |
| `core_environment.syncTimeToRealClockUtc(lerpSeconds)` | Sets the game time AND date to the real UTC instant converted to the level's time zone (utcOffset/dstRule). | 1940 |

### Parameter details

#### `core_environment.canChange()`

Indicates whether environment modifications are allowed.

- **returns**: boolean State of the flag set by enableChanges (true by default).

#### `core_environment.enableChanges(enabled)`

Allows or forbids environment modifications and notifies the UI.

- `enabled` (*boolean*) : false = the setters no longer write to the scene.

#### `core_environment.getAmbientScaleGradientFile()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getAuthoredDayLength(levelDir)`

Searches the *.level.json files in the level folder (excluding /scenarios/) for a dayLength value explicitly written in the TimeOfDay object (the engine fills in dayLength even if absent from the file).

- `levelDir` (*string*) : Level folder.
- **returns**: number|nil Seconds (> 0) or nil.

#### `core_environment.getCloudAltitudeKm()`

Cloud altitude in km.

- **returns**: number|nil km.

#### `core_environment.getCloudAltitudeKmByID(objectID)`

Altitude (km) of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: number|nil km.

#### `core_environment.getCloudCirrusAltitudeKm()`

Cirrus altitude.

- **returns**: number|nil km.

#### `core_environment.getCloudCirrusAltitudeKmByID(objectID)`

Cirrus altitude (km) of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: number|nil km.

#### `core_environment.getCloudCirrusCoverage()`

Cirrus coverage.

- **returns**: number|nil Value of the cirrusCoverage field.

#### `core_environment.getCloudCirrusCoverageByID(objectID)`

Cirrus coverage of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: number|nil cirrusCoverage.

#### `core_environment.getCloudCirrusDensity()`

Cirrus density.

- **returns**: number|nil Value of the cirrusDensity field.

#### `core_environment.getCloudCirrusDensityByID(objectID)`

Cirrus density of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: number|nil cirrusDensity.

#### `core_environment.getCloudCover()`

Reads CloudLayer.coverage of the first CloudLayer.

- **returns**: number|nil Coverage, nil without a CloudLayer.

#### `core_environment.getCloudCoverByID(objectID)`

Coverage of a specific CloudLayer.

- `objectID` (*integer*) : Scene object id.
- **returns**: number|nil coverage.

#### `core_environment.getCloudExposureByID(objectID)`

Deprecated: logs a warning.

- `objectID` (*integer*) : Ignored.
- **returns**: nil Always nil.

#### `core_environment.getCloudHeightByID(objectID)`

height field of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: number|nil height.

#### `core_environment.getCloudWeatherOffsetKm()`

Offset of the cloud weather map (CloudLayer.getWeatherOffsetKm).

- **returns**: vec3|nil Offset in km; nil if the C++ API is not available.

#### `core_environment.getCloudWindByID(objectID)`

windSpeed of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: number|nil windSpeed.

#### `core_environment.getCloudWindDirection()`

Cloud wind direction.

- **returns**: vec3|nil vec3(x, y, 0); nil without a CloudLayer.

#### `core_environment.getCloudWindDirectionByID(objectID)`

Wind direction of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- **returns**: vec3|nil vec3(x, y, 0).

#### `core_environment.getColorizeGradientFile()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getDayCyclePresets()`

Returns M.dayCyclePresets.

- **returns**: table[] {speed, seconds}.

#### `core_environment.getDayCycleSeconds(speed)`

Duration in real seconds of the day/night cycle for a preset.

- `speed` (*string*) : 'fast', 'normal', 'slow' or 'realtime'.
- **returns**: number|nil 900, 1800, 7200 or 86400; nil if unknown.

#### `core_environment.getDefaultTimeOfDayOptions()`

Returns M.defaultTimeOfDayOptions.

- **returns**: table[] Default key moments.

#### `core_environment.getFogAtmosphereHeight()`

Fog atmosphere height.

- **returns**: number 0.0 without LevelInfo.

#### `core_environment.getFogDensity()`

Raw fog density of LevelInfo.

- **returns**: number fogDensity, 0.0 without LevelInfo.
- **returns**: userdata|nil LevelInfo object.

#### `core_environment.getFogDensityOffset()`

Deprecated: logs a warning.

- **returns**: nil Always nil.

#### `core_environment.getFogScaleGradientFile()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getGravity()`

Level gravity (LevelInfo.gravity).

- **returns**: number m/s² (negative downwards); -9.81 if LevelInfo is absent.

#### `core_environment.getGravityPresets()`

Returns M.gravityPresets.

- **returns**: table[] Gravity presets.

#### `core_environment.getGroundWind()`

Returns the internal ground wind vec3 (direct reference, do not modify).

- **returns**: vec3 Wind in m/s.

#### `core_environment.getInitState()`

Copy of the state captured at level load (onClientPostStartMission), with temperatureProfile computed on the level's original curve and possibly authoredDayLength.

- **returns**: table Initial state.

#### `core_environment.getLightState()`

World lighting state: day or night. Returns {time, phase = 'day'|'night', isNight, nightLightsActive, nightStart, nightEnd}. nightLightsActive reflects what the engine actually applied.

- **returns**: table|nil nil if there is no TimeOfDay.

#### `core_environment.getNightFogGradientFile()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getNightGradientFile()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getPrecipitation()`

Number of drops of the Precipitation object.

- **returns**: number|nil nil without a Precipitation object.

#### `core_environment.getShadowDistance()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getSimSpeedPresets()`

Returns M.simSpeedPresets.

- **returns**: table[] Slow-motion presets.

#### `core_environment.getSkyBrightness()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getSolarTimeOfDayOptions(state)`

Moment options computed for the state's solar position and date, from the default options.

- `state` (*table|nil*) : TimeOfDay state; default getTimeOfDay().
- **returns**: table Options.

#### `core_environment.getSolarTimeOfDayValue(key, state)`

Time value for a moment key (e.g. 'sunrise') with the state's date/position.

- `key` (*string*) : Key: sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night.
- `state` (*table|nil*) : TimeOfDay state; default getTimeOfDay().
- **returns**: number|nil normalized time 0..1 (per core_solarTimeOfDay).

#### `core_environment.getState()`

Builds the full environment state. Keys: TimeOfDay fields (time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile), windSpeed, groundWind, cloudCover, cloudWindDirection, cloudAltitudeKm, cloudWeatherOffsetKm, cloudCirrus*, fogDensity (x1000), fogAtmosphereHeight, numOfDrops, gravity, temperatureC (°C), temperatureProfile, temperatureCurveOverrideC.

- **returns**: table|nil State table (never nil in practice because temperatureCurveOverrideC is always present).

#### `core_environment.getSunScaleGradientFile()`

Deprecated: returns nil.

- **returns**: nil nil

#### `core_environment.getTemperatureK()`

Sea level air temperature currently sent to the engine.

- **returns**: number Kelvins (0.0 until the curve has been evaluated).

#### `core_environment.getTimeOfDay()`

Reads the TimeOfDay scene object and returns a shared state (the same table is reused on every call: copy before keeping it).

- **returns**: table|nil {time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile}; nil if there is no TimeOfDay object (main menu).

#### `core_environment.getTimeOfDayOptions(levelIdentifier)`

Time-of-day options adapted to the level, computed astronomically (core_solarTimeOfDay) from the level's options (core_levels).

- `levelIdentifier` (*string|nil*) : Level identifier; default getCurrentLevelIdentifier().
- **returns**: table List of options {key, value, label…}.

#### `core_environment.getTimeOfDayValueForNormalizedTime(normalizedTime, state)`

Converts a normalized time via core_solarTimeOfDay.timeFromNormalizedTime for the given state (exact meaning defined in core_solarTimeOfDay).

- `normalizedTime` (*number*) : Normalized time.
- `state` (*table|nil*) : TimeOfDay state; default getTimeOfDay().
- **returns**: number|nil Time value.

#### `core_environment.getWindSpeed()`

Reads CloudLayer.windSpeed of the first CloudLayer.

- **returns**: number|nil nil without a CloudLayer.

#### `core_environment.loadTireMarks(filename)`

Loads tire marks from a file.

- `filename` (*string|nil*) : Default 'tiremarks.dat'.

#### `core_environment.onClientPostStartMission(levelPath)`

Hook after level start: stores the initial state (init_env), adds authoredDayLength to it then re-applies it.

- `levelPath` (*string*) : Level path.

#### `core_environment.onClientPreStartMission(levelPath)`

Hook before a level starts: re-reads the temperature curve, removes the override, reloads the ground models.

- `levelPath` (*string*) : Level path.

#### `core_environment.onClientStartMission(levelPath)`

Hook at level start: clears the object cache, lists the night lights, applies the wind and regenerates the weather map with a random seed.

- `levelPath` (*string*) : Level path.

#### `core_environment.onDeserialized(data)`

Restore hook: re-applies the saved ground wind.

- `data` (*table*) : Table returned by onSerialize.

#### `core_environment.onFilesChanged(files)`

Hook called when files change: if a loaded ground model file is modified, calls reset() and be:reloadCollision().

- `files` (*table[]*) : List of entries with a filename field.

#### `core_environment.onSerialize()`

Save hook before extensions reload: returns {groundWind}.

- **returns**: table {groundWind = vec3}.

#### `core_environment.onUpdate(dtReal)`

Per-frame hook: advances the state transition, applies the night lights and updates the effective temperature according to the time.

- `dtReal` (*number*) : Real-time delta in seconds.

#### `core_environment.regenerateWeatherMap(seed)`

Regenerates the weather map (cloud shape) with a seed. Called with a random seed on every level load.

- `seed` (*integer|nil*) : Seed, rounded and clamped to 0..2147483647; random if nil.
- **returns**: boolean true if executed.
- **returns**: integer|nil Normalized seed used (absent if the C++ API is missing).

#### `core_environment.reloadGroundModels(levelPath)`

Resets then reloads all ground models: art/groundmodels.json, then the *.json files of <level>/groundModels/. ASPHALT is submitted first (index 0), then the others in alphabetical order. Names are uppercased and truncated to 30 characters if > 31.

- `levelPath` (*string|nil*) : Level path; default getMissionFilename().

#### `core_environment.resetCloudWeatherOffsetKm()`

Resets the weather offset to (0,0,0).

- **returns**: boolean Result of setCloudWeatherOffsetKm.

#### `core_environment.saveTireMarks(filename)`

Saves the tire marks to a file.

- `filename` (*string|nil*) : Default 'tiremarks.dat'.

#### `core_environment.setAmbientScaleGradientFile(ambientScaleGradientFile)`

Deprecated: warning only.

- `ambientScaleGradientFile` (*any*) : Ignored.

#### `core_environment.setCloudAltitudeKm(altitudeKm)`

Altitude of the cloud layer.

- `altitudeKm` (*number*) : Altitude in kilometers.

#### `core_environment.setCloudAltitudeKmByID(objectID, altitudeKm)`

Sets the altitude (km) of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `altitudeKm` (*number*) : km.

#### `core_environment.setCloudCirrusAltitudeKm(altitudeKm)`

Sets the cirrus altitude.

- `altitudeKm` (*number*) : km.

#### `core_environment.setCloudCirrusAltitudeKmByID(objectID, altitudeKm)`

Sets the cirrus altitude of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `altitudeKm` (*number*) : km.

#### `core_environment.setCloudCirrusCoverage(coverage)`

Sets the cirrus coverage.

- `coverage` (*number*) : Value of cirrusCoverage.

#### `core_environment.setCloudCirrusCoverageByID(objectID, coverage)`

Sets the cirrus coverage of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `coverage` (*number*) : Coverage.

#### `core_environment.setCloudCirrusDensity(density)`

Sets the cirrus density.

- `density` (*number*) : Value of cirrusDensity.

#### `core_environment.setCloudCirrusDensityByID(objectID, density)`

Sets the cirrus density of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `density` (*number*) : Density.

#### `core_environment.setCloudCover(cloud)`

Sets CloudLayer.coverage of the first CloudLayer and cancels an ongoing state transition.

- `cloud` (*number*) : Cloud coverage (lerp range 0..3 in setState).

#### `core_environment.setCloudCoverByID(objectID, coverage)`

Sets the coverage of a specific CloudLayer (no hook, no enableChanges check).

- `objectID` (*integer*) : Object id.
- `coverage` (*number*) : Coverage.

#### `core_environment.setCloudExposureByID(objectID, exposure)`

Deprecated: logs a warning, does nothing.

- `objectID` (*integer*) : Ignored.
- `exposure` (*any*) : Ignored.

#### `core_environment.setCloudHeightByID(objectID, height)`

Sets the height field of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `height` (*number*) : Height.

#### `core_environment.setCloudWeatherOffsetKm(...)`

Offsets the cloud weather map. Emits onEnvironmentChanged.

- `...` (*vec3|number*) : A vec3 or 3 numbers x, y, z in km.
- **returns**: boolean true if applied, false if the API is missing or changes are disabled (nil if the argument is nil).

#### `core_environment.setCloudWindByID(objectID, windSpeed)`

Sets windSpeed of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `windSpeed` (*number*) : Speed.

#### `core_environment.setCloudWindDirection(...)`

Sets CloudLayer.windDirection (Point2F) of the first CloudLayer; only x and y are used.

- `...` (*vec3|number*) : A vec3 or two numbers x, y.

#### `core_environment.setCloudWindDirectionByID(objectID, ...)`

Sets the wind direction of a specific CloudLayer.

- `objectID` (*integer*) : Object id.
- `...` (*vec3|number*) : A vec3 or two numbers x, y.

#### `core_environment.setColorizeGradientFile(colorizeGradientFile)`

Deprecated: warning only.

- `colorizeGradientFile` (*any*) : Ignored.

#### `core_environment.setFogAtmosphereHeight(fogHeight)`

Sets LevelInfo.FogAtmosphereHeight. Does not emit onEnvironmentChanged and ignores enableChanges.

- `fogHeight` (*number*) : Fog atmosphere height (UI range up to ~2000, inferred from lerpRanges).

#### `core_environment.setFogDensity(fog)`

Sets LevelInfo.fogDensity (raw value, very small: the UI uses 1000x this value) and cancels an ongoing transition. Emits onEnvironmentChanged({fogDensity}) with the raw value.

- `fog` (*number*) : Raw fog density (e.g. 0.002).

#### `core_environment.setFogDensityOffset(fogOffset)`

Deprecated: logs a warning, does nothing.

- `fogOffset` (*any*) : Ignored.

#### `core_environment.setFogScaleGradientFile(fogScaleGradientFile)`

Deprecated: warning only.

- `fogScaleGradientFile` (*any*) : Ignored.

#### `core_environment.setGravity(grav)`

Sets gravity: writes LevelInfo.gravity (for future spawns) and sends obj:setGravity to all vehicles. Emits onEnvironmentChanged({gravity}).

- `grav` (*number*) : Acceleration in m/s², negative downwards (-9.81 = Earth). nil/false: ignored; 0 is accepted.

#### `core_environment.setGroundWind(...)`

Sets the ground wind applied to the world and to all vehicles (obj:setWind + be:setGroundWind).

- `...` (*vec3|number*) : A vec3, or 3 numbers x, y, z (m/s, world frame, inferred from code).

#### `core_environment.setNightFogGradientFile(nightFogGradientFile)`

Deprecated: warning only.

- `nightFogGradientFile` (*any*) : Ignored.

#### `core_environment.setNightGradientFile(nightGradientFile)`

Deprecated: warning only.

- `nightGradientFile` (*any*) : Ignored.

#### `core_environment.setPrecipitation(rainDrops)`

Sets Precipitation.numDrops (number of rain drops/particles). No hook, no enableChanges check.

- `rainDrops` (*number*) : Number of drops.

#### `core_environment.setShadowDistance(shadowDistance)`

Deprecated: warning only.

- `shadowDistance` (*any*) : Ignored.

#### `core_environment.setSkyBrightness(skyBrightness)`

Deprecated: warning only.

- `skyBrightness` (*any*) : Ignored.

#### `core_environment.setState(state, lerpSeconds)`

Applies a state (same format as getState). Emits onEnvironmentChanged. With lerpSeconds > 0, cloudCover, fogDensity, fogAtmosphereHeight and time are interpolated (smootherstep curve, shorter duration if the gap is small, minimum 0.12 s); the other fields are applied immediately.

- `state` (*table*) : Partial or full state; fogDensity expected x1000; time optional (without time the clock is not moved).
- `lerpSeconds` (*number|nil*) : Maximum transition duration in real seconds; nil or <= 0 = immediate.

#### `core_environment.setSunScaleGradientFile(sunScaleGradientFile)`

Deprecated: warning only.

- `sunScaleGradientFile` (*any*) : Ignored.

#### `core_environment.setTemperatureProfile(profile)`

Creates an override of the day's temperature curve: shifts the curve to reach the average, then stretches the troughs/peaks to reach min and max. Values clamped to -50..60 °C. Ignored if enableChanges(false) or invalid table.

- `profile` (*table*) : {averageC?, minC?, maxC?} in °C; at least one finite numeric field required.

#### `core_environment.setTimeOfDay(timeOfDay)`

Applies time-of-day fields to the TimeOfDay object. Does nothing if the table contains no known field. Emits onEnvironmentChanged and updates the night lights if time is provided. Changing year/month/day/latitude forces a recomputation of the sun position.

- `timeOfDay` (*table*) : Optional fields: time (0..1, 0 = noon, 0.5 = midnight), play (boolean), dayLength (real s), startTime, latitude, longitude (degrees, inferred from code), year, month, day, utcOffset (hours), dstRule, celestialProfile (name, reloads core_celestial).

#### `core_environment.setWindSpeed(windSpeed)`

Sets CloudLayer.windSpeed of the first CloudLayer in the scene.

- `windSpeed` (*number*) : Cloud wind speed (unit of the engine field, not specified in the code).

#### `core_environment.syncTimeToRealClock(lerpSeconds)`

Sets the game time to the computer's real local time (os.date('*t')), keeping the play state.

- `lerpSeconds` (*number|nil*) : Transition duration in seconds.

#### `core_environment.syncTimeToRealClockUtc(lerpSeconds)`

Sets the game time AND date to the real UTC instant converted to the level's time zone (utcOffset/dstRule).

- `lerpSeconds` (*number|nil*) : Transition duration in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `dayCyclePresets` | table[] | {speed, seconds}: real seconds per day/night cycle: fast 900, normal 1800, slow 7200, realtime 86400. |
| `defaultSolarTimeOfDayOptions` | table[] | Deep copy of defaultTimeOfDayOptions, base for the astronomically computed options. |
| `defaultTimeOfDayOptions` | table[] | List {key, value, label} of key moments: sunrise 0.775, morning 0.825, earlyNoon 0.9, noon 0, lateNoon 0.1, afternoon 0.175, evening 0.23, sunset 0.245, night 0.5. label = translation key. |
| `dependencies` | string[] | {'core_solarTimeOfDay'}: extension loaded before this one (solar computation: night window, sunrise/sunset events). |
| `gravityPresets` | table[] | Presets {key, title, value} in m/s² (earth -9.81, moon -1.62, mars -3.71, sun -274, jupiter -24.92, neptune -11.15, saturn -10.44, uranus -8.87, venus -8.87, mercury -3.7, pluto -0.58, zero 0, inverted earth 9.81). |
| `groundModels` | table<string, {cdata: any, isAlias: boolean, parent: string}> | Known ground models, keys in UPPERCASE. cdata = C++ ground_model structure; isAlias/parent indicate whether the entry is an alias of another model. Rebuilt by reloadGroundModels. |
| `loadedGroundModelFiles` | string[] | Paths of the loaded ground model JSON files (common + level). Used by onFilesChanged to detect a hot modification. |
| `simSpeedPresets` | table[] | {key, label, value}: simulation slow-motion factors (value = divisor: 1 real time, 2 = 1/2x, 4, 10, 25, 50, 100, 1000). |
| `timeOfDayKeyToTime` | table<string, number> | Table key -> time value for the default key moments (noon -> 0, night -> 0.5, …). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEnvironmentChanged`

**UI events (guihooks.trigger):** `EnvironmentCanUpdateChanged`, `EnvironmentStateUpdate`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getGroundModelByID`, `getGroundModelCount`, `loadTireMarks`, `queueAllObjectLua`, `reloadCollision`, `resetGroundModels`, `resetTireMarks`, `saveTireMarks`, `setGroundModel`, `setGroundWind`, `setSeaLevelTemperatureK`
- `obj:` `getClassName`, `getDynDataFieldbyName`, `getField`, `getID`, `getId`, `isSubClassOf`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `findSubClassObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/environment.lua`.*
