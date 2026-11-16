---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/destination.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Route tracking of drift mode ("A to B"). setRacePath loads a race path (gameplay/race/path) from a JSON file, optionally reversed, and extracts its points. Every frame, it computes the remaining distance along this path, the distance to the planned route, whether the vehicle is driving the wrong way, and accumulates the distance driven the wrong way: beyond a threshold (10 m by default) wrongWayFail becomes true. A drift mission modder reads these values to display progress or fail the mission.
--- Access: extension `gameplay_drift_destination`: `extensions.load("gameplay_drift_destination")`, then the global `gameplay_drift_destination`
---@class gameplay_drift_destination
gameplay_drift_destination = {}

--- Indicates whether wrong-way detection and distance computation are disabled (value passed to setRacePath).
---Source: lua/ge/extensions/gameplay/drift/destination.lua:196
---@return boolean|nil  disableWrongWayAndDist, nil before setRacePath.
function gameplay_drift_destination.getDisableWrongWayAndDist() end

--- Distance (m) of the vehicle to the nearest planned road segment.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:192
---@return number  Distance, 0 by default.
function gameplay_drift_destination.getDistToIntendedRoad() end

--- Debug configuration table of the extension: {default = false, canBeChanged = true}.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:184
---@return table  Debug info.
function gameplay_drift_destination.getDriftDebugInfo() end

--- Lua garbage produced by the last frame measured by the profiler.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:188
---@return number  Garbage amount.
function gameplay_drift_destination.getGC() end

--- Indicates whether the vehicle is currently going the wrong way.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:176
---@return boolean|nil  true if wrong way.
function gameplay_drift_destination.getGoingWrongWay() end

--- Loaded race path object (gameplay/race/path).
---Source: lua/ge/extensions/gameplay/drift/destination.lua:164
---@return table|nil  Path, nil before setRacePath.
function gameplay_drift_destination.getPathData() end

--- Remaining distance (m) along the path to the last point.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:172
---@return number|nil  Remaining distance.
function gameplay_drift_destination.getRemainingDist() end

--- Positions of the path points (in travel order, reversed if reverse).
---Source: lua/ge/extensions/gameplay/drift/destination.lua:168
---@return vec3[]|nil  List of positions.
function gameplay_drift_destination.getWaypoints() end

--- True when the accumulated wrong-way distance exceeds maxWrongWayDist.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:180
---@return boolean|nil  Wrong-way failure.
function gameplay_drift_destination.getWrongWayFail() end

--- Per-frame hook: updates remaining distance, wrong way and wrong-way failure (nothing if gameplay_drift_drift has no vehicle position).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/destination.lua:147
function gameplay_drift_destination.onUpdate() end

--- Hook: vehicle reset; sets the last position back to zero so the reset jump is not counted as distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/destination.lua:206
---@param vehicleId integer ID of the reset vehicle.
function gameplay_drift_destination.onVehicleResetted(vehicleId) end

--- Sets the remaining distance, the accumulated wrong-way distance and the last position back to zero (not wrongWayFail).
---Source: lua/ge/extensions/gameplay/drift/destination.lua:200
function gameplay_drift_destination.reset() end

--- Loads the race path from data.filePath (JSON), reverses it if data.reverse, applies autoConfig and extracts the positions of the sorted waypoints.
---Source: lua/ge/extensions/gameplay/drift/destination.lua:27
---@param data table {filePath = string, reverse = boolean|nil, maxWrongWayDist = number|nil (default 10), disableWrongWayAndDist = boolean|nil}.
function gameplay_drift_destination.setRacePath(data) end

