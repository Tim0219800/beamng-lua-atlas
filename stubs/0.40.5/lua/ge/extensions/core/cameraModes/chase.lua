---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/chase.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the 'chase' mode for a vehicle. Main fields: defaultRotation, camRot, distance, defaultDistance, camMinDist, camDist, mode, fov, offset, refNodes {ref,left,back}, forwardLooking, rollSmoothing, collision.
---@class core_cameraModes_chase
local core_cameraModes_chase = {}

--- Initializes the smoothers, the follow state, the collision module and applies the configuration, the settings and a reset. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/chase.lua:13
function core_cameraModes_chase:init() end

--- Returns the list of adjustable settings for the camera control UI / video stream: only the FOV (10 to 140 degrees, step 1, default 65) since the distance is recomputed every frame.
---Source: lua/ge/extensions/core/cameraModes/chase.lua:62
---@return table  List of descriptors {key='fov', icon, title, kind='range', type='int', value, default, min, max, step, unit}
function core_cameraModes_chase:listParams() end

--- Hook called when the mouse is locked or released: on release, resets the accumulated relative input (relYaw, relPitch).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/chase.lua:261
---@param locked boolean true if the mouse is locked
function core_cameraModes_chase:mouseLocked(locked) end

--- Re-reads the settings (cameraOrbitRelaxation, cameraChaseRollSmoothing), notifies the collision module and does a reset. Called when settings change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/chase.lua:54
function core_cameraModes_chase:onSettingsChanged() end

--- Applies the camera's jbeam configuration: defaultRotation (y inverted, default (0,-17,0)), distances, mode ('ref' by default), FOV (65 by default), offset. Called on creation and when the vehicle's jbeam data changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/chase.lua:35
function core_cameraModes_chase:onVehicleCameraConfigChanged() end

--- Puts the camera back behind the vehicle (default rotation, x to 0, looking forward) and forces a realignment on the next frame.
---Source: lua/ge/extensions/core/cameraModes/chase.lua:72
function core_cameraModes_chase:reset() end

--- Applies an adjustable setting. Only the 'fov' key is handled.
---Source: lua/ge/extensions/core/cameraModes/chase.lua:68
---@param key string Setting key ('fov')
---@param value number|string New value (converted by tonumber)
function core_cameraModes_chase:setParam(key, value) end

--- Stores the vehicle's reference nodes (center, left, rear), called by camera.lua when the camera is created.
---Source: lua/ge/extensions/core/cameraModes/chase.lua:254
---@param centerNodeID integer Center node (ref)
---@param leftNodeID integer Left node
---@param backNodeID integer Rear node
function core_cameraModes_chase:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Per-frame computation, called by cameraUpdate when this mode is the focused camera: reads the MoveManager inputs, computes the vehicle's direction and up from the reference nodes, positions the camera behind the target (rotation and distance smoothing) and writes data.res.pos, rot, fov, targetPos, then applies collision.
---Source: lua/ge/extensions/core/cameraModes/chase.lua:82
---@param data table Frame data: veh, pos, dt, res {pos, rot, fov, targetPos...}
---@return boolean  true if the result is valid, false if the reference nodes are degenerate
function core_cameraModes_chase:update(data) end

