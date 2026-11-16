---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/vehicleTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle tracker. Fields: damageThreshold (1 by default), vehicleData, lastDamage, lastDamageDiff, justHadDamage, debugDraw, wheelOffsets, currentCorners, previousCorners.
---@class gameplay_rally_vehicleTracker
local gameplay_rally_vehicleTracker = {}

--- Cumulative damage of the vehicle according to map.objects.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:185
---@return number|nil  Value of damage (0 if absent), nil if no vehicle data.
function gameplay_rally_vehicleTracker:damage() end

--- Indicates whether an impact of at least damageThreshold occurred on the last tick.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:193
---@return boolean  justHadDamage.
function gameplay_rally_vehicleTracker:didJustHaveDamage() end

--- If enabled: magenta sphere (radius 1.5) 2 m above the vehicle, cyan line for the velocity (x2, beyond 0.1 m/s) and text "VehicleTracker | Pos | Speed" in km/h and m/s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:204
function gameplay_rally_vehicleTracker:drawDebugInfo() end

--- Returns getPlayerVehicle(0).
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:54
---@return table|nil  Vehicle object.
function gameplay_rally_vehicleTracker:getVehicle() end

--- Id of player vehicle 0.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:48
---@return integer|nil  Id, or nil without a vehicle.
function gameplay_rally_vehicleTracker:getVehicleId() end

--- Constructor. Gets the player vehicle's data, stores the current damage and computes the wheel offsets in the vehicle's frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:9
---@param damageThreshold number|nil Minimum increase of `damage` to count as an impact; default 1.
function gameplay_rally_vehicleTracker:init(damageThreshold) end

--- To be called every frame: updates vehicleData and the damage state, then draws the debug if enabled. Without a vehicle, resets vehicleData, lastDamage and justHadDamage.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:70
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_rally_vehicleTracker:onUpdate(dtReal, dtSim, dtRaw) end

--- Position of the player vehicle (shared vec3, reused between calls).
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:151
---@return vec3|nil  World position in meters.
function gameplay_rally_vehicleTracker:pos() end

--- Enables or disables the debug drawing.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:200
---@param enabled boolean true to draw.
function gameplay_rally_vehicleTracker:setDebugDraw(enabled) end

--- Norm of the velocity.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:180
---@return number|nil  Speed in m/s.
function gameplay_rally_vehicleTracker:speedMs() end

--- Compares the current damage to the last retained one and updates lastDamage, lastDamageDiff and justHadDamage.
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:115
function gameplay_rally_vehicleTracker:updateVehicleDamage() end

--- Sets vehicleData to map.objects[vehicleId] (or nil).
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:145
---@param vehicleId integer|nil Vehicle id.
function gameplay_rally_vehicleTracker:updateVehicleData(vehicleId) end

--- Velocity of the player vehicle (shared vec3, reused).
---Source: lua/ge/extensions/gameplay/rally/vehicleTracker.lua:168
---@return vec3|nil  Speed in m/s.
function gameplay_rally_vehicleTracker:velocity() end

