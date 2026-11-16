---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parking spot marker with outlines and decal.
---@class scenario_raceMarkers_parkingraceSpotMarker
local scenario_raceMarkers_parkingraceSpotMarker = {}

--- Removes the outlines (after checking they still exist) and the decal data.
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:70
function scenario_raceMarkers_parkingraceSpotMarker:clearMarkers() end

--- Removes the old objects then creates three TSStatic outlines (collision and decal disabled) and prepares the ground decal data.
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:39
function scenario_raceMarkers_parkingraceSpotMarker:createMarkers() end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:131
function scenario_raceMarkers_parkingraceSpotMarker:hide() end

--- Constructor: initializes position, rotation, size (2.5 x 5 x 0.5), colors and smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:18
---@param id string|integer|nil Identifier, converted to a string (default 'parkingraceSpotMarker'), used in the object names.
function scenario_raceMarkers_parkingraceSpotMarker:init(id) end

--- Sets the target color (smoothed afterwards).
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:114
---@param color table {r, g, b, a} indexed 1 to 4 or with r/g/b/a fields.
function scenario_raceMarkers_parkingraceSpotMarker:setColor(color) end

--- Configures the spot: position, rotation and size, applied to the outlines and the decal.
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:86
---@param pos vec3|nil Center of the spot.
---@param rot quat|nil Orientation.
---@param scl vec3|nil Full size of the spot (m).
function scenario_raceMarkers_parkingraceSpotMarker:setSpot(pos, rot, scl) end

--- Shows or hides the outlines.
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:122
---@param v boolean Visibility.
function scenario_raceMarkers_parkingraceSpotMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:130
function scenario_raceMarkers_parkingraceSpotMarker:show() end

--- Per-frame call when visible: advances the color smoothers, colors the outlines and resubmits the decal to the dynamic decal manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua:133
---@param dt number Frame duration (s).
function scenario_raceMarkers_parkingraceSpotMarker:update(dt) end

