---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marker with two side columns.
---@class scenario_raceMarkers_sideColumnMarker
local scenario_raceMarkers_sideColumnMarker = {}

--- Clears the objects' render masks then hides them in the split-screen views of players other than renderViewPlayer (render_splitScreen.getPlayers).
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:233
function scenario_raceMarkers_sideColumnMarker:applyRenderViewMask() end

--- Removes an object from its identifier (render mask cleared before removal).
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:288
---@param id integer|nil Object identifier.
function scenario_raceMarkers_sideColumnMarker:clearMarker(id) end

--- Removes base and columns.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:299
function scenario_raceMarkers_sideColumnMarker:clearMarkers() end

--- Removes the old objects then creates the base and the two columns, and applies the view mask.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:280
function scenario_raceMarkers_sideColumnMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:257
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_sideColumnMarker:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:229
function scenario_raceMarkers_sideColumnMarker:hide() end

--- Constructor: initializes the state and calls clearMarkers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:67
---@param id integer Unique identifier.
function scenario_raceMarkers_sideColumnMarker:init(id) end

--- Changes mode: shows (except 'hidden') and starts the color fade.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:201
---@param mode string default, next, start, lap, recovery, final, branch or hidden.
function scenario_raceMarkers_sideColumnMarker:setMode(mode) end

--- Reserves this marker for one player's view (nil for all) and applies the mask.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:252
---@param player integer|nil Player index.
function scenario_raceMarkers_sideColumnMarker:setRenderViewPlayer(player) end

--- Places base and columns on a checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:175
---@param wp table {pos, radius, normal?, fadeNear?, fadeFar?, minAlpha?}.
function scenario_raceMarkers_sideColumnMarker:setToCheckpoint(wp) end

--- Shows or hides base and columns.
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:213
---@param v boolean Visibility.
function scenario_raceMarkers_sideColumnMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:230
function scenario_raceMarkers_sideColumnMarker:show() end

--- Per-frame call: computes color, alpha, size of the base and columns from the distance to the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua:99
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_sideColumnMarker:update(dt, dtSim) end

