---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/weather.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applies weather presets by directly modifying the fields of scene objects (LevelInfo, CloudLayer, ScatterSky, etc.): either immediately (activate), or through a gradual transition (switchWeather). Presets are read from the JSON files of art/weather/ then from the weather/ folder of the current level (which override the global ones). A modder uses it to change the sky, rain or fog by script, or to add their own presets through a JSON file.
--- Access: extension `core_weather`: `extensions.load("core_weather")`, then the global `core_weather`
---@class core_weather
core_weather = {}

--- Applies the preset immediately: for each class and each object of that class in the scene, writes the preset's attributes. Remembers the name as the current preset. Logs an error if the preset is unknown.
---Source: lua/ge/extensions/core/weather.lua:209
---@param presetName string Name of a loaded preset (see getPresets).
function core_weather.activate(presetName) end

--- Dumps all loaded presets to the log; debug tool.
---Source: lua/ge/extensions/core/weather.lua:344
function core_weather.dumpWeather() end

--- Name of the last preset requested by activate or switchWeather.
---Source: lua/ge/extensions/core/weather.lua:22
---@return string|nil  Name of the current preset, nil if none has been applied since the extension loaded.
function core_weather.getCurrentWeatherPreset() end

--- List of the loaded presets' names (order not guaranteed).
---Source: lua/ge/extensions/core/weather.lua:315
---@return string[]  Preset names.
function core_weather.getPresets() end

--- Hook called after a level starts: reloads the global presets then those of the level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/weather.lua:337
---@param levelPath string Level path (not used: the code calls getMissionFilename()).
function core_weather.onClientPostStartMission(levelPath) end

--- Hook called when the extension loads: resets the transition and loads the presets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/weather.lua:323
function core_weather.onExtensionLoaded() end

--- Hook called every frame before rendering: if a transition is in progress, advances the timer, interpolates the values and ends the transition when the duration is exceeded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/weather.lua:273
---@param dt number Time elapsed since the previous frame, in seconds.
function core_weather.onPreRender(dt) end

--- Gradually moves from the current weather to that of the preset: reads the current values, computes the differences, then onPreRender interpolates over the given duration. Logs (info level) and does nothing if the preset does not exist.
---Source: lua/ge/extensions/core/weather.lua:185
---@param presetName string Name of the target preset.
---@param t number|nil Transition duration in seconds (15 by default).
function core_weather.switchWeather(presetName, t) end

