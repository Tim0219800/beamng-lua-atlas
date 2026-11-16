---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/onboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onboard camera. jbeam fields: refNodes{ref,left,back}, offset{x,y,z}, rotation, fov, name, idRef/idUp/idBack, canRotate.
---@class core_cameraModes_onboard
local core_cameraModes_onboard = {}

--- Creates the manualzoom, applies the vehicle configuration and resets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/onboard.lua:22
function core_cameraModes_onboard:init() end

--- Hook: recomputes hidden, icon and canUseVehicleTriggerCrosshair from the name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/onboard.lua:30
function core_cameraModes_onboard:onVehicleCameraConfigChanged() end

--- Resets the head rotation to zero and the zoom to default.
---Source: lua/ge/extensions/core/cameraModes/onboard.lua:46
function core_cameraModes_onboard:reset() end

--- Sets the reference nodes.
---Source: lua/ge/extensions/core/cameraModes/onboard.lua:117
---@param centerNodeID integer center/camera node
---@param leftNodeID integer left node
---@param backNodeID integer rear node
function core_cameraModes_onboard:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Places the camera and applies rotation and zoom to data.res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/onboard.lua:53
---@param data table camData
---@return boolean  false if the reference nodes are degenerate, otherwise true
function core_cameraModes_onboard:update(data) end

