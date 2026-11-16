# `util_screenshotCreator_ui`

*File: `lua/ge/extensions/util/screenshotCreator/ui.lua` · VM: Game Engine (GE) · 864 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_ui`: `extensions.load("util_screenshotCreator_ui")`, then the global `util_screenshotCreator_ui`

"Vehicle Screenshot Creator (WIP)" ImGui window of the vehicle thumbnail creator. It serves as a facade for the other util_screenshotCreator_* modules: buttons to start a job ("Run selected models", "Run selected defaults", "Run current config", Stop with progress bar), opening of the showroom_v2_lighting_simple level, tabs Output, Lighting, Debug (framing mode and overlays), Node outpainting, Models selection, Manual controls and Last run review. It also handles the parking markup tagging tools (thumbnailLayer field, requires the world editor), hiding UI apps, disabling driving during adjustments and restoring the session state when the window is closed.

## Example

```lua
extensions.load('util_screenshotCreator_ui')
util_screenshotCreator_ui.openWindow()
```

## Notes

- The window shows controls only if the player's vehicle comes from a .pc config file; otherwise an error message is displayed.
- openWindow loads util_screenshotCreator_settings if needed, initializes the editor modules (editor_main.initializeModules) and applies the capture environment (settings.applyEnvironment, effective in the showroom only).
- During a job (job.isRunning), the tabs are grayed out; the camera frame is drawn only if "Include margin in screenshot" is checked.
- When the window is closed (or on unload), restoreSessionState re-enables driving, shows the UI apps again, restores the window resolution and restores the environment if no job is running.
- "Generate missing thumbnails only" skips only existing files: an empty thumbnail is not considered missing. "Reload UI when run is finished" calls reloadUI() at the end of a job.
- onDeserialized accepts old states where the settings and nodeOutpaint settings were stored here (resolutionPtr, fieldOfView…) and migrates them.

**Dependencies (loaded first):** `ui_imgui`, `editor_main`, `core_camera`, `core_vehicles`, `core_gamestate`, `freeroam_freeroam`, `util_screenshotCreator_settings`, `util_screenshotCreator_job`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_shippedConfigs`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_ui.onDeserialized(data)` | Hook called after reload with the serialized state; restores the UI and migrates old formats. *(internal)* *(hook)* | 833 |
| `util_screenshotCreator_ui.onExtensionUnloaded()` | Unload hook: runs restoreSessionState (driving, UI apps, resolution, environment). *(internal)* *(hook)* | 158 |
| `util_screenshotCreator_ui.onSerialize()` | Serialization hook before reload: returns windowOpen, generateMissingThumbnailsOnly, reloadUIOnJobFinished, drivingEnabled, uiAppsVisible, cameraSpeed, runDone, reviewData, framingModeId, previousFov and isCameraSet. *(internal)* *(hook)* | 809 |
| `util_screenshotCreator_ui.onUpdate()` | Hook called every frame: consumes the job-done flag, draws the 3D overlays and the ImGui window with its tabs, and updates the nodeOutpaint brush. When the window is closed, restores the session state once. *(internal)* *(hook)* | 687 |
| `util_screenshotCreator_ui.openWindow()` | Opens the screenshot creator window (loads the settings if needed, initializes the editor and applies the environment). | 785 |

### Parameter details

#### `util_screenshotCreator_ui.onDeserialized(data)`

Hook called after reload with the serialized state; restores the UI and migrates old formats.

- `data` (*table|nil*) : Serialized state.

#### `util_screenshotCreator_ui.onSerialize()`

Serialization hook before reload: returns windowOpen, generateMissingThumbnailsOnly, reloadUIOnJobFinished, drivingEnabled, uiAppsVisible, cameraSpeed, runDone, reviewData, framingModeId, previousFov and isCameraSet.

- **returns**: table UI state.

#### `util_screenshotCreator_ui.openWindow()`

Opens the screenshot creator window (loads the settings if needed, initializes the editor and applies the environment).

- **returns**: boolean false if util_screenshotCreator_settings could not be loaded, otherwise true.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: ui_imgui, editor_main, core_camera, core_vehicles, core_gamestate, freeroam_freeroam and util_screenshotCreator_settings, job, lightingSetup, thumbnailConfig, framingManager, modelSelection, nodeOutpaint, shippedConfigs. |

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`
- `scenetree.` `findObject`, `findObjectById`

**Loads extensions:** `util_screenshotCreator_settings`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/ui.lua`.*
