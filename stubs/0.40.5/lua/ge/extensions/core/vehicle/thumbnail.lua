---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/thumbnail.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_thumbnail`: generates the thumbnails (.jpg) of saved vehicle configurations, either directly in vehicles/<model>/<config>.jpg, or as a temporary preview capture (folder /screenshots/vehicleConfigTemp) that the user can accept or cancel before saving. Delegates the shot to util_screenshotCreator_currentConfigThumbnail. Used by core_vehicle_partmgmt.
--- Access: extension `core_vehicle_thumbnail`: `extensions.load("core_vehicle_thumbnail")`, then the global `core_vehicle_thumbnail`
---@class core_vehicle_thumbnail
---@field dependencies string[] core_vehicle_manager, core_vehicle_configTarget, util_screenshotCreator_currentConfigThumbnail.
core_vehicle_thumbnail = {}

--- Cancels a capture (deletes the file; if it is still in progress, it will be deleted when it finishes).
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:186
---@param captureId integer capture identifier
---@return table  {success, captureId} or {success = false, reason = 'captureNotFound', captureId}
function core_vehicle_thumbnail.cancelTemporaryThumbnail(captureId) end

--- Starts a temporary capture (preview) for the configured vehicle's current config; the file is /screenshots/vehicleConfigTemp/save-preview-<id>.jpg.
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:161
---@return table  {success = true, captureId, path} or {success = false, reason = 'noCurrentConfig'|'busy'}
function core_vehicle_thumbnail.captureTemporaryThumbnail() end

--- Cancels a specific capture, or all of them if captureId is nil.
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:199
---@param captureId integer|nil identifier; nil = all
---@return table  {success = true} (or the result of cancelTemporaryThumbnail)
function core_vehicle_thumbnail.clearTemporaryThumbnail(captureId) end

--- Commits a ready capture: copies it to targetPath then deletes the temporary file.
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:265
---@param captureId integer ready capture
---@param targetPath string path of the final .jpg
---@return boolean  true if copied
function core_vehicle_thumbnail.commitTemporaryThumbnail(captureId, targetPath) end

--- Copies a thumbnail file to a destination, safely replacing the old one (creates the folder if needed).
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:223
---@param sourcePath string existing source file
---@param targetPath string destination file
---@return boolean  true if the copy succeeded
function core_vehicle_thumbnail.copyThumbnailFile(sourcePath, targetPath) end

--- Generates the thumbnail of the named config for the configured vehicle, in vehicles/<model>/<name>.jpg, via util_screenshotCreator_currentConfigThumbnail.
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:110
---@param configName string config name (path and .pc/.jpg extensions are removed)
---@return boolean  true if the shot started
function core_vehicle_thumbnail.generateConfigThumbnail(configName) end

--- Returns the most recent ready temporary capture.
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:114
---@return table  {captureId, path} or {path = nil} if there is none
function core_vehicle_thumbnail.getTemporaryThumbnail() end

--- Indicates whether the path matches a temporary capture that is ready, not canceled and existing.
---Source: lua/ge/extensions/core/vehicle/thumbnail.lua:213
---@param path string file path
---@return boolean  true if valid
function core_vehicle_thumbnail.isValidTemporaryThumbnail(path) end

