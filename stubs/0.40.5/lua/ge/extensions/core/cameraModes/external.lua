---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/external.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- External mode. Fields: isFanMode, camPos, camVel, camChangeTimeMin/Base/Max, invisibleTime, and the filters autozoom, autopoint, noise, smooth, bobbing, handheld, predictor.
---@class core_cameraModes_external
local core_cameraModes_external = {}

--- Sets the point aimed at by autopoint (vehicle-local offset, ignored in OpenXR).
---Source: lua/ge/extensions/core/cameraModes/external.lua:186
---@param nx vec3 vehicle x axis
---@param ny vec3 vehicle y axis
---@param nz vec3 vehicle z axis
---@param offset vec3|nil world offset
---@param openxrSessionRunning boolean|nil true in an OpenXR session
function core_cameraModes_external:applyOffset(nx, ny, nz, offset, openxrSessionRunning) end

--- The camera teleported: resets autozoom and handheld.
---Source: lua/ge/extensions/core/cameraModes/external.lua:373
function core_cameraModes_external:camTeleported() end

--- The vehicle teleported: calls reset.
---Source: lua/ge/extensions/core/cameraModes/external.lua:370
function core_cameraModes_external:carTeleported() end

--- Chooses a camera position near the vehicle's predicted future position, and the pan speed (zero in fan mode).
---Source: lua/ge/extensions/core/cameraModes/external.lua:117
---@param carPos vec3 current vehicle position
---@param futureCarPos vec3 predicted future position
---@param velLength number speed (m/s)
---@param chancesMultiplier number 1 to 0: restricts the draw area over the tries
---@param carStopped boolean vehicle almost stopped (< 0.5 m/s)
function core_cameraModes_external:findNewCamPosVel(carPos, futureCarPos, velLength, chancesMultiplier, carStopped) end

--- Initializes the state, timers and filters, then calls onSettingsChanged, onVehicleCameraConfigChanged and reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/external.lua:19
function core_cameraModes_external:init() end

--- Hook: re-reads cameraFanVsTV and relays to the bobbing filter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/external.lua:67
function core_cameraModes_external:onSettingsChanged() end

--- Hook: forwards refNodes to autopoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/external.lua:63
function core_cameraModes_external:onVehicleCameraConfigChanged() end

--- Draws the change period of the aimed point and the autopoint spring.
---Source: lua/ge/extensions/core/cameraModes/external.lua:347
---@param paused boolean simulation paused
---@param carStopped boolean vehicle stopped
function core_cameraModes_external:randomizeOffsetSpeeds(paused, carStopped) end

--- Forces the choice of a new camera on the next frame ("switch to a new camera").
---Source: lua/ge/extensions/core/cameraModes/external.lua:96
function core_cameraModes_external:reset() end

--- Sets the vehicle's reference nodes (also for autopoint).
---Source: lua/ge/extensions/core/cameraModes/external.lua:72
---@param centerNodeID integer center node
---@param leftNodeID integer left node
---@param backNodeID integer rear node
function core_cameraModes_external:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Says whether to change camera: start, or minimum delay elapsed and (vehicle invisible too long or too far after the maximum delay).
---Source: lua/ge/extensions/core/cameraModes/external.lua:306
---@param carPos vec3 vehicle position
---@param carVel vec3 vehicle speed
---@param dt number seconds
---@return boolean  true to change
function core_cameraModes_external:shouldSwitchCamera(carPos, carVel, dt) end

--- Chooses a new viewpoint: draws the style (fan/TV), the zoom steps and the durations, then looks for a clear location (40 tries), and sets handheld, noise, smooth.
---Source: lua/ge/extensions/core/cameraModes/external.lua:193
---@param carVel vec3 vehicle speed
---@param carPos vec3 vehicle position
---@param veh userdata vehicle object
---@param nx vec3 vehicle x axis
---@param ny vec3 vehicle y axis
---@param nz vec3 vehicle z axis
---@param carStopped boolean vehicle stopped
---@param openxrSessionRunning boolean|nil OpenXR active
function core_cameraModes_external:switchCamera(carVel, carPos, veh, nx, ny, nz, carStopped, openxrSessionRunning) end

--- Main loop: handles teleports, the change of aimed point and camera, moves the camera, then passes data through the filters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/external.lua:380
---@param data table camData (data.dt is replaced by data.dtSim)
---@return boolean  true
function core_cameraModes_external:update(data) end

