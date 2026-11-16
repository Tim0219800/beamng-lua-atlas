---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Staging plane drawn in debug.
---@class scenario_raceMarkers_dragStagePlane
local scenario_raceMarkers_dragStagePlane = {}

--- Clears the identifier table.
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:30
function scenario_raceMarkers_dragStagePlane:clearMarkers() end

--- Prepares an empty identifier table (no object created).
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:26
function scenario_raceMarkers_dragStagePlane:createMarkers() end

--- Distance from which the plane must be displayed (25 m).
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:59
---@return number  Distance in meters.
function scenario_raceMarkers_dragStagePlane:getShowDistance() end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:87
function scenario_raceMarkers_dragStagePlane:hide() end

--- Constructor: initializes center, axes, half-width 2 m, height 0.5 m, display distance 25 m.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:10
---@param id integer Unique identifier.
function scenario_raceMarkers_dragStagePlane:init(id) end

--- 'hidden' (default) hides, any other mode shows.
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:74
---@param mode string|nil Mode name.
function scenario_raceMarkers_dragStagePlane:setMode(mode) end

--- Sets the plane geometry; each nil argument keeps the current value. across and up are normalized (ignored if nearly zero), halfWidth and height are clamped to a minimum of 0.05.
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:41
---@param center vec3|nil Center of the start line.
---@param across vec3|nil Transverse direction (left to right).
---@param up vec3|nil Upward direction.
---@param halfWidth number|nil Half-width in meters.
---@param height number|nil Wall height in meters.
function scenario_raceMarkers_dragStagePlane:setPlane(center, across, up, halfWidth, height) end

--- Sets the plane center to wp.pos.
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:34
---@param wp table {pos}.
function scenario_raceMarkers_dragStagePlane:setToCheckpoint(wp) end

--- Enables or disables drawing.
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:83
---@param v boolean Visibility.
function scenario_raceMarkers_dragStagePlane:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:91
function scenario_raceMarkers_dragStagePlane:show() end

--- Per-frame call: draws the translucent faces with debugDrawer:drawTriSolid.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:126
---@param dt number Real duration (s), unused.
---@param dtSim number Simulated duration (s), unused.
function scenario_raceMarkers_dragStagePlane:update(dt, dtSim) end

--- Updates the plane from the staging transform and the vehicle's distance to the line.
---Source: lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua:63
---@param stageTransform table|nil {position, x, y, scale?}.
---@param distanceToStage number|nil Distance of the vehicle to the line (m, default 0).
---@param isValidStage boolean|nil Valid placement or not.
function scenario_raceMarkers_dragStagePlane:updateFromStaging(stageTransform, distanceToStage, isValidStage) end

