---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/standard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Standard role class, completed by baseRole (self.veh, self.driver, self.flags, self.state, setAction, resetAction, setTarget, checkTargetVisible...).
---@class gameplay_traffic_roles_standard
local gameplay_traffic_roles_standard = {}

--- Defines the actions fleePostCrash (AI flees, random aggression >= 0.5), followPostCrash (follow or 'road rage' pursuit of the culprit), askInsurance (AI stop) and disabled (stop, 'disabled' state), then merges the baseActions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:15
function gameplay_traffic_roles_standard:init() end

--- Called when this vehicle collides with another. Assigns the fault if the speed exceeds 1.2 times the limit, marks 'selfCollision', targets the other vehicle, emits onTrafficAction(vehId, 'collision', ...), schedules a honk (depending on bravery and number of hits) and stores selfHitCount.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:109
---@param otherId integer Id of the vehicle hit.
---@param data table Collision data; data.count = number of collisions.
function gameplay_traffic_roles_standard:onCollision(otherId, data) end

--- Called when the vehicle takes crash damage. If no collision is ongoing, marks the event 'selfCrash' and, for an AI, emits the hook onTrafficAction(vehId, 'crashDamage', {targetId}).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:86
---@param data table Damage data (not used).
function gameplay_traffic_roles_standard:onCrashDamage(data) end

--- Called when two other traffic vehicles collide. Targets the slower of the two if it is visible, close and ahead; records otherHitCount.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:130
---@param id1 integer First vehicle.
---@param id2 integer Second vehicle.
---@param data table Collision data; data.count = number of collisions.
function gameplay_traffic_roles_standard:onOtherCollision(id1, id2, data) end

--- Called when another vehicle crashes. If this vehicle is close (< 60 m by interactive distance), ahead and visible, marks the event 'otherCrash' and targets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:97
---@param otherId integer Id of the crashed vehicle.
---@param data table Damage data (not used).
function gameplay_traffic_roles_standard:onOtherCrashDamage(otherId, data) end

--- Called for an event reported by another vehicle (e.g. near miss). Ignored if a crash is already active; otherwise, if the vehicle is visible, records the event type and targets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:149
---@param eventType string Event type (e.g. 'nearMiss').
---@param otherId integer Id of the vehicle concerned.
---@param data table Event data (not used).
function gameplay_traffic_roles_standard:onOtherEvent(eventType, otherId, data) end

--- Resets target, timers and driver state (driver.eventType, damageAction, collisionThreshold, collision counters). For an AI, chooses damageAction according to bravery and draws the collision threshold.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:60
function gameplay_traffic_roles_standard:onRefresh() end

--- Called on each traffic tick. Disables the AI vehicle that is too damaged, evaluates the target's visibility and proximity, then chooses a reaction (honk, 'pullOver', follow, flee, switch to pursuit) according to the event and personality. Also handles the delayed honk and the freezing of lights if a light bar is on.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:158
---@param tickTime number Tick duration in seconds (not used in the body).
function gameplay_traffic_roles_standard:onTrafficTick(tickTime) end

--- Called every frame. Decrements actionTimer and ends actions: insurance exchange when both vehicles are stopped within 20 m, end of following/fleeing, end of pulling over; resets the action if the target has disappeared from traffic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/standard.lua:274
---@param dt number Real time delta (s).
---@param dtSim number Simulation delta time (s), used for actionTimer.
function gameplay_traffic_roles_standard:onUpdate(dt, dtSim) end

