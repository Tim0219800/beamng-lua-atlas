---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/crash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crash camera. Fields: camMode, veh1Id, veh2Id, hitPoint, camOffset, camPos, fov, cockpitView.
---@class core_cameraModes_crash
local core_cameraModes_crash = {}

--- camMode = 1, hidden = true, cockpitView = false.
---Source: lua/ge/extensions/core/cameraModes/crash.lua:8
function core_cameraModes_crash:init() end

--- Configures the shot (called when the global camera is chosen).
---Source: lua/ge/extensions/core/cameraModes/crash.lua:43
---@param data table veh1Id (vehicle hit), veh2Id (optional), camMode (1|2), hitPoint (vec3), camOffset (vec3, mode 1)
function core_cameraModes_crash:setCustomData(data) end

--- Writes data.res.pos / rot / fov depending on the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/crash.lua:73
---@param data table camData
---@return boolean  always true
function core_cameraModes_crash:update(data) end

