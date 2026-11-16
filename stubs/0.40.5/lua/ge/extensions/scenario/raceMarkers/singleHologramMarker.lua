---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Single column marker.
---@class scenario_raceMarkers_singleHologramMarker
local scenario_raceMarkers_singleHologramMarker = {}

--- Removes an object from its identifier.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:210
---@param id integer|nil Object identifier.
function scenario_raceMarkers_singleHologramMarker:clearMarker(id) end

--- Removes the column.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:217
function scenario_raceMarkers_singleHologramMarker:clearMarkers() end

--- Removes the old object then creates the column.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:205
function scenario_raceMarkers_singleHologramMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:184
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_singleHologramMarker:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:181
function scenario_raceMarkers_singleHologramMarker:hide() end

--- Constructor: initializes the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:74
---@param id integer Unique identifier.
function scenario_raceMarkers_singleHologramMarker:init(id) end

--- Changes mode: shows (except 'hidden') and starts the fade.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:163
---@param mode string default, next, start, lap, recovery, final, branch or hidden.
function scenario_raceMarkers_singleHologramMarker:setMode(mode) end

--- Places the column on the ground below the checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:131
---@param wp table {pos, radius, normal?, fadeNear?, fadeFar?, minAlpha?}.
function scenario_raceMarkers_singleHologramMarker:setToCheckpoint(wp) end

--- Shows or hides the column.
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:173
---@param v boolean Visibility.
function scenario_raceMarkers_singleHologramMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:182
function scenario_raceMarkers_singleHologramMarker:show() end

--- Per-frame call: fade, color, alpha and column height according to distance, oscillation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:94
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_singleHologramMarker:update(dt, dtSim) end

