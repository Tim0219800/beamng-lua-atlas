# `ui_photomode_scene`

*File: `lua/ge/extensions/ui/photomode/scene.lua` · VM: Game Engine (GE) · 874 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_scene`: `extensions.load("ui_photomode_scene")`, then the global `ui_photomode_scene`

Photo mode "scene" tab: reads and modifies the level's environment (time of day, date, clouds, fog, wind, north offset, celestial displays and meteors) via core_environment and core_celestial. It also handles saving/restoring the original state when the session opens/closes, an environment bookmark, and "scene" type presets (which include an advancedRender part handled by ui_photomode_advancedRender).

## Notes

- Limits applied: time 0..1 (fraction of the day), cloudCover 0..3, fogDensity 0..50, fogAtmosphereHeight 1..1000. northOverride is brought into [-180, 180[ (180 kept if the input value is positive).
- setSceneState requires an active photo session. __lerpSeconds (number) in the patch gives the transition duration passed to core_environment.setState. Only time, cloudCover, fogDensity, fogAtmosphereHeight and northOverride are taken into account by setSceneState (not windSpeed, winds or celestial).
- Possible failure reasons: session_inactive, scene_state_invalid, scene_api_unavailable, scene_tod_unavailable, scene_celestial_api_unavailable, scene_set_failed, scene_patch_empty, scene_state_unavailable, bookmark_unavailable, preset_part_invalid.
- applyPresetState accepts options.part: "all" (or nil), "environment" (time and date), "shadows", "detailTerrain", "weather", "celestial"; any other value gives preset_part_invalid.
- Game bug: logSceneTimeOfDayDebug reads a variable isDebugEnabled that is not declared in this file (global, hence nil): the detailed time-of-day log is never written. Likewise logTag is not declared in this file and the log("E", logTag, ...) calls use a nil global.
- formatSceneTimeOfDayDebugState displays sceneState.dayLength, a field absent from the scene state (displays nil).

**Dependencies (loaded first):** `ui_photomode_shared`, `ui_photomode_advancedRender`, `core_celestial`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_scene.applyPresetState(state, options)` | Applies a scene preset (time, weather, north, celestial elements) then its advancedRender part. Stops at the first failure. | 822 |
| `ui_photomode_scene.buildMetadataState()` | Returns the scene part to include in a capture's metadata: time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial. | 852 |
| `ui_photomode_scene.buildState()` | Builds the current scene state (values clamped to the limits) from core_environment and core_celestial, with the availability table indicating which elements are readable. | 274 |
| `ui_photomode_scene.captureDefaultPresetState()` | Captures the session's default state (restored or current scene state + default advanced render). Returns nil if neither is available. | 812 |
| `ui_photomode_scene.capturePresetState()` | Captures the current state as a preset: {scene={...}, advancedRender=...} (advancedRender comes from ui_photomode_advancedRender.buildMetadataState). | 808 |
| `ui_photomode_scene.captureRestoreState()` | Stores the original scene state in S.sessionSceneRestoreState to restore it at the end of the session. Called at the start of the photo session. *(internal)* | 296 |
| `ui_photomode_scene.captureSerializableState()` | Reads the raw scene state: time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind ({x,y,z} vectors), northOverride, celestial ({meteor, display}). Unavailable values are nil. | 145 |
| `ui_photomode_scene.getSceneState()` | Returns the current scene state (buildState) with ok = session active; reason="session_inactive" otherwise. | 670 |
| `ui_photomode_scene.loadEnvironmentBookmark()` | Reapplies the stored environment bookmark (time, weather, north, celestial elements). Requires an active session and a bookmark. | 609 |
| `ui_photomode_scene.logTimeOfDayDebug(label, sceneState)` | Logs (debug level) the time of day as {time, play, dayLength} with a label. See the note on the isDebugEnabled bug. *(internal)* | 214 |
| `ui_photomode_scene.restoreState()` | Restores the scene state saved by captureRestoreState (time, environment, north, celestial elements) then clears it. Called at the end of the photo session; does nothing if there is nothing to restore. *(internal)* | 478 |
| `ui_photomode_scene.saveEnvironmentBookmark()` | Stores the current environment state in S.savedEnvironmentBookmark. Requires an active session. | 588 |
| `ui_photomode_scene.setSceneState(partialState)` | Applies a partial scene patch (time, weather, north) during a photo session and returns the new state. Fails with scene_patch_empty if nothing was applied. | 523 |

### Parameter details

#### `ui_photomode_scene.applyPresetState(state, options)`

Applies a scene preset (time, weather, north, celestial elements) then its advancedRender part. Stops at the first failure.

- `state` (*table*) : Preset {scene=..., advancedRender=...}.
- `options` (*table|nil*) : options.part: all, environment, shadows, detailTerrain, weather, celestial.
- **returns**: table {state=...} or {ok=false, reason}.

#### `ui_photomode_scene.buildMetadataState()`

Returns the scene part to include in a capture's metadata: time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial.

- **returns**: table Scene state for metadata.

#### `ui_photomode_scene.buildState()`

Builds the current scene state (values clamped to the limits) from core_environment and core_celestial, with the availability table indicating which elements are readable.

- **returns**: table Scene state (see getSceneState).

#### `ui_photomode_scene.captureDefaultPresetState()`

Captures the session's default state (restored or current scene state + default advanced render). Returns nil if neither is available.

- **returns**: table|nil Combined preset data.

#### `ui_photomode_scene.capturePresetState()`

Captures the current state as a preset: {scene={...}, advancedRender=...} (advancedRender comes from ui_photomode_advancedRender.buildMetadataState).

- **returns**: table Combined preset data.

#### `ui_photomode_scene.captureSerializableState()`

Reads the raw scene state: time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind ({x,y,z} vectors), northOverride, celestial ({meteor, display}). Unavailable values are nil.

- **returns**: table Serializable raw state.

#### `ui_photomode_scene.getSceneState()`

Returns the current scene state (buildState) with ok = session active; reason="session_inactive" otherwise.

- **returns**: table Scene state: sessionActive, bookmarkAvailable, availability, time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial, plus ok/reason.

#### `ui_photomode_scene.loadEnvironmentBookmark()`

Reapplies the stored environment bookmark (time, weather, north, celestial elements). Requires an active session and a bookmark.

- **returns**: table {ok=true, state} or {ok=false, reason, state?}.

#### `ui_photomode_scene.logTimeOfDayDebug(label, sceneState)`

Logs (debug level) the time of day as {time, play, dayLength} with a label. See the note on the isDebugEnabled bug.

- `label` (*string*) : Message prefix.
- `sceneState` (*table*) : State to display.

#### `ui_photomode_scene.saveEnvironmentBookmark()`

Stores the current environment state in S.savedEnvironmentBookmark. Requires an active session.

- **returns**: table {ok=true, state} or {ok=false, reason}.

#### `ui_photomode_scene.setSceneState(partialState)`

Applies a partial scene patch (time, weather, north) during a photo session and returns the new state. Fails with scene_patch_empty if nothing was applied.

- `partialState` (*table*) : Possible fields: time (0..1), play (boolean, with time), year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, northOverride (degrees), __lerpSeconds (transition seconds).
- **returns**: table {ok=true, state=...} or {ok=false, reason=..., state?=...}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: ui_photomode_shared, ui_photomode_advancedRender, core_celestial. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/scene.lua`.*
