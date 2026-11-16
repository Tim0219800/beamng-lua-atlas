---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/smooth.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Position smoothing filter.
---@class core_cameraModes_smooth
local core_cameraModes_smooth = {}

--- Creates the springs; if pos is given, initializes them to that position.
---Source: lua/ge/extensions/core/cameraModes/smooth.lua:8
---@param spring number|nil stiffness (30)
---@param damp number|nil damping (10)
---@param pos vec3|nil initial position of the springs
function core_cameraModes_smooth:init(spring, damp, pos) end

--- Smooths data.res.pos axis by axis with data.dt.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/smooth.lua:23
---@param data table camData
---@return boolean  always true
function core_cameraModes_smooth:update(data) end

