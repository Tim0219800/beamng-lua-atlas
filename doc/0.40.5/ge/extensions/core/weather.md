# `core_weather`

*File: `lua/ge/extensions/core/weather.lua` · VM: Game Engine (GE) · 360 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_weather`: `extensions.load("core_weather")`, then the global `core_weather`

Applies weather presets by directly modifying the fields of scene objects (LevelInfo, CloudLayer, ScatterSky, etc.): either immediately (activate), or through a gradual transition (switchWeather). Presets are read from the JSON files of art/weather/ then from the weather/ folder of the current level (which override the global ones). A modder uses it to change the sky, rain or fog by script, or to add their own presets through a JSON file.

## Example

```lua
-- list then apply a preset, with a 30 s transition
local names = core_weather.getPresets()
core_weather.switchWeather(names[1], 30)
-- or immediately
core_weather.activate(names[1])
```

## Notes

- Preset format (JSON file): { "presetName": { "ClassName": { "field": value } } }. Values are converted according to the field type: number (int/float), boolean (bool), string (filename/annotation), table of 4 numbers (ColorF/Point4F), table of 3 numbers (Point3F/vec3).
- Presets are loaded when the extension loads (onExtensionLoaded) and at each level start (onClientPostStartMission); they are merged (tableMerge) without being emptied: a preset removed from a previous level stays in memory.
- switchWeather linearly interpolates (start value + difference * time / duration) only the numeric fields and vectors/colors; string fields are not interpolated (start value kept).
- activate applies everything at once; for the LevelInfo class it then calls postApply().
- In activate, an invalid attribute makes the rest of the current object class be skipped (goto continue), not just that attribute.
- Probable bug in getFormerValues: the condition `type == 'int' or type == 'float' and type(attrValue) == 'number'` has ambiguous precedence (the check on the value's type only applies to floats). A field absent from the object (fields[attrName] nil) also causes a Lua error.
- During a transition, onPreRender calls core_environment.setFogDensity(core_environment.getFogDensity()) every frame, probably to force the fog update.
- Default transition duration: 15 s. loadPresets is commented out in the public interface (M.loadPresets absent).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_weather.activate(presetName)` | Applies the preset immediately: for each class and each object of that class in the scene, writes the preset's attributes. Remembers the name as the current preset. Logs an error if the preset is unknown. | 209 |
| `core_weather.dumpWeather()` | Dumps all loaded presets to the log; debug tool. | 344 |
| `core_weather.getCurrentWeatherPreset()` | Name of the last preset requested by activate or switchWeather. | 22 |
| `core_weather.getPresets()` | List of the loaded presets' names (order not guaranteed). | 315 |
| `core_weather.onClientPostStartMission(levelPath)` | Hook called after a level starts: reloads the global presets then those of the level. *(internal)* *(hook)* | 337 |
| `core_weather.onExtensionLoaded()` | Hook called when the extension loads: resets the transition and loads the presets. *(internal)* *(hook)* | 323 |
| `core_weather.onPreRender(dt)` | Hook called every frame before rendering: if a transition is in progress, advances the timer, interpolates the values and ends the transition when the duration is exceeded. *(internal)* *(hook)* | 273 |
| `core_weather.switchWeather(presetName, t)` | Gradually moves from the current weather to that of the preset: reads the current values, computes the differences, then onPreRender interpolates over the given duration. Logs (info level) and does nothing if the preset does not exist. | 185 |

### Parameter details

#### `core_weather.activate(presetName)`

Applies the preset immediately: for each class and each object of that class in the scene, writes the preset's attributes. Remembers the name as the current preset. Logs an error if the preset is unknown.

- `presetName` (*string*) : Name of a loaded preset (see getPresets).

#### `core_weather.getCurrentWeatherPreset()`

Name of the last preset requested by activate or switchWeather.

- **returns**: string|nil Name of the current preset, nil if none has been applied since the extension loaded.

#### `core_weather.getPresets()`

List of the loaded presets' names (order not guaranteed).

- **returns**: string[] Preset names.

#### `core_weather.onClientPostStartMission(levelPath)`

Hook called after a level starts: reloads the global presets then those of the level.

- `levelPath` (*string*) : Level path (not used: the code calls getMissionFilename()).

#### `core_weather.onPreRender(dt)`

Hook called every frame before rendering: if a transition is in progress, advances the timer, interpolates the values and ends the transition when the duration is exceeded.

- `dt` (*number*) : Time elapsed since the previous frame, in seconds.

#### `core_weather.switchWeather(presetName, t)`

Gradually moves from the current weather to that of the preset: reads the current values, computes the differences, then onPreRender interpolates over the given duration. Logs (info level) and does nothing if the preset does not exist.

- `presetName` (*string*) : Name of the target preset.
- `t` (*number|nil*) : Transition duration in seconds (15 by default).

## Calls into the engine (C++)

- `FS:` `findFiles`
- `core_environment.` `getFogDensity`, `setFogDensity`
- `obj:` `getField`, `getFields`, `getId`, `postApply`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/weather.lua`.*
