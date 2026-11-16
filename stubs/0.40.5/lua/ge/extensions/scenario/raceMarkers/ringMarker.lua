---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/ringMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Checkpoint ring marker.
---@class scenario_raceMarkers_ringMarker
local scenario_raceMarkers_ringMarker = {}

--- Removes the created object.
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:205
function scenario_raceMarkers_ringMarker:clearMarkers() end

--- Removes the old objects then creates the ring.
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:195
function scenario_raceMarkers_ringMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:173
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_ringMarker:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:169
function scenario_raceMarkers_ringMarker:hide() end

--- Constructor: initializes the state and copies the mode table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:56
---@param id integer Unique identifier.
function scenario_raceMarkers_ringMarker:init(id) end

--- Switches to a mode: shows (except 'hidden'), starts the color fade from the old mode and changes the model.
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:146
---@param mode string default, next, start, lap, final, branch or hidden.
function scenario_raceMarkers_ringMarker:setMode(mode) end

--- Places the ring (position, model according to wp.mode, rotation) on a checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:127
---@param wp table {pos, radius, normal?, up?, mode?}.
function scenario_raceMarkers_ringMarker:setToCheckpoint(wp) end

--- Shows or hides the ring.
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:162
---@param v boolean Visibility.
function scenario_raceMarkers_ringMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:170
function scenario_raceMarkers_ringMarker:show() end

--- Per-frame call: advances the color fade, hides the ring once in 'hidden' mode, updates scale and color.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:81
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_ringMarker:update(dt, dtSim) end

