---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/handheld.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Spring filter on the aiming direction.
---@class core_cameraModes_handheld
local core_cameraModes_handheld = {}

--- Initializes the spring parameters and forces a direction reset on the next update.
---Source: lua/ge/extensions/core/cameraModes/handheld.lua:8
---@param spring number|nil stiffness (20 by default)
---@param damping number|nil damping (5 by default)
---@param rotspring number|nil horizon tilt stiffness (3 by default)
function core_cameraModes_handheld:init(spring, damping, rotspring) end

--- Computes data.res.rot from the smoothed direction from data.res.pos to data.res.targetPos.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/handheld.lua:18
---@param data table camData
---@return boolean  always true
function core_cameraModes_handheld:update(data) end

