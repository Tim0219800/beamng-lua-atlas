---@meta
-- tim19Atlas stub generated from lua/vehicle/thrusters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applies thrust to the vehicle: jbeam thrusters ('thrusters' section, driven by an electrics value or in 'auto' mode which produces a thrust proportional to the relative speed between two nodes), force impulses between two nodes, and imposed accelerations/velocities on a cluster of nodes. A modder or a tool (scenarios, script) uses it to push or throw a vehicle for a given duration. The module is only active in the physics loop when there is something to apply.
--- Access: global `thrusters`
---@class thrusters
---@field update function nop, or this module's physics function when at least one thruster, impulse or cluster is active. Called at each physics step. ⚠ nop is a game global.
---@field updateGFX function nop, or the function that recomputes the electrics-driven thrusts each graphics frame if the vehicle has jbeam thrusters.
thrusters = {}

--- Imposes a linear (and optionally angular) acceleration on the cluster of nodes containing nodeId for dt seconds (obj:applyClusterLinearAngularAccel). Only one acceleration per nodeId at a time: a new call replaces the old one.
---Source: lua/vehicle/thrusters.lua:124
---@param accel vec3 Linear acceleration in m/s² (modified in place at the end of the duration).
---@param dt number|nil Duration in seconds (lastDt by default).
---@param nodeId integer|nil Node of the cluster (ref node by default, or 0).
---@param angularAccel vec3|nil Angular acceleration in rad/s² (zero by default).
function thrusters.applyAccel(accel, dt, nodeId, angularAccel) end

--- Applies a constant force between two nodes for dt seconds; if the impulse already exists for this node pair, updates its force and duration.
---Source: lua/vehicle/thrusters.lua:95
---@param n1 integer Node (cid) to which the force is applied first.
---@param n2 integer Node (cid) of the other end.
---@param force number Force in N (obj:applyForce(n1, n2, force)).
---@param dt number Duration in seconds (must be provided: see bug in notes).
function thrusters.applyImpulse(n1, n2, force, dt) end

--- Like applyImpulse but between the vehicle's ref node and back node (refNodes[0].ref and .back), i.e. along the longitudinal axis of the chassis.
---Source: lua/vehicle/thrusters.lua:109
---@param force number Force in N.
---@param dt number Duration in seconds.
function thrusters.applyImpulseBody(force, dt) end

--- Makes the cluster reach a given speed over a duration dt, by applying the acceleration (velocity - current speed excluding wheels) / dt. Does nothing if dt is 0.
---Source: lua/vehicle/thrusters.lua:137
---@param velocity vec3 Target speed in m/s.
---@param dt number|nil Duration in seconds (lastDt by default).
---@param nodeId integer|nil Node of the cluster (ref node by default).
function thrusters.applyVelocity(velocity, dt, nodeId) end

--- Returns the remaining duration of an acceleration applied by applyAccel/applyVelocity on this node.
---Source: lua/vehicle/thrusters.lua:132
---@param nodeId integer Node of the cluster.
---@return number  Remaining duration in seconds (0 if there is none).
function thrusters.getAccelDt(nodeId) end

--- Loads the vehicle's jbeam thrusters (split into auto and controlled), resets the impulses and chooses update/updateGFX. If the vehicle has no thrusters, sets both to nop.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/thrusters.lua:148
function thrusters.init() end

--- Indicates whether the module is currently called at each physics step (M.update == update).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/thrusters.lua:144
---@return boolean  true if there are thrusts in progress.
function thrusters.isPhysicsStepUsed() end

--- Identical to init (M.reset = init): reinitializes the thrusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/thrusters.lua:148
function thrusters.reset() end

