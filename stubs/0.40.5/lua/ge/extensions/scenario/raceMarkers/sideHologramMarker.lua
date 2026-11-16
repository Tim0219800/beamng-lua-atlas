---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gantry marker with pillars, cones, columns and arrow.
---@class scenario_raceMarkers_sideHologramMarker
local scenario_raceMarkers_sideHologramMarker = {}

--- Removes an object from its identifier.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:509
---@param id integer|nil Object identifier.
function scenario_raceMarkers_sideHologramMarker:clearMarker(id) end

--- Deletes all created objects.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:517
function scenario_raceMarkers_sideHologramMarker:clearMarkers() end

--- Removes the old objects then creates the 9 objects.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:495
function scenario_raceMarkers_sideHologramMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:473
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_sideHologramMarker:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:469
function scenario_raceMarkers_sideHologramMarker:hide() end

--- Constructor: initializes the state and the colors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:105
---@param id integer Unique identifier.
function scenario_raceMarkers_sideHologramMarker:init(id) end

--- Changes mode: shows (except 'hidden') and starts the fade.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:413
---@param mode string default, next, start, lap, recovery, final, branch or hidden.
function scenario_raceMarkers_sideHologramMarker:setMode(mode) end

--- Computes the ground positions of the two pillars by raycasts and places all the objects.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:300
---@param wp table {pos, radius, normal?, nextPos?, fadeNear?, fadeFar?, minAlpha?}.
function scenario_raceMarkers_sideHologramMarker:setToCheckpoint(wp) end

--- Shows or hides the 9 objects.
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:425
---@param v boolean Visibility.
function scenario_raceMarkers_sideHologramMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:470
function scenario_raceMarkers_sideHologramMarker:show() end

--- Per-frame call: vertical sway, color fade, column size according to distance, arrow orientation toward nextPos.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:145
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_sideHologramMarker:update(dt, dtSim) end

