---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/shake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shake filter. Fields: amp (vec3), freq (vec3), timeOffset (vec3), time.
---@class core_cameraModes_shake
local core_cameraModes_shake = {}

--- Initializes amplitudes, frequencies and random phases.
---Source: lua/ge/extensions/core/cameraModes/shake.lua:8
function core_cameraModes_shake:init() end

--- Applies the position offset and rotation to data.res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/shake.lua:17
---@param data table camData
function core_cameraModes_shake:update(data) end

