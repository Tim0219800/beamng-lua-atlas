---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/trackir.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- TrackIR filter. Field working: true if TrackIR could start.
---@class core_cameraModes_trackir
local core_cameraModes_trackir = {}

--- Marks the mode as global/filter/hidden and starts TrackIR if available.
---Source: lua/ge/extensions/core/cameraModes/trackir.lua:20
function core_cameraModes_trackir:init() end

--- Reads TrackIR.getData and applies translation and rotation to data.res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/trackir.lua:39
---@param data table camData
---@return boolean|nil  true; nil if TrackIR is not active
function core_cameraModes_trackir:update(data) end

