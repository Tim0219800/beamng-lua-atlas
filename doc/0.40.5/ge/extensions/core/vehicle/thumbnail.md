# `core_vehicle_thumbnail`

*File: `lua/ge/extensions/core/vehicle/thumbnail.lua` · VM: Game Engine (GE) · 288 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_thumbnail`: `extensions.load("core_vehicle_thumbnail")`, then the global `core_vehicle_thumbnail`

GE extension `core_vehicle_thumbnail`: generates the thumbnails (.jpg) of saved vehicle configurations, either directly in vehicles/<model>/<config>.jpg, or as a temporary preview capture (folder /screenshots/vehicleConfigTemp) that the user can accept or cancel before saving. Delegates the shot to util_screenshotCreator_currentConfigThumbnail. Used by core_vehicle_partmgmt.

## Example

```lua
local r = core_vehicle_thumbnail.captureTemporaryThumbnail()
if r.success then
  -- the UI receives the guihook VehicleConfigThumbnailPreviewReady {captureId, success, path}
end
-- on save:
core_vehicle_thumbnail.commitTemporaryThumbnail(r.captureId, 'vehicles/pickup/my_config.jpg')
```

## Notes

- Temporary captures are tracked by an increasing numeric identifier (captureId). The guihook VehicleConfigThumbnailPreviewReady is emitted with {captureId, success, path?} at the end of each capture.
- The file copy is atomic: copy to a .tmp, optional backup of the old file as .bak, then rename; restore on failure.
- generateThumbnail uses `vehicle.jbeam or vehicle.JBeam` for the model name (both cases tested).

**Dependencies (loaded first):** `core_vehicle_manager`, `core_vehicle_configTarget`, `util_screenshotCreator_currentConfigThumbnail`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_thumbnail.cancelTemporaryThumbnail(captureId)` | Cancels a capture (deletes the file; if it is still in progress, it will be deleted when it finishes). | 186 |
| `core_vehicle_thumbnail.captureTemporaryThumbnail()` | Starts a temporary capture (preview) for the configured vehicle's current config; the file is /screenshots/vehicleConfigTemp/save-preview-<id>.jpg. | 161 |
| `core_vehicle_thumbnail.clearTemporaryThumbnail(captureId)` | Cancels a specific capture, or all of them if captureId is nil. | 199 |
| `core_vehicle_thumbnail.commitTemporaryThumbnail(captureId, targetPath)` | Commits a ready capture: copies it to targetPath then deletes the temporary file. | 265 |
| `core_vehicle_thumbnail.copyThumbnailFile(sourcePath, targetPath)` | Copies a thumbnail file to a destination, safely replacing the old one (creates the folder if needed). | 223 |
| `core_vehicle_thumbnail.generateConfigThumbnail(configName)` | Generates the thumbnail of the named config for the configured vehicle, in vehicles/<model>/<name>.jpg, via util_screenshotCreator_currentConfigThumbnail. | 110 |
| `core_vehicle_thumbnail.getTemporaryThumbnail()` | Returns the most recent ready temporary capture. | 114 |
| `core_vehicle_thumbnail.isValidTemporaryThumbnail(path)` | Indicates whether the path matches a temporary capture that is ready, not canceled and existing. | 213 |

### Parameter details

#### `core_vehicle_thumbnail.cancelTemporaryThumbnail(captureId)`

Cancels a capture (deletes the file; if it is still in progress, it will be deleted when it finishes).

- `captureId` (*integer*) : capture identifier
- **returns**: table {success, captureId} or {success = false, reason = 'captureNotFound', captureId}

#### `core_vehicle_thumbnail.captureTemporaryThumbnail()`

Starts a temporary capture (preview) for the configured vehicle's current config; the file is /screenshots/vehicleConfigTemp/save-preview-<id>.jpg.

- **returns**: table {success = true, captureId, path} or {success = false, reason = 'noCurrentConfig'|'busy'}

#### `core_vehicle_thumbnail.clearTemporaryThumbnail(captureId)`

Cancels a specific capture, or all of them if captureId is nil.

- `captureId` (*integer|nil*) : identifier; nil = all
- **returns**: table {success = true} (or the result of cancelTemporaryThumbnail)

#### `core_vehicle_thumbnail.commitTemporaryThumbnail(captureId, targetPath)`

Commits a ready capture: copies it to targetPath then deletes the temporary file.

- `captureId` (*integer*) : ready capture
- `targetPath` (*string*) : path of the final .jpg
- **returns**: boolean true if copied

#### `core_vehicle_thumbnail.copyThumbnailFile(sourcePath, targetPath)`

Copies a thumbnail file to a destination, safely replacing the old one (creates the folder if needed).

- `sourcePath` (*string*) : existing source file
- `targetPath` (*string*) : destination file
- **returns**: boolean true if the copy succeeded

#### `core_vehicle_thumbnail.generateConfigThumbnail(configName)`

Generates the thumbnail of the named config for the configured vehicle, in vehicles/<model>/<name>.jpg, via util_screenshotCreator_currentConfigThumbnail.

- `configName` (*string*) : config name (path and .pc/.jpg extensions are removed)
- **returns**: boolean true if the shot started

#### `core_vehicle_thumbnail.getTemporaryThumbnail()`

Returns the most recent ready temporary capture.

- **returns**: table {captureId, path} or {path = nil} if there is none

#### `core_vehicle_thumbnail.isValidTemporaryThumbnail(path)`

Indicates whether the path matches a temporary capture that is ready, not canceled and existing.

- `path` (*string*) : file path
- **returns**: boolean true if valid

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicle_manager, core_vehicle_configTarget, util_screenshotCreator_currentConfigThumbnail. |

## Calls into the engine (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/thumbnail.lua`.*
