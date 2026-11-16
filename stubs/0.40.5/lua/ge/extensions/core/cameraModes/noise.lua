---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/noise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera position noise.
---@class core_cameraModes_noise
local core_cameraModes_noise = {}

--- Prepares the offset; each call forces a new draw on the first update.
---Source: lua/ge/extensions/core/cameraModes/noise.lua:8
---@param factor number|nil total noise amplitude in meters (0.2 by default, or the existing self.factor)
function core_cameraModes_noise:init(factor) end

--- Adds the current offset to data.res.pos.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/noise.lua:15
---@param data table camData
function core_cameraModes_noise:update(data) end

