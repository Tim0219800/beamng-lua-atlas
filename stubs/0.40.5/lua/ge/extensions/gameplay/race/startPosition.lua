---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/startPosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Start position. Fields: race, id (race:getNextUniqueIdentifier()), name ("Start Position <id>" by default), group, pos (vec3), rot (quat), sortOrder, routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.
---@class gameplay_race_startPosition
local gameplay_race_startPosition = {}

--- Computes the position and rotation to give a vehicle so that it keeps its relative offset from its spawn box, centered on the line.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:139
---@param vehId integer Vehicle id.
---@param lowPrecision boolean|nil true for a vehicle loaded on the first frame.
---@return vec3|nil  New position.
---@return quat|nil  New rotation.
function gameplay_race_startPosition:calculateVehiclePosRot(vehId, lowPrecision) end

--- Draws the start line (filled triangles), a red prism in highlight mode and the name.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:63
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight'.
---@param clr number[]|nil Color {r,g,b,a} between 0 and 1.
function gameplay_race_startPosition:drawDebug(drawMode, clr) end

--- Corners of the area in front of the position: two lists, one of four points (width and length, toward the back of the line along -Y), the other of two points at 0.4 m.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:52
---@param width number|nil Half-width (default 1).
---@param length number|nil Length (default 1).
---@return table  { {4 vec3}, {2 vec3} }
function gameplay_race_startPosition:getFrontCorners(width, length) end

--- Associated road point.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:218
---@return table|nil  Road point.
function gameplay_race_startPosition:getRoutePoint() end

--- Static road point.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:227
---@return table|nil  Road point.
function gameplay_race_startPosition:getStaticRoutePoint() end

--- Constructor: id, name, group 'start', null position and rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:7
---@param race table Owning race or path.
---@param name string|nil Name.
function gameplay_race_startPosition:init(race, name) end

--- Moves a vehicle to the start position. By default with repair (setPositionRotation); with repair = false, safe teleport.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:170
---@param vehId integer Vehicle id.
---@param lowPrecision boolean|nil See calculateVehiclePosRot.
---@param repair boolean|nil Default true; false = safe teleport without repair.
---@return vec3|nil  Applied position.
---@return quat|nil  Computed rotation.
function gameplay_race_startPosition:moveResetVehicleTo(vehId, lowPrecision, repair) end

--- Restores the position from serialized data (group inferred from the name if absent).
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:36
---@param data table Data from onSerialize.
function gameplay_race_startPosition:onDeserialized(data) end

--- Serializes name, group, pos, rot (x,y,z,w) and oldId.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:25
---@return table  JSON data.
function gameplay_race_startPosition:onSerialize() end

--- Sets the position and rotation.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:47
---@param pos vec3 Position.
---@param rot quat Rotation.
function gameplay_race_startPosition:set(pos, rot) end

--- Stores the associated road point and its original distance to the target (distToTarget).
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:211
---@param rp table Road point.
function gameplay_race_startPosition:setRoutePoint(rp) end

--- Stores the static road point and its original distance.
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:222
---@param rp table Road point.
function gameplay_race_startPosition:setStaticRoutePoint(rp) end

--- Aligns the start position on a vehicle: center of its front, orientation of the vehicle (or of the terrain under it).
---Source: lua/ge/extensions/gameplay/race/startPosition.lua:190
---@param vehId integer Vehicle id.
function gameplay_race_startPosition:setToVehicle(vehId) end

