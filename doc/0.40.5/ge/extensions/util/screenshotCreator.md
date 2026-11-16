# `util_screenshotCreator`

*File: `lua/ge/extensions/util/screenshotCreator.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator`: `extensions.load("util_screenshotCreator")`, then the global `util_screenshotCreator`

Entry point of the internal vehicle thumbnail generation tool. This file is a facade: it declares all the util_screenshotCreator_* submodules (ImGui interface, settings, framing, capture, batch processing job, etc.) as dependencies and delegates to them. It is used to open the tool window, start batch generation, frame a vehicle, take an off-screen capture and choose the framing mode.

## Example

```lua
extensions.load('util_screenshotCreator')
extensions.util_screenshotCreator.openWindow()
```

## Notes

- In takeThumbnailScreenshot, the resolution, supersampling, field of view and near plane come from the util_screenshotCreator_settings settings and not from arguments.
- The state.show field is not used in this file.

**Dependencies (loaded first):** `ui_imgui`, `ui_imguiUtils`, `ui_vehicleSelector_tileGrouping`, `render_renderViews`, `core_vehicle_manager`, `util_screenshotCreator_settings`, `util_screenshotCreator_shippedConfigs`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framing_isometric`, `util_screenshotCreator_framing_procedural`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_job`, `util_screenshotCreator_thumbnailPaths`, `util_screenshotCreator_thumbnailTargets`, `util_screenshotCreator_thumbnailCapturePipeline`, `util_screenshotCreator_currentConfigThumbnail`, `util_screenshotCreator_ui`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName)` | Computes the camera position and orientation that frame a vehicle with the procedural framing, based on the framing context from the settings. | 43 |
| `util_screenshotCreator.getFramingMode()` | Returns the identifier of the selected framing mode. | 101 |
| `util_screenshotCreator.listFramingModes()` | Lists the available framing modes (delegates to util_screenshotCreator_framingManager.listModes). | 98 |
| `util_screenshotCreator.onDeserialized(data)` | Hook called after an extension reload: if the data contains a UI state (windowOpen, resolutionPtr, reviewData or skipCustomCameras), passes it to util_screenshotCreator_ui.onDeserialized. *(internal)* *(hook)* | 76 |
| `util_screenshotCreator.onExtensionUnloaded()` | Hook called on unload: restores the environment modified by the settings (restoreEnvironment) and logs the unload. *(internal)* *(hook)* | 87 |
| `util_screenshotCreator.openWindow()` | Opens the tool's ImGui window (delegates to util_screenshotCreator_ui.openWindow). | 35 |
| `util_screenshotCreator.setFramingMode(modeId)` | Selects the framing mode. | 104 |
| `util_screenshotCreator.startWork(workOptions)` | Starts batch thumbnail generation (delegates to util_screenshotCreator_job.startWork). | 39 |
| `util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId)` | Takes an off-screen capture from the given camera and saves it to filepath (delegates to util_screenshotCreator_capture), with the capture parameters from the settings. | 60 |

### Parameter details

#### `util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName)`

Computes the camera position and orientation that frame a vehicle with the procedural framing, based on the framing context from the settings.

- `vehicle` (*userdata*) : Vehicle object to frame
- `fov` (*number|nil*) : Field of view in degrees (default: settings value)
- `nearPlane` (*number|nil*) : Camera near plane (default: settings)
- `aspectRatio` (*number|nil*) : Aspect ratio (default: settings)
- `resolution` (*table|nil*) : Resolution {width, height} used for the framing context
- `configName` (*string|nil*) : Vehicle configuration name
- **returns**: vec3|nil Camera position
- **returns**: quat|nil Camera rotation
- **returns**: table|nil Framing data (framingData)

#### `util_screenshotCreator.getFramingMode()`

Returns the identifier of the selected framing mode.

- **returns**: string Mode identifier

#### `util_screenshotCreator.listFramingModes()`

Lists the available framing modes (delegates to util_screenshotCreator_framingManager.listModes).

- **returns**: table Registered framing modes

#### `util_screenshotCreator.onDeserialized(data)`

Hook called after an extension reload: if the data contains a UI state (windowOpen, resolutionPtr, reviewData or skipCustomCameras), passes it to util_screenshotCreator_ui.onDeserialized.

- `data` (*table|nil*) : Data saved by serialization

#### `util_screenshotCreator.openWindow()`

Opens the tool's ImGui window (delegates to util_screenshotCreator_ui.openWindow).

- **returns**: any Value returned by util_screenshotCreator_ui.openWindow

#### `util_screenshotCreator.setFramingMode(modeId)`

Selects the framing mode.

- `modeId` (*string*) : Mode identifier (for example "fixedIsometric" or "configured")
- **returns**: any Value returned by framingManager.setSelectedModeId

#### `util_screenshotCreator.startWork(workOptions)`

Starts batch thumbnail generation (delegates to util_screenshotCreator_job.startWork).

- `workOptions` (*table*) : Processing options (inferred from code: passed as is to the job module)
- **returns**: any Value returned by util_screenshotCreator_job.startWork

#### `util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId)`

Takes an off-screen capture from the given camera and saves it to filepath (delegates to util_screenshotCreator_capture), with the capture parameters from the settings.

- `filepath` (*string*) : Path of the image file to write
- `camera` (*table*) : Camera {pos, rot, fov?, nearPlane?, screenshotDelay?}
- `callback` (*function|nil*) : Called at the end of the capture
- `uniqueId` (*any*) : Identifier passed to the capture module

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | List of util_screenshotCreator_* extensions loaded with this one |
| `state` | table | Module state, initially {show = false} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator.lua`.*
