---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crawl marker with arrow, flags and column.
---@class scenario_raceMarkers_crawlMarker
local scenario_raceMarkers_crawlMarker = {}

--- Hides the marker's objects in the split-screen views of players other than renderViewPlayer.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:454
function scenario_raceMarkers_crawlMarker:applyRenderViewMask() end

--- Removes the created objects (clearing their view mask).
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:518
function scenario_raceMarkers_crawlMarker:clearMarkers() end

--- Removes the old objects then creates the arrow, two flags and column.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:488
function scenario_raceMarkers_crawlMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:466
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_crawlMarker:createObject(shapeName, objectName) end

--- Draws a circle on the minimap at the marker's position, with the mode's color.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:394
---@param td any Drawing context (unused).
function scenario_raceMarkers_crawlMarker:drawOnMinimap(td) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:436
function scenario_raceMarkers_crawlMarker:hide() end

--- Constructor: initializes the state, the smoothers and the colors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:91
---@param id integer Unique identifier.
function scenario_raceMarkers_crawlMarker:init(id) end

--- Places the two flags on either side of the position according to pathDirection, on the ground.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:163
function scenario_raceMarkers_crawlMarker:placeFlags() end

--- Changes mode: shows (except 'hidden'), remembers the old mode and restarts the fade; does nothing more if the mode is unchanged.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:401
---@param mode string default, inactive, current, recovery, bonus, skipped, final, finished or hidden.
function scenario_raceMarkers_crawlMarker:setMode(mode) end

--- Reserves this marker for one player's view (nil for all) and applies the mask.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:461
---@param player integer|nil Player index.
function scenario_raceMarkers_crawlMarker:setRenderViewPlayer(player) end

--- Places the marker on a checkpoint and resets the height caches.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:346
---@param wp table {pos, radius?, fadeNear?, fadeFar?, delay?, dir?, nextPos?}.
function scenario_raceMarkers_crawlMarker:setToCheckpoint(wp) end

--- Shows or hides arrow, flags and column.
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:419
---@param v boolean Visibility.
function scenario_raceMarkers_crawlMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:437
function scenario_raceMarkers_crawlMarker:show() end

--- Per-frame call: color, alpha depending on distance, arrow orientation and height, scale, column.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua:185
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_crawlMarker:update(dt, dtSim) end

