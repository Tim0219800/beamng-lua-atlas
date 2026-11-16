---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/crashDetection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Collision ("crash") detector for tracked vehicles. On each frame it compares the vehicle's damage (map.objects[id].damage and sum of section damage) to a threshold that drops as the jerk (forward/backward acceleration jerk) increases, groups close impacts into one crash, then emits hooks. A modder adds a vehicle with addTrackedVehicleById() and listens to onVehicleCrashStarted / onVehicleCrashEnded (used notably by missions and damage gameplay). Depends on gameplay_util_damageAssessment to describe the damaged areas.
--- Access: extension `gameplay_util_crashDetection`: `extensions.load("gameplay_util_crashDetection")`, then the global `gameplay_util_crashDetection`
---@class gameplay_util_crashDetection
---@field dependencies string[] {"gameplay_util_damageAssessment"}
gameplay_util_crashDetection = {}

--- Starts tracking a vehicle to detect its crashes, with optional sensitivity settings.
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:633
---@param vehId_ integer Vehicle id.
---@param crashSettings table|nil minAccel, maxAccel, minDamage, maxDamage, verticallyUnweighted, minVelocity (m/s), groupImpactsDist (m), enableImpactLocationData.
---@param owner string|nil Caller name, for debugging ("unknown" by default).
function gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner) end

--- Returns whether a tracked vehicle is currently in a crash.
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:728
---@param vehId integer Vehicle id.
---@return boolean  false if not tracked.
function gameplay_util_crashDetection.isVehCrashing(vehId) end

--- Returns whether the vehicle is in the tracking list.
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:733
---@param vehId integer Vehicle id.
---@return boolean
function gameplay_util_crashDetection.isVehTracked(vehId) end

--- Hook called after reload: restores the serialized state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:745
---@param data table Table returned by onSerialize.
function gameplay_util_crashDetection.onDeserialized(data) end

--- Hook called when Lua extensions are reloaded: returns the state (tracked vehicles, debug).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:737
---@return table  {trackedVehIds, debug, debugDamageAssessmentUIPtr}
function gameplay_util_crashDetection.onSerialize() end

--- Hook called every frame: updates accelerations, impact detection, end of pre-impact/impact/crash for each tracked vehicle; removes those that no longer exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:599
---@param dtReal number Real time delta (s), unused.
---@param _dtSim number Simulated time delta (s).
function gameplay_util_crashDetection.onUpdate(dtReal, _dtSim) end

--- Hook called when a vehicle is destroyed: removes it from tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:751
---@param vehId integer Id of the destroyed vehicle.
function gameplay_util_crashDetection.onVehicleDestroyed(vehId) end

--- Stops tracking a vehicle.
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:718
---@param vehId integer Vehicle id.
function gameplay_util_crashDetection.removeTrackedVehicleById(vehId) end

--- Resets the crash, current impact and pre-impact data of a tracked vehicle (without removing it).
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:73
---@param vehId integer Vehicle id.
function gameplay_util_crashDetection.resetCrashData(vehId) end

--- Enables or disables debug drawing and the ImGui window.
---Source: lua/ge/extensions/gameplay/util/crashDetection.lua:724
---@param _debug boolean true to enable.
function gameplay_util_crashDetection.setDebug(_debug) end

