---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/cameraTransition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small Track Builder utility that smoothly moves the free camera to a target position and rotation. It interpolates position (linear) and rotation (nlerp) with an inverted quadratic ease curve (1-(1-t)²), on each onPreRender, via core_camera.setPosRot.
--- Access: extension `util_trackBuilder_cameraTransition`: `extensions.load("util_trackBuilder_cameraTransition")`, then the global `util_trackBuilder_cameraTransition`
---@class util_trackBuilder_cameraTransition
util_trackBuilder_cameraTransition = {}

--- Starts a transition from the current camera to (pos, rot) over time seconds. If time <= 0, places the camera immediately.
---Source: lua/ge/extensions/util/trackBuilder/cameraTransition.lua:39
---@param pos vec3 Target position in the world.
---@param rot quat Target rotation.
---@param time number Duration in seconds; 0 or less for an immediate jump.
function util_trackBuilder_cameraTransition.lerpTo(pos, rot, time) end

--- Hook called before each render: advances the transition, computes the interpolated position and rotation and applies them to the free camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/cameraTransition.lua:22
---@param dt number Time elapsed since the previous frame (s).
function util_trackBuilder_cameraTransition.onPreRender(dt) end

