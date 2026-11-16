---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/gameengine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Output filter to the engine.
---@class core_cameraModes_gameengine
local core_cameraModes_gameengine = {}

--- isGlobal = true, runningOrder = 1, isFilter = true, hidden = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/gameengine.lua:12
function core_cameraModes_gameengine:init() end

--- Pushes data.res to the main view or to data.renderView.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/gameengine.lua:68
---@param data table camData (data.renderView = view name, 'main' for the player)
function core_cameraModes_gameengine:update(data) end

