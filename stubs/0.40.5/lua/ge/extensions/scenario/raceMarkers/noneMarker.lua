---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/noneMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marker with no visual effect, same interface as the other race markers.
---@class scenario_raceMarkers_noneMarker
local scenario_raceMarkers_noneMarker = {}

--- Removes nothing.
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:35
function scenario_raceMarkers_noneMarker:clearMarkers() end

--- Creates no object.
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:31
function scenario_raceMarkers_noneMarker:createMarkers() end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:27
function scenario_raceMarkers_noneMarker:hide() end

--- Constructor called by the module: does nothing (the id is not stored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:8
---@param id integer Marker identifier (ignored).
function scenario_raceMarkers_noneMarker:init(id) end

--- Does nothing.
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:20
---@param mode string Ignored.
function scenario_raceMarkers_noneMarker:setMode(mode) end

--- Does nothing.
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:17
---@param wp table Checkpoint data (ignored).
---@param mode string|nil Ignored.
function scenario_raceMarkers_noneMarker:setToCheckpoint(wp, mode) end

--- Does nothing.
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:24
---@param v boolean Ignored.
function scenario_raceMarkers_noneMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:28
function scenario_raceMarkers_noneMarker:show() end

--- Per-frame call: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:12
function scenario_raceMarkers_noneMarker:update() end

