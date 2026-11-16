---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/overhead.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Arrow marker above the checkpoint.
---@class scenario_raceMarkers_overhead
local scenario_raceMarkers_overhead = {}

--- Removes the created object.
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:189
function scenario_raceMarkers_overhead:clearMarkers() end

--- Removes the old objects then creates the arrow.
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:179
function scenario_raceMarkers_overhead:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:157
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_overhead:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:153
function scenario_raceMarkers_overhead:hide() end

--- Constructor: initializes the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:49
---@param id integer Unique identifier.
function scenario_raceMarkers_overhead:init(id) end

--- 'hidden' hides, other mode shows; remembers the old and new mode.
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:129
---@param mode string default, next, start, lap, final, branch or hidden.
function scenario_raceMarkers_overhead:setMode(mode) end

--- Places the marker on a checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:116
---@param wp table {pos, radius, fadeNear?, fadeFar?}.
function scenario_raceMarkers_overhead:setToCheckpoint(wp) end

--- Shows or hides the arrow.
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:144
---@param v boolean Visibility.
function scenario_raceMarkers_overhead:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:154
function scenario_raceMarkers_overhead:show() end

--- Per-frame call: turns the arrow toward the camera, animates it (0.4 + 0.4*sin) and adjusts color and alpha according to distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/overhead.lua:74
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_overhead:update(dt, dtSim) end

