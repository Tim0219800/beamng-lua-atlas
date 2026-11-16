---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cylinder checkpoint marker.
---@class scenario_raceMarkers_cylinderMarker
local scenario_raceMarkers_cylinderMarker = {}

--- Removes the created objects.
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:152
function scenario_raceMarkers_cylinderMarker:clearMarkers() end

--- Removes the old objects then creates the base and the cylinder.
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:138
function scenario_raceMarkers_cylinderMarker:createMarkers() end

--- Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup.
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:116
---@param shapeName string Model path.
---@param objectName string Registration name.
---@return table  The created object.
function scenario_raceMarkers_cylinderMarker:createObject(shapeName, objectName) end

--- Calls setVisibility(false).
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:112
function scenario_raceMarkers_cylinderMarker:hide() end

--- Constructor: initializes the state (invisible, per-mode color tables copied).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:25
---@param id integer Unique identifier.
function scenario_raceMarkers_cylinderMarker:init(id) end

--- Chooses the color according to the mode ('hidden' hides, otherwise shows).
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:89
---@param mode string default, next, start, lap, recovery, final, branch or hidden.
function scenario_raceMarkers_cylinderMarker:setMode(mode) end

--- Places base and cylinder on a checkpoint.
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:71
---@param wp table {pos, radius, fadeNear?, fadeFar?}.
function scenario_raceMarkers_cylinderMarker:setToCheckpoint(wp) end

--- Shows or hides the base and the cylinder.
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:102
---@param v boolean Visibility.
function scenario_raceMarkers_cylinderMarker:setVisibility(v) end

--- Calls setVisibility(true).
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:113
function scenario_raceMarkers_cylinderMarker:show() end

--- Per-frame call: recomputes the transparency from the distance to the camera (core_camera.getPosition) and updates the instance colors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:46
function scenario_raceMarkers_cylinderMarker:update() end

