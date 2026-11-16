---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/procedural.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Procedural" framing mode (default mode) of the screenshot creator. From the vehicle's nodes, it computes the camera that makes the vehicle fit in the image with given margins: nodes disabled by the nodeOutpaint module are ignored, those below the ground and automatic mirrors are handled separately, then a bisection search finds the minimum distance along a camera rail. If there is no solution, a fallback position and an optimized rotation are used. Registers via the onScreenshotCreatorCollectFramingModes hook (id "procedural", order 100).
--- Access: extension `util_screenshotCreator_framing_procedural`: `extensions.load("util_screenshotCreator_framing_procedural")`, then the global `util_screenshotCreator_framing_procedural`
---@class util_screenshotCreator_framing_procedural
---@field dependencies string[] Extensions loaded before: thumbnailConfig, nodeOutpaint, settings, vehicleSetup (prefix util_screenshotCreator_).
util_screenshotCreator_framing_procedural = {}

--- Alias of resolve (same function).
---Source: lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:438
---@param context table See resolve.
---@return table|nil  See resolve.
---@return string|nil  Error message.
function util_screenshotCreator_framing_procedural.frame(context) end

--- Prepares the framing data: classifies the vehicle's nodes (enabled, disabled, below ground, mirrors), computes the bounding box, the look-at point, the camera rail and the extreme points used for framing and rotation. Falls back to the corners of the vehicle's box if no node is enabled.
---Source: lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:135
---@param context table Same context as resolve (vehicle, configName, cameraHeight, cameraAxisDownOffset).
---@return table|nil  framingData.
---@return string|nil  "No above-ground framing points" if nothing is usable.
function util_screenshotCreator_framing_procedural.getVehicleFramingData(context) end

--- Hook called by framingManager when collecting modes. Adds {id = "procedural", label = "Procedural", order = 100, supportsFixedRotation = true, resolve}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:522
---@param modes table[] List to fill.
function util_screenshotCreator_framing_procedural.onScreenshotCreatorCollectFramingModes(modes) end

--- Computes the procedural framing camera for context.vehicle. Returns {pos, rot, name = "procedural camera", debugData, framingData}, or nil and an error message.
---Source: lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:438
---@param context table vehicle (required), resolution, fov/fieldOfView, nearPlane, aspectRatio, fixedRotation (quat), configName, cameraHeight, cameraAxisDownOffset, useFramingMargins/useMargins, margin ({left,right,top,bottom}).
---@return table|nil  Framing result (pos: vec3, rot: quat, name, debugData, framingData).
---@return string|nil  Error message.
function util_screenshotCreator_framing_procedural.resolve(context) end

--- Internal assertion-based test on the selection of rotation nodes (below-ground nodes and mirrors kept, disabled nodes excluded, fallback to backup points). Returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:107
---@return boolean  Always true (otherwise an assertion fails).
function util_screenshotCreator_framing_procedural.selfCheck() end

