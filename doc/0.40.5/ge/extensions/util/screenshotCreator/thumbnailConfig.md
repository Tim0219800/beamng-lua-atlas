# `util_screenshotCreator_thumbnailConfig`

*File: `lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_thumbnailConfig`: `extensions.load("util_screenshotCreator_thumbnailConfig")`, then the global `util_screenshotCreator_thumbnailConfig`

Reading and writing of a vehicle's thumbnail configuration (thumbnailConfig key): it is stored in /vehicles/<model>/info_<config>.json for a configuration, and in /vehicles/<model>/info.json for the model. It notably contains rotation (degrees, rotation of the camera frame around the vertical axis), pauseDelay (seconds of waiting before capture) and saved cameras (configCamEnabled, modelCamEnabled). The module also provides the vehicle's reference axes (level and oriented according to the rotation) and the camera offset <-> vehicle frame conversions used to save and replay a camera.

## Notes

- A config's configuration takes priority over the model's for rotation and pauseDelay; default values 0.
- getCameraConfig returns vehCamConfig = {configCamEnabled = false, modelCamEnabled = false} if no thumbnail config exists for the config.
- The read functions assume that core_vehicles.getModel(modelName) returns a table; an unknown model can cause a Lua error when accessing modelData.configs.
- getLevelAxes straightens the vehicle box's axes to the horizontal (the heading is kept) so that a vehicle tilted at spawn does not tilt the camera.

**Dependencies (loaded first):** `core_camera`, `core_vehicles`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName)` | Retrieves the thumbnail configs of a configuration and of its model (rereading the info_<config>.json file if it is not in memory). | 54 |
| `util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle)` | Converts the current camera's position and orientation into offsets relative to the vehicle (in its reference axes) so they can be saved. | 116 |
| `util_screenshotCreator_thumbnailConfig.getLevelAxes(bb)` | Computes orthonormal axes from the vehicle's box: horizontal heading (axis 1), world right and up. | 95 |
| `util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName)` | Returns the wait time before capture in seconds (config, otherwise model, otherwise 0), never negative. | 83 |
| `util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox)` | Returns the vehicle's reference axes for the camera: axes straightened by getLevelAxes, rotated by -rotation degrees around the vertical axis if a rotation is configured. | 104 |
| `util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName)` | Returns the camera rotation (in degrees): that of the config, otherwise that of the model, otherwise 0. | 72 |
| `util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName)` | Inverse operation of getCameraOffsets: rebuilds the camera's world position and orientation for the vehicle from saved offsets. | 132 |
| `util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config)` | Saves the model's thumbnail config to /vehicles/<model>/info.json and updates the in-memory data. | 41 |
| `util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config)` | Saves a configuration's thumbnail config to its info file (known infoFilename, otherwise /vehicles/<model>/info_<config>.json) and updates the in-memory data. | 27 |

### Parameter details

#### `util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName)`

Retrieves the thumbnail configs of a configuration and of its model (rereading the info_<config>.json file if it is not in memory).

- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name.
- **returns**: table {vehCamConfig = table, modelCamConfig = table|nil}.

#### `util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle)`

Converts the current camera's position and orientation into offsets relative to the vehicle (in its reference axes) so they can be saved.

- `configName` (*string|nil*) : Configuration name.
- `vehicle` (*table|nil*) : Vehicle object (default: player 0's vehicle).
- **returns**: vec3 Position offset in the vehicle frame.
- **returns**: quat Camera orientation in the vehicle frame.

#### `util_screenshotCreator_thumbnailConfig.getLevelAxes(bb)`

Computes orthonormal axes from the vehicle's box: horizontal heading (axis 1), world right and up.

- `bb` (*table*) : Oriented bounding box (OOBB) with getAxis(i).
- **returns**: vec3 Right axis.
- **returns**: vec3 Forward axis (horizontal).
- **returns**: vec3 Up axis (0, 0, 1).

#### `util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName)`

Returns the wait time before capture in seconds (config, otherwise model, otherwise 0), never negative.

- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name.
- **returns**: number Delay in seconds (>= 0).

#### `util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox)`

Returns the vehicle's reference axes for the camera: axes straightened by getLevelAxes, rotated by -rotation degrees around the vertical axis if a rotation is configured.

- `vehicle` (*table*) : Vehicle object.
- `configName` (*string|nil*) : Configuration name (to read the rotation).
- `boundingBox` (*table|nil*) : OOBB already computed; otherwise vehicle:getSpawnWorldOOBB().
- **returns**: vec3 Right axis.
- **returns**: vec3 Forward axis.
- **returns**: vec3 Up axis.

#### `util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName)`

Returns the camera rotation (in degrees): that of the config, otherwise that of the model, otherwise 0.

- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name.
- **returns**: number Rotation in degrees.

#### `util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName)`

Inverse operation of getCameraOffsets: rebuilds the camera's world position and orientation for the vehicle from saved offsets.

- `posOffset` (*vec3*) : Saved position offset.
- `rotOffset` (*quat*) : Saved orientation.
- `vehicle` (*table|nil*) : Vehicle object (default: player 0's vehicle).
- `configName` (*string|nil*) : Configuration name.
- **returns**: vec3 Camera world position.
- **returns**: quat Camera world orientation.

#### `util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config)`

Saves the model's thumbnail config to /vehicles/<model>/info.json and updates the in-memory data.

- `modelName` (*string*) : Model name.
- `config` (*table*) : thumbnailConfig table to save.
- **returns**: boolean Write success.

#### `util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config)`

Saves a configuration's thumbnail config to its info file (known infoFilename, otherwise /vehicles/<model>/info_<config>.json) and updates the in-memory data.

- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name.
- `config` (*table*) : thumbnailConfig table to save.
- **returns**: boolean false if the existing file is unreadable or if the write fails.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: core_camera and core_vehicles. |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua`.*
