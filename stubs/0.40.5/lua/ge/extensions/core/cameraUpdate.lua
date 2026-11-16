---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Per-frame camera update loop, separate from core/camera.lua. It processes the player's main view then the extra render contexts (split screen, video streams): fills camData (position, velocity, dt, tracked vehicle), calls the selected camera mode (global camera or vehicle camera), then the "running" cameras (filters), and copies the result into finalCameraData. core_camera injects its state via setup() and exposes onPreRender / onClientPostStartMission as its own callbacks; a modder does not normally call anything here.
--- Access: extension `core_cameraUpdate`: `extensions.load("core_cameraUpdate")`, then the global `core_cameraUpdate`
---@class core_cameraUpdate
core_cameraUpdate = {}

--- Hook called after a level starts: forgets the level's nearClip and the camera's inside/outside state so that the SSAO radius is reapplied.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraUpdate.lua:79
function core_cameraUpdate.onClientPostStartMission() end

--- Called every frame before rendering (via core_camera): updates the main view then each extra context. Does nothing while levelLoaded is false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraUpdate.lua:308
---@param dtReal number smoothed render dt, in seconds
---@param dtSim number smoothed simulation dt (accounts for slow motion/pause), in seconds
---@param dtRaw number raw render dt, real clock, in seconds
function core_cameraUpdate.onPreRender(dtReal, dtSim, dtRaw) end

--- Receives from core/camera.lua its state tables and utility functions (extraContexts, mainContext, moveManager, getGlobalCameras, getVehicleData, getRunningCamsOrder, setGlobalCameraByName, set, vehicleChanged, isInsideBasedOnCameras, isUnicycle, cameraM). Called once by core_camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraUpdate.lua:22
---@param deps table Table of dependencies injected by core_camera, keys listed above.
function core_cameraUpdate.setup(deps) end

