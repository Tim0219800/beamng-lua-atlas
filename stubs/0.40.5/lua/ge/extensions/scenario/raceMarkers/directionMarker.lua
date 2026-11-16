---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/directionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Direction arrow marker.
---@class scenario_raceMarkers_directionMarker
local scenario_raceMarkers_directionMarker = {}

--- Removes the created object.
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:146
function scenario_raceMarkers_directionMarker:clearMarkers() end

--- Removes the old objects then creates the arrow.
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:135
function scenario_raceMarkers_directionMarker:createMarkers() end

--- Creates a hidden TSStatic (with instanceColor and instanceColor1) registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:112
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_directionMarker:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:109
function scenario_raceMarkers_directionMarker:hide() end

--- Constructor: initializes the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:43
---@param id integer Unique identifier.
function scenario_raceMarkers_directionMarker:init(id) end

--- 'hidden' hides, other mode shows; remembers the mode.
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:88
---@param mode string Mode name.
function scenario_raceMarkers_directionMarker:setMode(mode) end

--- Places the arrow on a checkpoint and applies the color.
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:73
---@param wp table {pos, rot?, radius?}.
function scenario_raceMarkers_directionMarker:setToCheckpoint(wp) end

--- Shows or hides the arrow.
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:100
---@param v boolean Visibility.
function scenario_raceMarkers_directionMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:110
function scenario_raceMarkers_directionMarker:show() end

--- Per-frame call: applies position (with back-and-forth), rotation and scale to the arrow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:56
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_directionMarker:update(dt, dtSim) end

