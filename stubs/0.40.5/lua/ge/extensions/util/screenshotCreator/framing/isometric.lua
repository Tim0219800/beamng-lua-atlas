---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/isometric.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Fixed isometric" framing mode of screenshotCreator: places the camera at a fixed distance (15 m) from the vehicle's center, in the local direction (-1, -1, 0.75) normalized along the vehicle's reference axes, looking at the center. The position is then recentered orthogonally (up to 8 iterations) so that the projection of the framing points is centered in the usable area of the image, taking any margins into account. It registers via onScreenshotCreatorCollectFramingModes (id "fixedIsometric", order 150).
--- Access: extension `util_screenshotCreator_framing_isometric`: `extensions.load("util_screenshotCreator_framing_isometric")`, then the global `util_screenshotCreator_framing_isometric`
---@class util_screenshotCreator_framing_isometric
---@field dependencies table
util_screenshotCreator_framing_isometric = {}

--- Alias of resolve.
---Source: lua/ge/extensions/util/screenshotCreator/framing/isometric.lua:81
---@param context table See resolve
---@return table|nil  See resolve
---@return string|nil  Error message
function util_screenshotCreator_framing_isometric.frame(context) end

--- Framing mode collection hook: adds the mode {id = 'fixedIsometric', label = 'Fixed isometric', order = 150, fixedDistance, supportsFixedRotation = false, resolve} to the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framing/isometric.lua:131
---@param modes table[] List of modes to complete
function util_screenshotCreator_framing_isometric.onScreenshotCreatorCollectFramingModes(modes) end

--- Computes the fixed isometric camera for the context's vehicle.
---Source: lua/ge/extensions/util/screenshotCreator/framing/isometric.lua:81
---@param context table Context: vehicle (required), configName, resolution, fov/fieldOfView, margin, useFramingMargins
---@return table|nil  {pos, rot, name = 'fixed isometric camera', debugData, framingData} or nil on error
---@return string|nil  Error message if context.vehicle is missing
function util_screenshotCreator_framing_isometric.resolve(context) end

