---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/autopoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filter object returned by the constructor. Fields: isFilter, hidden, localOffset (vec3), refNodes {ref,left,back}, smX/smY/smZ (smoothers).
---@class core_cameraModes_autopoint
local core_cameraModes_autopoint = {}

--- Initializes the filter: isFilter and hidden to true, localOffset to (0,0,0) and default spring (rate 5, accel 1). Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/autopoint.lua:8
function core_cameraModes_autopoint:init() end

--- Stores the vehicle reference nodes used to build the local basis.
---Source: lua/ge/extensions/core/cameraModes/autopoint.lua:21
---@param centerNodeID integer Center node (ref)
---@param leftNodeID integer Left node (left)
---@param backNodeID integer Rear node (back)
function core_cameraModes_autopoint:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Creates or recreates the three sigmoid temporal smoothers (X, Y, Z), keeping their current value.
---Source: lua/ge/extensions/core/cameraModes/autopoint.lua:15
---@param rate number Maximum rate of change (units per second)
---@param accel number Smoothing acceleration
function core_cameraModes_autopoint:setSpring(rate, accel) end

--- Applies the smoothed offset to data.res.targetPos and orients data.res.rot toward it. Called by the camera that owns this filter.
---Source: lua/ge/extensions/core/cameraModes/autopoint.lua:28
---@param data table Frame data: veh, dt, res {pos, targetPos, rot, fov}
---@return boolean  Always true
function core_cameraModes_autopoint:update(data) end

