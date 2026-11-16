---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/predictor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Target prediction filter.
---@class core_cameraModes_predictor
local core_cameraModes_predictor = {}

--- Sets isFilter, hidden and dtFuture.
---Source: lua/ge/extensions/core/cameraModes/predictor.lua:8
---@param dtFuture number|nil look-ahead in seconds (0.1 by default)
function core_cameraModes_predictor:init(dtFuture) end

--- Advances targetPos and updates data.res.rot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/predictor.lua:14
---@param data table camData
---@return boolean  always true
function core_cameraModes_predictor:update(data) end

