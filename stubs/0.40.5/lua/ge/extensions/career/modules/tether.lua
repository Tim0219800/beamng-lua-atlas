---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tether.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career mode "tether" system: a zone (box, sphere, capsule, gate or vehicle) the player must stay around. When the player (player vehicle 0, or unicycle on foot) leaves the zone, the callback is called once and the tether is removed. The extension's onUpdate hook is wired only while at least one tether is active.
--- Access: extension `career_modules_tether`: `extensions.load("career_modules_tether")`, then the global `career_modules_tether`
---@class career_modules_tether
---@field onUpdate function Is nop at the start; replaced by the real checking loop as soon as a tether is added, set back to nil when the last one is removed (with extensions.hookUpdate to (un)register the hook).
career_modules_tether = {}

--- Adds a tether table (with checkfun and callback) to the active list and enables the onUpdate hook if it is the first.
---Source: lua/ge/extensions/career/modules/tether.lua:205
---@param t table Tether with checkfun(t) and callback(t).
function career_modules_tether.addTether(t) end

--- Draws a translucent box with debugDrawer (faces as triangles, black edges), useful to visualize a box tether.
---Source: lua/ge/extensions/career/modules/tether.lua:228
---@param corner vec3 Corner of the box.
---@param x vec3 X edge vector.
---@param y vec3 Y edge vector.
---@param z vec3 Z edge vector.
---@param clr any Face color, default color(128,64,64,32).
function career_modules_tether.drawAxisBox(corner, x, y, z, clr) end

--- Removes a tether from the list without calling its callback. No effect if t is nil or absent.
---Source: lua/ge/extensions/career/modules/tether.lua:213
---@param t table|nil Tether returned by a start*Tether.
function career_modules_tether.removeTether(t) end

--- Creates an oriented box tether: triggers when the player leaves the box defined by corner p1 and edge vectors x1, y1, z1.
---Source: lua/ge/extensions/career/modules/tether.lua:27
---@param p1 vec3 Corner of the box.
---@param x1 vec3 X edge vector.
---@param y1 vec3 Y edge vector.
---@param z1 vec3 Z edge vector.
---@param callback function Called with the tether when the player has left.
---@param data any Free-form data kept in the tether (t.data).
---@return table  The tether table (to pass to removeTether).
function career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data) end

--- Intended for a capsule between a fixed point and a vehicle (p2 follows the vehicle). See notes: checkfun references an undefined function.
---Source: lua/ge/extensions/career/modules/tether.lua:112
---@param p1 vec3 Fixed point.
---@param r1 number Radius at the fixed point.
---@param vehId integer Vehicle id.
---@param r2 number Radius on the vehicle side.
---@param callback function Called when the player leaves.
---@param data any Free-form data.
---@return table  The tether.
function career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data) end

--- Creates a conical capsule tether between two fixed points, with the radius varying linearly from r1 to r2 along the segment.
---Source: lua/ge/extensions/career/modules/tether.lua:94
---@param p1 vec3 First point.
---@param r1 number Radius at the first point.
---@param p2 vec3 Second point.
---@param r2 number Radius at the second point.
---@param callback function Called when the player leaves.
---@param data any Free-form data.
---@return table  The tether.
function career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data) end

--- Creates a box tether from a zone object in the scene (door[1] = object name), enlarged by bufferLength meters on each axis. Returns nothing if the object is not found.
---Source: lua/ge/extensions/career/modules/tether.lua:38
---@param door table Table whose first element is the scene object name.
---@param bufferLength number|nil Margin added to each axis, default 1.
---@param callback function Called when the player leaves.
---@param data any Free-form data.
---@return table|nil  The tether, or nil if the object is not found.
function career_modules_tether.startDoorTether(door, bufferLength, callback, data) end

--- Creates a spherical tether: triggers when the player's vehicle is more than r1 meters from p1.
---Source: lua/ge/extensions/career/modules/tether.lua:63
---@param p1 vec3 Center.
---@param r1 number Radius in meters.
---@param callback function Called when the player leaves.
---@param data any Free-form data.
---@return table  The tether.
function career_modules_tether.startSphereTether(p1, r1, callback, data) end

--- Creates a tether around a vehicle: triggers when the player is more than radius meters from the vehicle, or, if inverse is true, when they are less than radius meters away.
---Source: lua/ge/extensions/career/modules/tether.lua:156
---@param vehId integer Id of the tracked vehicle.
---@param radius number Radius in meters.
---@param inverse boolean|nil If true, triggers on approach rather than on moving away.
---@param callback function Called on trigger.
---@return table  The tether.
function career_modules_tether.startVehicleTether(vehId, radius, inverse, callback) end

