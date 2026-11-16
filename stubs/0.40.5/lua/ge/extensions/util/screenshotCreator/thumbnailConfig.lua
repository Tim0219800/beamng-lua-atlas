---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reading and writing of a vehicle's thumbnail configuration (thumbnailConfig key): it is stored in /vehicles/<model>/info_<config>.json for a configuration, and in /vehicles/<model>/info.json for the model. It notably contains rotation (degrees, rotation of the camera frame around the vertical axis), pauseDelay (seconds of waiting before capture) and saved cameras (configCamEnabled, modelCamEnabled). The module also provides the vehicle's reference axes (level and oriented according to the rotation) and the camera offset <-> vehicle frame conversions used to save and replay a camera.
--- Access: extension `util_screenshotCreator_thumbnailConfig`: `extensions.load("util_screenshotCreator_thumbnailConfig")`, then the global `util_screenshotCreator_thumbnailConfig`
---@class util_screenshotCreator_thumbnailConfig
---@field dependencies string[] Extensions loaded before: core_camera and core_vehicles.
util_screenshotCreator_thumbnailConfig = {}

--- Retrieves the thumbnail configs of a configuration and of its model (rereading the info_<config>.json file if it is not in memory).
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:54
---@param modelName string Model name.
---@param configName string Configuration name.
---@return table  {vehCamConfig = table, modelCamConfig = table|nil}.
function util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName) end

--- Converts the current camera's position and orientation into offsets relative to the vehicle (in its reference axes) so they can be saved.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:116
---@param configName string|nil Configuration name.
---@param vehicle table|nil Vehicle object (default: player 0's vehicle).
---@return vec3  Position offset in the vehicle frame.
---@return quat  Camera orientation in the vehicle frame.
function util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle) end

--- Computes orthonormal axes from the vehicle's box: horizontal heading (axis 1), world right and up.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:95
---@param bb table Oriented bounding box (OOBB) with getAxis(i).
---@return vec3  Right axis.
---@return vec3  Forward axis (horizontal).
---@return vec3  Up axis (0, 0, 1).
function util_screenshotCreator_thumbnailConfig.getLevelAxes(bb) end

--- Returns the wait time before capture in seconds (config, otherwise model, otherwise 0), never negative.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:83
---@param modelName string Model name.
---@param configName string Configuration name.
---@return number  Delay in seconds (>= 0).
function util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName) end

--- Returns the vehicle's reference axes for the camera: axes straightened by getLevelAxes, rotated by -rotation degrees around the vertical axis if a rotation is configured.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:104
---@param vehicle table Vehicle object.
---@param configName string|nil Configuration name (to read the rotation).
---@param boundingBox table|nil OOBB already computed; otherwise vehicle:getSpawnWorldOOBB().
---@return vec3  Right axis.
---@return vec3  Forward axis.
---@return vec3  Up axis.
function util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox) end

--- Returns the camera rotation (in degrees): that of the config, otherwise that of the model, otherwise 0.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:72
---@param modelName string Model name.
---@param configName string Configuration name.
---@return number  Rotation in degrees.
function util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName) end

--- Inverse operation of getCameraOffsets: rebuilds the camera's world position and orientation for the vehicle from saved offsets.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:132
---@param posOffset vec3 Saved position offset.
---@param rotOffset quat Saved orientation.
---@param vehicle table|nil Vehicle object (default: player 0's vehicle).
---@param configName string|nil Configuration name.
---@return vec3  Camera world position.
---@return quat  Camera world orientation.
function util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName) end

--- Saves the model's thumbnail config to /vehicles/<model>/info.json and updates the in-memory data.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:41
---@param modelName string Model name.
---@param config table thumbnailConfig table to save.
---@return boolean  Write success.
function util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config) end

--- Saves a configuration's thumbnail config to its info file (known infoFilename, otherwise /vehicles/<model>/info_<config>.json) and updates the in-memory data.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:27
---@param modelName string Model name.
---@param configName string Configuration name.
---@param config table thumbnailConfig table to save.
---@return boolean  false if the existing file is unreadable or if the write fails.
function util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config) end

