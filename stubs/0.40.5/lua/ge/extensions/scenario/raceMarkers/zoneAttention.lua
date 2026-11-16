---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone marker drawn by debug.
---@class scenario_raceMarkers_zoneAttention
local scenario_raceMarkers_zoneAttention = {}

--- Clears the identifier table.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:153
function scenario_raceMarkers_zoneAttention:clearMarkers() end

--- Kept for API compatibility: creates no object.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:149
function scenario_raceMarkers_zoneAttention:createMarkers() end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:145
function scenario_raceMarkers_zoneAttention:hide() end

--- Constructor: initializes the state (invisible, mode 'hidden', blue color).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:12
---@param id integer Unique identifier.
function scenario_raceMarkers_zoneAttention:init(id) end

--- Sets the countdown state that drives the color.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:130
---@param remaining number|nil Remaining time.
---@param total number|nil Total duration.
---@param done boolean|nil true when the countdown is finished (dark orange color).
function scenario_raceMarkers_zoneAttention:setCountdown(remaining, total, done) end

--- Sets the height of the drawn fence.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:126
---@param h number|nil Height in meters; nil keeps the current value.
function scenario_raceMarkers_zoneAttention:setFenceHeight(h) end

--- 'hidden' hides, other mode shows.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:113
---@param mode string Mode name.
function scenario_raceMarkers_zoneAttention:setMode(mode) end

--- Marks the zone as "rising": dark orange color.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:136
---@param v boolean State.
function scenario_raceMarkers_zoneAttention:setRising(v) end

--- Associates the zone to draw, or a simple position if wp is not a zone.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:84
---@param wp table Zone object {drawDebug, vertices, center?}, or {zone = ...}, or {pos, radius}.
function scenario_raceMarkers_zoneAttention:setToCheckpoint(wp) end

--- Enables or disables drawing.
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:141
---@param v boolean Visibility.
function scenario_raceMarkers_zoneAttention:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:146
function scenario_raceMarkers_zoneAttention:show() end

--- Per-frame call: computes the target color (blue, yellow-to-orange gradient during the countdown, dark orange if rising or finished), smooths it then draws the zone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/zoneAttention.lua:34
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_zoneAttention:update(dt, dtSim) end

