---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/race_marker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the 3D checkpoint markers of a scenario race. It creates one marker per waypoint with the chosen type (module scenario/raceMarkers/<type>, sideColumnMarker by default), hides or shows them, sets their mode (current, next, hidden...) and updates them every frame. The markers are hidden in photo mode.
--- Access: extension `scenario_race_marker`: `extensions.load("scenario_race_marker")`, then the global `scenario_race_marker`
---@class scenario_race_marker
---@field idToMarker table Table id -> marker, initial copy of the internal table (see notes).
scenario_race_marker = {}

--- Creates a marker of the given type (or the current type by default), calls createMarkers() and, unless detached, registers it for updates and hiding.
---Source: lua/ge/extensions/scenario/race_marker.lua:29
---@param detached boolean|nil If true, the marker is not managed by this module (no automatic update).
---@param type string|nil Module name in scenario/raceMarkers/, for example 'ringMarker'.
---@return table  The created marker.
function scenario_race_marker.createRaceMarker(detached, type) end

--- Asks each marker that supports it (drawOnMinimap) to draw itself on the minimap.
---Source: lua/ge/extensions/scenario/race_marker.lua:106
---@param td any Drawing context passed as is to the markers (inferred from code).
function scenario_race_marker.drawOnMinimap(td) end

--- Hides all managed markers.
---Source: lua/ge/extensions/scenario/race_marker.lua:17
function scenario_race_marker.hide() end

--- Clears the previous markers and hides those that remain.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/race_marker.lua:50
function scenario_race_marker.init() end

--- Mission end hook: removes the markers and resets the marker type to default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/race_marker.lua:115
function scenario_race_marker.onClientEndMission() end

--- To be called every frame: hides the markers in photo mode (and restores them on exit), otherwise calls marker:update(dt, dtSim) on each.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/race_marker.lua:76
---@param dt number Real frame duration (s).
---@param dtSim number Simulation duration (s).
function scenario_race_marker.render(dt, dtSim) end

--- Sets the mode of each marker from a table waypoint name -> mode; absent names go to 'hidden'.
---Source: lua/ge/extensions/scenario/race_marker.lua:93
---@param wpModes table<string, string> Mode per waypoint name.
function scenario_race_marker.setModes(wpModes) end

--- Places each marker back on the checkpoint data matching its name.
---Source: lua/ge/extensions/scenario/race_marker.lua:98
---@param data table<string, table> Checkpoint data per waypoint name.
function scenario_race_marker.setToCheckpoints(data) end

--- Chooses the marker type then creates one marker per waypoint and places it on its checkpoint (setToCheckpoint). The old markers are removed first. The markers are indexed by wp.name.
---Source: lua/ge/extensions/scenario/race_marker.lua:57
---@param wps table[] List of waypoints, each with a name field.
---@param marker string|nil Module name in scenario/raceMarkers/; nil for the default type sideColumnMarker.
function scenario_race_marker.setupMarkers(wps, marker) end

--- Shows all managed markers.
---Source: lua/ge/extensions/scenario/race_marker.lua:23
function scenario_race_marker.show() end

