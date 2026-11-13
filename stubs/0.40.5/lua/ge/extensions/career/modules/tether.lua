---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tether.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tether` : `extensions.load("career_modules_tether")`, puis la globale `career_modules_tether`
---@class career_modules_tether
---@field onUpdate any
career_modules_tether = {}

---Source : lua/ge/extensions/career/modules/tether.lua:205
---@param t any
function career_modules_tether.addTether(t) end

---Source : lua/ge/extensions/career/modules/tether.lua:228
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function career_modules_tether.drawAxisBox(corner, x, y, z, clr) end

---Source : lua/ge/extensions/career/modules/tether.lua:213
---@param t any
function career_modules_tether.removeTether(t) end

--- breaks when the player walks too far away
---Source : lua/ge/extensions/career/modules/tether.lua:27
---@param p1 any
---@param x1 any
---@param y1 any
---@param z1 any
---@param callback any
---@param data any
function career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data) end

--- breaks when the player walks too far away. one po
---Source : lua/ge/extensions/career/modules/tether.lua:112
---@param p1 any
---@param r1 any
---@param vehId any
---@param r2 any
---@param callback any
---@param data any
function career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data) end

--- breaks when the player walks too far away
---Source : lua/ge/extensions/career/modules/tether.lua:94
---@param p1 any
---@param r1 any
---@param p2 any
---@param r2 any
---@param callback any
---@param data any
function career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data) end

---Source : lua/ge/extensions/career/modules/tether.lua:38
---@param door any
---@param bufferLength any
---@param callback any
---@param data any
function career_modules_tether.startDoorTether(door, bufferLength, callback, data) end

--- breaks when the player walks too far away
---Source : lua/ge/extensions/career/modules/tether.lua:63
---@param p1 any
---@param r1 any
---@param callback any
---@param data any
function career_modules_tether.startSphereTether(p1, r1, callback, data) end

---Source : lua/ge/extensions/career/modules/tether.lua:156
---@param vehId any
---@param radius any
---@param inverse any
---@param callback any
function career_modules_tether.startVehicleTether(vehId, radius, inverse, callback) end

