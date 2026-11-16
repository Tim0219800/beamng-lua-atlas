---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/sideMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Side curves marker.
---@class scenario_raceMarkers_sideMarker
local scenario_raceMarkers_sideMarker = {}

--- Removes the created objects.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:301
function scenario_raceMarkers_sideMarker:clearMarkers() end

--- Removes the old objects then creates base, sides and distant version.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:283
function scenario_raceMarkers_sideMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:261
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_sideMarker:createObject(shapeName, objectName) end

--- Hides and stores the 'hidden' color.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:248
function scenario_raceMarkers_sideMarker:hide() end

--- Constructor: initializes the state and copies the mode table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:69
---@param id integer Unique identifier.
function scenario_raceMarkers_sideMarker:init(id) end

--- Changes mode: shows (except 'hidden'), starts the color fade and changes the sides' model.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:212
---@param mode string default, next, start, lap, final, branch or hidden.
function scenario_raceMarkers_sideMarker:setMode(mode) end

--- Places base, sides and distant marker on a checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:187
---@param wp table {pos, radius, normal?, fadeNear?, fadeFar?, mode?}.
function scenario_raceMarkers_sideMarker:setToCheckpoint(wp) end

--- Shows or hides the three objects.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:235
---@param v boolean Visibility.
function scenario_raceMarkers_sideMarker:setVisibility(v) end

--- Shows, restoring the stored color.
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:254
function scenario_raceMarkers_sideMarker:show() end

--- Per-frame call: handles the near/far fade, the rotation toward the normal or the camera, the colors and the alpha of the base, the sides and the distant version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:104
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_sideMarker:update(dt, dtSim) end

