# `thrusters`

*File: `lua/vehicle/thrusters.lua` · VM: Vehicle · 189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `thrusters`

Applies thrust to the vehicle: jbeam thrusters ('thrusters' section, driven by an electrics value or in 'auto' mode which produces a thrust proportional to the relative speed between two nodes), force impulses between two nodes, and imposed accelerations/velocities on a cluster of nodes. A modder or a tool (scenarios, script) uses it to push or throw a vehicle for a given duration. The module is only active in the physics loop when there is something to apply.

## Example

```lua
-- push the vehicle forward (inferred: rear base -> front) for 0.5 s
thrusters.applyImpulseBody(5000, 0.5)
-- impose an acceleration of 20 m/s² upward for 0.2 s
thrusters.applyAccel(vec3(0, 0, 20), 0.2)
```

## Notes

- jbeam keys of a thruster (v.data.thrusters): id1 (source node), id2 (destination node), control (name of an electrics value, or 'auto'), factor (1 by default), thrustLimit (max thrust in N, infinite by default). The applied force is min(electrics[control]*factor, thrustLimit) on the node pair (id2, id1), computed in updateGFX and applied at each physics step.
- 'auto' mode: vel = -speed of node id2 relative to id1; if vel > 0.3 m/s, thrust = vel² * factor, capped by thrustLimit; if other thrusters are active, the force measured between the nodes is added (max(0, force)). Note: factor and thrustLimit have no default for auto ones (only the activeThrusters path initializes them): without factor or thrustLimit defined, the arithmetic or the comparison may fail.
- A control that does not exist in electrics causes an error log only once (invalidThrusterControlWarned); it is recommended to use vehicle bindings or an electrics channel.
- applyImpulse/applyImpulseBody/applyAccel activate update() (physics); when nothing is active any more, M.update goes back to nop and updateCorePhysicsStepEnabled() is called again to disable the physics step.
- Bug/inconsistency: applyImpulse and applyImpulseBody replace dt with lastDt (`dt or lastDt`) only when the impulse already exists; for a new impulse they insert the raw dt; if dt is nil, thruster[4] is nil and the computation `ttl - physicsDt` in update() raises an error. Always pass dt.
- Units: forces in N, accelerations in m/s², speeds in m/s, durations in s; angularAccel is an angular acceleration (rad/s², vec3).
- lastDt and physicsDt, updateCorePhysicsStepEnabled are game global variables (not defined in this file).

## Functions

| Function | Description | Line |
|---|---|---|
| `thrusters.applyAccel(accel, dt, nodeId, angularAccel)` | Imposes a linear (and optionally angular) acceleration on the cluster of nodes containing nodeId for dt seconds (obj:applyClusterLinearAngularAccel). Only one acceleration per nodeId at a time: a new call replaces the old one. | 124 |
| `thrusters.applyImpulse(n1, n2, force, dt)` | Applies a constant force between two nodes for dt seconds; if the impulse already exists for this node pair, updates its force and duration. | 95 |
| `thrusters.applyImpulseBody(force, dt)` | Like applyImpulse but between the vehicle's ref node and back node (refNodes[0].ref and .back), i.e. along the longitudinal axis of the chassis. | 109 |
| `thrusters.applyVelocity(velocity, dt, nodeId)` | Makes the cluster reach a given speed over a duration dt, by applying the acceleration (velocity - current speed excluding wheels) / dt. Does nothing if dt is 0. | 137 |
| `thrusters.getAccelDt(nodeId)` | Returns the remaining duration of an acceleration applied by applyAccel/applyVelocity on this node. | 132 |
| `thrusters.init()` | Loads the vehicle's jbeam thrusters (split into auto and controlled), resets the impulses and chooses update/updateGFX. If the vehicle has no thrusters, sets both to nop. *(internal)* | 148 |
| `thrusters.isPhysicsStepUsed()` | Indicates whether the module is currently called at each physics step (M.update == update). *(internal)* | 144 |
| `thrusters.reset()` | Identical to init (M.reset = init): reinitializes the thrusters. *(internal)* | 148 |

### Parameter details

#### `thrusters.applyAccel(accel, dt, nodeId, angularAccel)`

Imposes a linear (and optionally angular) acceleration on the cluster of nodes containing nodeId for dt seconds (obj:applyClusterLinearAngularAccel). Only one acceleration per nodeId at a time: a new call replaces the old one.

- `accel` (*vec3*) : Linear acceleration in m/s² (modified in place at the end of the duration).
- `dt` (*number|nil*) : Duration in seconds (lastDt by default).
- `nodeId` (*integer|nil*) : Node of the cluster (ref node by default, or 0).
- `angularAccel` (*vec3|nil*) : Angular acceleration in rad/s² (zero by default).

#### `thrusters.applyImpulse(n1, n2, force, dt)`

Applies a constant force between two nodes for dt seconds; if the impulse already exists for this node pair, updates its force and duration.

- `n1` (*integer*) : Node (cid) to which the force is applied first.
- `n2` (*integer*) : Node (cid) of the other end.
- `force` (*number*) : Force in N (obj:applyForce(n1, n2, force)).
- `dt` (*number*) : Duration in seconds (must be provided: see bug in notes).

#### `thrusters.applyImpulseBody(force, dt)`

Like applyImpulse but between the vehicle's ref node and back node (refNodes[0].ref and .back), i.e. along the longitudinal axis of the chassis.

- `force` (*number*) : Force in N.
- `dt` (*number*) : Duration in seconds.

#### `thrusters.applyVelocity(velocity, dt, nodeId)`

Makes the cluster reach a given speed over a duration dt, by applying the acceleration (velocity - current speed excluding wheels) / dt. Does nothing if dt is 0.

- `velocity` (*vec3*) : Target speed in m/s.
- `dt` (*number|nil*) : Duration in seconds (lastDt by default).
- `nodeId` (*integer|nil*) : Node of the cluster (ref node by default).

#### `thrusters.getAccelDt(nodeId)`

Returns the remaining duration of an acceleration applied by applyAccel/applyVelocity on this node.

- `nodeId` (*integer*) : Node of the cluster.
- **returns**: number Remaining duration in seconds (0 if there is none).

#### `thrusters.isPhysicsStepUsed()`

Indicates whether the module is currently called at each physics step (M.update == update).

- **returns**: boolean true if there are thrusts in progress.

## Fields

| Field | Type | Description |
|---|---|---|
| `update` | function | nop, or this module's physics function when at least one thruster, impulse or cluster is active. Called at each physics step. ⚠ nop is a game global. |
| `updateGFX` | function | nop, or the function that recomputes the electrics-driven thrusts each graphics frame if the vehicle has jbeam thrusters. |

## Calls into the engine (C++)

- `obj:` `applyClusterLinearAngularAccel`, `applyForce`, `getClusterVelocityWithoutWheels`, `getNodeForce`, `getNodeVelocity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/thrusters.lua`.*
