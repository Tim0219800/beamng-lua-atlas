---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomodeAttach.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Attaches the free camera to the player's vehicle during photo mode: the camera keeps its offset relative to the vehicle and follows it every frame (onPreRender). Optionally, it also follows the vehicle's rotation, in yaw only, without pitch or roll. Only works if the active camera is the "free" free camera.
--- Access: extension `util_photomodeAttach`: `extensions.load("util_photomodeAttach")`, then the global `util_photomodeAttach`
---@class util_photomodeAttach
---@field enabled boolean true while the attachment is active
---@field followRotation boolean true if the camera also follows the vehicle's yaw
---@field offsetLocal vec3|nil Offset in the vehicle frame, yaw only (rotation mode)
---@field offsetWorld vec3|nil Camera-to-vehicle offset in world frame (no-rotation mode)
---@field rotOffset quat|nil Camera rotation relative to the vehicle's yaw
util_photomodeAttach = {}

--- Enables or disables the attachment. On activation, stores the free camera's current offset relative to the player vehicle (and its relative orientation if followRotation).
---Source: lua/ge/extensions/util/photomodeAttach.lua:50
---@param en boolean true to enable, any other value disables
---@param opts table|nil Options: followRotation (boolean) to follow the vehicle's yaw
function util_photomodeAttach.enable(en, opts) end

--- Hook called every frame before rendering: repositions the camera relative to the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/photomodeAttach.lua:134
---@param dtReal number Real-time delta in seconds (unused)
---@param dtSim number Simulation time delta (unused)
---@param dtRaw number Raw time delta (unused)
function util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw) end

--- Immediately applies the stored transform to the camera (same processing as done every frame). No effect if the attachment is inactive.
---Source: lua/ge/extensions/util/photomodeAttach.lua:100
function util_photomodeAttach.syncCameraToVehicle() end

