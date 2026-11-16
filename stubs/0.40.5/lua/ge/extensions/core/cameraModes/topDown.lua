---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/topDown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Top-down mode. Fields: alignToCar, tilt, ortho, fov, refNodes.
---@class core_cameraModes_topDown
local core_cameraModes_topDown = {}

--- Restores the state from serialize.
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:99
---@param s table serialize table
function core_cameraModes_topDown:deserialize(s) end

--- Creates the smoothers and default values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:10
function core_cameraModes_topDown:init() end

--- UI settings: align, tilt (0-80), ortho, fov (10-140).
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:109
---@return table[]  descriptors
function core_cameraModes_topDown:listParams() end

--- Hook: default FOV to 20.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:28
function core_cameraModes_topDown:onVehicleCameraConfigChanged() end

--- State for video stream views: alignToCar, fov, tilt, ortho.
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:95
---@return table  state
function core_cameraModes_topDown:serialize() end

--- Changes align, tilt, ortho or fov.
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:118
---@param key string align, tilt, ortho, fov
---@param value any new value
function core_cameraModes_topDown:setParam(key, value) end

--- Sets the vehicle's reference nodes (used for alignToCar).
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:86
---@param centerNodeID integer center node
---@param leftNodeID integer left node
---@param backNodeID integer rear node
function core_cameraModes_topDown:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Computes the pose from speed and heading, writes data.res (pos, rot, fov, targetPos, ortho).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/topDown.lua:32
---@param data table camData
---@return boolean  true
function core_cameraModes_topDown:update(data) end

