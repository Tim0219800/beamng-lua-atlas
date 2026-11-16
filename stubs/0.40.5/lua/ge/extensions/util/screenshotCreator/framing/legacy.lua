---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/legacy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Legacy (pre-r186184)" framing mode of the screenshot creator: computes the camera position and orientation so that a vehicle fits in the image, with the old method (fixed 20° FOV). It registers with util_screenshotCreator_framingManager via the onScreenshotCreatorCollectFramingModes hook (id "legacy", order 50). It keeps the vehicle's nodes (excluding antennas, flags, non-collidable nodes and nodes below the ground), searches by bisection for the minimum camera distance that keeps all extreme points within the margins, then raises the camera if it goes below 0.75 m above the lowest point.
--- Access: extension `util_screenshotCreator_framing_legacy`: `extensions.load("util_screenshotCreator_framing_legacy")`, then the global `util_screenshotCreator_framing_legacy`
---@class util_screenshotCreator_framing_legacy
---@field dependencies string[] Extensions loaded before: core_vehicle_manager, util_screenshotCreator_settings, util_screenshotCreator_thumbnailConfig.
util_screenshotCreator_framing_legacy = {}

--- Alias of resolve (same function).
---Source: lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:276
---@param context table See resolve.
---@return table|nil  See resolve.
---@return string|nil  Error message.
function util_screenshotCreator_framing_legacy.frame(context) end

--- Builds the geometric framing data of a vehicle: bounding box oriented along the reference axes, center, half-extents, look-at point, camera direction and extreme points (up to 100 nodes max and 100 min per axis). Does not compute the camera distance.
---Source: lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:45
---@param vehicle table Vehicle object.
---@param fixedRotation quat|nil Imposed camera orientation; otherwise computed from the direction (-0.75, -0.66, 0.07) in the vehicle's frame.
---@param configName string|nil Configuration name passed to thumbnailConfig.getReferenceAxes to choose the reference axes.
---@return table  framingData (bb, center, axis0..2, halfExtents, floorZ, lookAtPoint, camRot, camRight/Forward/Up, framingPoints…).
function util_screenshotCreator_framing_legacy.getVehicleFramingData(vehicle, fixedRotation, configName) end

--- Hook called by framingManager when collecting modes. Adds the mode {id = "legacy", label = "Legacy (pre-r186184)", order = 50, fixedFov = 20, supportsFixedRotation = true, resolve} to the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:342
---@param modes table[] List to fill.
function util_screenshotCreator_framing_legacy.onScreenshotCreatorCollectFramingModes(modes) end

--- Computes the legacy framing camera for context.vehicle. Returns a table {pos, rot, fov = 20, name = "legacy camera", debugData, framingData}, or nil and an error message if context.vehicle is missing.
---Source: lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:276
---@param context table Framing context: vehicle (required), resolution ({width, height}), aspectRatio, nearPlane, fixedRotation (imposed quat), configName, useFramingMargins/useMargins (boolean), margin ({left,right,top,bottom,extraBottom}).
---@return table|nil  Framing result (pos: vec3, rot: quat, fov, name, debugData, framingData).
---@return string|nil  Error message.
function util_screenshotCreator_framing_legacy.resolve(context) end

