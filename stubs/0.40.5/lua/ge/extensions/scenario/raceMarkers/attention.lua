---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/attention.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Attention arrow marker.
---@class scenario_raceMarkers_attention
local scenario_raceMarkers_attention = {}

--- Removes the objects created by this marker.
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:177
function scenario_raceMarkers_attention:clearMarkers() end

--- Removes the old objects then creates the arrow.
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:166
function scenario_raceMarkers_attention:createMarkers() end

--- Creates a hidden TSStatic object (shapeName, instance color, not saveable) registered under objectName and added to ScenarioObjectsGroup if it exists.
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:144
---@param shapeName string Path of the .dae model.
---@param objectName string Registration name.
---@return table  The TSStatic object.
function scenario_raceMarkers_attention:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:140
function scenario_raceMarkers_attention:hide() end

--- Constructor: initializes the state (invisible, mode 'hidden', height smoother).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:29
---@param id integer Unique marker identifier.
function scenario_raceMarkers_attention:init(id) end

--- Changes the mode: 'hidden' hides, any other mode shows. Resets the color timer to zero.
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:116
---@param mode string Mode name.
function scenario_raceMarkers_attention:setMode(mode) end

--- Places the marker on a checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:106
---@param wp table {pos = vec3|table, radius = number|nil}.
function scenario_raceMarkers_attention:setToCheckpoint(wp) end

--- Shows or hides the arrow.
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:131
---@param v boolean Visibility.
function scenario_raceMarkers_attention:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:141
function scenario_raceMarkers_attention:show() end

--- Per-frame call. Hides the marker once the fade is finished in 'hidden' mode, turns the arrow toward the camera (core_camera.getPosition), makes it oscillate and applies the color.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/attention.lua:53
---@param dt number Real frame duration (s).
---@param dtSim number Simulated duration (s).
function scenario_raceMarkers_attention:update(dt, dtSim) end

