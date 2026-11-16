---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/occupant.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Occupant camera mode. Fields: camRot, relativeYaw/Pitch, seatPosition (vec3), seatRotation (degrees), manualzoom, occupantDetached, icon 'personSolid', canUseVehicleTriggerCrosshair = true.
---@class core_cameraModes_occupant
local core_cameraModes_occupant = {}

--- Creates smoothers, shoulder profiles and parameters, then calls onVehicleCameraConfigChanged and onSettingsChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:60
function core_cameraModes_occupant:init() end

--- Indicates whether the mouse is locked or not; on unlock with auto-recentering and the vehicle moving, recenters the head.
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:451
---@param locked boolean true if locked
function core_cameraModes_occupant:mouseLocked(locked) end

--- Hook: on focus gain pushes the "DriverCameraZoom" action map; on loss, removes it and resets the driver zoom to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:108
---@param focused boolean true if the mode takes focus
function core_cameraModes_occupant:onCameraChanged(focused) end

--- Hook: after extensions reload, reloads the config and resets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:161
function core_cameraModes_occupant:onDeserialized() end

--- Hook: the occupant is detached (break group "ocpAttach<seatId>"): the camera will follow the occupant nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:100
---@param breakGroup string name of the broken group
function core_cameraModes_occupant:onOccupantDetached(breakGroup) end

--- Hook: re-reads the cameraDriver* and OpenXR settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:123
function core_cameraModes_occupant:onSettingsChanged() end

--- Hook: resets the seat position and the occupant reference nodes; will reload the seat config on the next update.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:88
function core_cameraModes_occupant:onVehicleCameraConfigChanged() end

--- Hook: the vehicle has been repaired, the occupant is no longer detached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:104
function core_cameraModes_occupant:onVehicleResetted() end

--- Recenters the head, resets the sway and the driver zoom to zero.
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:153
function core_cameraModes_occupant:reset() end

--- Resets the seat (position, tilt) to zero for this vehicle and saves it immediately.
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:136
function core_cameraModes_occupant:resetSeat() end

--- Resets the seat to zero and clears the seat config of all vehicles (cameraDriverVehicleConfigs = {}).
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:145
function core_cameraModes_occupant:resetSeatAll() end

--- Sets the reference nodes; if any of the three is nil, uses the idRef/Left/BackOccupant nodes.
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:443
---@param centerNodeID integer|nil center node
---@param leftNodeID integer|nil left node
---@param backNodeID integer|nil rear node
function core_cameraModes_occupant:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Computes head position and orientation and the FOV, handles seat adjustment and delayed saving (1 s), writes data.res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/occupant.lua:179
---@param data table camData (data.driverZoom, data.lookBack, data.player, data.speed, data.fastSpeedModifier read)
function core_cameraModes_occupant:update(data) end

