# `controller_playerController`

*File: `lua/vehicle/controller/playerController.lua` · VM: Vehicle · 599 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `playerController` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Main controller (type "main", defaultOrder 500) of the "unicycle" vehicle used for the on-foot player (walking mode). The character is a physical ball (nodes with tag "ball") on which a torque propels the player, with PID stabilization forces that keep the body upright and turn it toward the camera direction. It handles walking, sprinting, jumping, crouching (ball pressure), locking the ball when stopped and freezing. It also implements, as nop, the mandatory main controller API (gearbox, starter...) to be interchangeable with a vehicle controller.

## Example

```lua
local pc = controller.mainController
pc.setCameraControlData({cameraRotation = quat(0, 0, 0, 1)})
pc.walkUpDownRaw(1)   -- move forward
pc.setSpeedCoef(1)    -- sprint
pc.jump(1)
```

## Notes

- jbeam keys read in init (default): movementSpeedNormal (5, m/s), movementSpeedSprint (11, m/s), maxBallTorque (700, N·m), stabilizationMaxForce (8000, N), yawMaxForce (200, N), ballPressureNormal (1.0), ballPressureCrouch (0.5), jumpForce (50000, N), jumpForceTime (0.01, s), slipUsageCoef (1). Nodes (node names/cid): stabilizationTopCenter/TopFront/TopRear/TopLeft/TopRight, stabilizationBottomCenter/BottomFront/BottomRear/BottomLeft/BottomRight, ballCenter. Beam tags: stabilizationBeamFront/Rear/Left/Right/FrontLeft/FrontRight/RearLeft/RearRight/BottomTop (tag values to find on the beams); the beams with tag "lockBeam" are used to lock the ball.
- The code assumes fixed node names: ib7, ib2, ib8 (define the plane where the propulsion torque is applied) and a "ball" pressure group (v.data.pressureGroups.ball); the nodes with tag "ball" define the ball.
- walkLeftRight/walkUpDown add to the current value, the *Raw versions replace it; walkVector is only reset to zero on reset. The vector is expressed relative to the camera's orientation (yaw only) provided by setCameraControlData.
- setSpeedCoef: 0 = walk (movementSpeedNormal), 1 = sprint (movementSpeedSprint), linearly interpolated between the two.
- Without walking (walkVector zero) the ball locks (lockBeam beams stiff); while walking it is unlocked. The lock ramp-up takes 0.4 s + 0.3 s * speedCoef.
- electrics.values: head_rotation (body/camera yaw error, rad), head_tilt, gearboxMode="none", freezeState (boolean). M.engineInfo is a fixed array of 21 elements (default values) for compatibility with engine controllers.
- Fields throttle, brake, clutchRatio, fireEngineTemperature: constant values at 0 provided for the main controller interface. The functions shiftUp, shiftDown, shiftToGearIndex, cycleGearboxModes, setGearboxMode, smartParkingBrake, setStarter, setEngineIgnition, sendTorqueData, vehicleActivated, setAggressionOverride, setDefaultForwardMode are all nop (nop = global engine function that does nothing).
- The lockBeams, ballNodes and ballTorqueNodes arrays are not cleared in init: they accumulate if init is called again on the same Lua state (inferred from code).
- update(dt) applies every physics step the forces prepared by updateFixedStep; nodeCollision(p) is called by the engine at each node particle collision and accumulates the particle rate to estimate the ball's speed.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_playerController.crouch(value)` | Value < 0: crouches (reduces the ball pressure to ballPressureCrouch); value > 0: gradually stands back up. | 428 |
| `controller_playerController.debugDraw(focusPos)` | Draws the debug vectors stored in debugVectors (empty in practice). *(internal)* | 143 |
| `controller_playerController.init(jbeamData)` | Reads the jbeam parameters, locates the stabilization, ball and locking nodes and beams, enables mapmgr tracking and disables the vehicle's physics sleep. *(internal)* | 480 |
| `controller_playerController.jump(value)` | Triggers a jump if the character touches the ground, outside the 0.5 s delay and outside freeze. | 417 |
| `controller_playerController.nodeCollision(p)` | Called by the engine at each collision particle of a node; estimates the player's speed from the ball's speed and the slip. *(internal)* | 149 |
| `controller_playerController.reset()` | Resets freeze, locking, crouching, walk vector, forces and PIDs to zero. *(internal)* | 455 |
| `controller_playerController.setCameraControlData(controlData)` | Provides the camera orientation that determines the walking direction and the look direction. | 556 |
| `controller_playerController.setFreeze(mode)` | Freezes or unfreezes the character (no more movement, jumping or crouching). | 451 |
| `controller_playerController.setSpeedCoef(value)` | Sets the speed coefficient (0 walk, 1 sprint). | 409 |
| `controller_playerController.toggleCrouch()` | Toggles crouched/standing. | 442 |
| `controller_playerController.toggleSpeedCoef()` | Inverts the speed coefficient (1 - value). | 413 |
| `controller_playerController.update(dt)` | Every physics step: applies stabilization forces, yaw forces, the ball's propulsion torque and the jump force. *(internal)* | 170 |
| `controller_playerController.updateFixedStep(dt)` | Fixed step: computes tilt, stabilization and yaw PIDs, the propulsion torque according to the desired speed and handles the ball locking. *(internal)* | 249 |
| `controller_playerController.updateGFX(dt)` | Every frame: detects ground/water contact, handles the pressure recovery after crouching, decrements the jump delay and writes electrics.values.gearboxMode and freezeState. *(internal)* | 360 |
| `controller_playerController.walkLeftRight(value)` | Adds to the left/right component (to combine several keys). | 397 |
| `controller_playerController.walkLeftRightRaw(value)` | Sets the left/right component of the walk (+1 = right). | 393 |
| `controller_playerController.walkUpDown(value)` | Adds to the forward/backward component. | 405 |
| `controller_playerController.walkUpDownRaw(value)` | Sets the forward/backward component of the walk (+1 = forward). | 401 |

### Parameter details

#### `controller_playerController.crouch(value)`

Value < 0: crouches (reduces the ball pressure to ballPressureCrouch); value > 0: gradually stands back up.

- `value` (*number*) : Input value; only the sign matters.

#### `controller_playerController.debugDraw(focusPos)`

Draws the debug vectors stored in debugVectors (empty in practice).

- `focusPos` (*vec3*) : Focus position (unused).

#### `controller_playerController.init(jbeamData)`

Reads the jbeam parameters, locates the stabilization, ball and locking nodes and beams, enables mapmgr tracking and disables the vehicle's physics sleep.

- `jbeamData` (*table*) : Controller jbeam data (see notes).

#### `controller_playerController.jump(value)`

Triggers a jump if the character touches the ground, outside the 0.5 s delay and outside freeze.

- `value` (*number*) : Input value (unused).

#### `controller_playerController.nodeCollision(p)`

Called by the engine at each collision particle of a node; estimates the player's speed from the ball's speed and the slip.

- `p` (*table*) : Physics particle (fields slipVec, nodeVel, id1).

#### `controller_playerController.setCameraControlData(controlData)`

Provides the camera orientation that determines the walking direction and the look direction.

- `controlData` (*table*) : Table with cameraRotation (quat).

#### `controller_playerController.setFreeze(mode)`

Freezes or unfreezes the character (no more movement, jumping or crouching).

- `mode` (*integer*) : 1 = frozen, any other value = free.

#### `controller_playerController.setSpeedCoef(value)`

Sets the speed coefficient (0 walk, 1 sprint).

- `value` (*number*) : 0 to 1.

#### `controller_playerController.update(dt)`

Every physics step: applies stabilization forces, yaw forces, the ball's propulsion torque and the jump force.

- `dt` (*number*) : Time step (s).

#### `controller_playerController.updateFixedStep(dt)`

Fixed step: computes tilt, stabilization and yaw PIDs, the propulsion torque according to the desired speed and handles the ball locking.

- `dt` (*number*) : Time step (s).

#### `controller_playerController.updateGFX(dt)`

Every frame: detects ground/water contact, handles the pressure recovery after crouching, decrements the jump delay and writes electrics.values.gearboxMode and freezeState.

- `dt` (*number*) : Graphics time step (s).

#### `controller_playerController.walkLeftRight(value)`

Adds to the left/right component (to combine several keys).

- `value` (*number*) : Increment.

#### `controller_playerController.walkLeftRightRaw(value)`

Sets the left/right component of the walk (+1 = right).

- `value` (*number*) : -1 to 1.

#### `controller_playerController.walkUpDown(value)`

Adds to the forward/backward component.

- `value` (*number*) : Increment.

#### `controller_playerController.walkUpDownRaw(value)`

Sets the forward/backward component of the walk (+1 = forward).

- `value` (*number*) : -1 to 1.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Always 0. |
| `clutchRatio` | number | Always 0. |
| `cycleGearboxModes` | function | nop. |
| `defaultOrder` | number | Default order (500). |
| `engineInfo` | table | Array of 21 static values (index 14 = "manual", index 15 = vehicle object id, index 18 = 1) compatible with the engine info format of the other main controllers. |
| `fireEngineTemperature` | number | Always 0 (main controller API). |
| `sendTorqueData` | function | nop. |
| `setAggressionOverride` | function | nop. |
| `setDefaultForwardMode` | function | nop. |
| `setEngineIgnition` | function | nop. |
| `setGearboxMode` | function | nop. |
| `setStarter` | function | nop. |
| `shiftDown` | function | nop. |
| `shiftToGearIndex` | function | nop. |
| `shiftUp` | function | nop (mandatory main API). |
| `smartParkingBrake` | function | nop. |
| `throttle` | number | Always 0. |
| `type` | string | "main" (mandatory main controller for this vehicle). |
| `vehicleActivated` | function | nop. |

## Calls into the engine (C++)

- `obj:` `apply3nodeTorque`, `applyForce`, `applyForceVector`, `get3nodeAngularVelocity`, `getBeamLength`, `getBeamVectorFromNode`, `getId`, `getNodeVelocityVector`, `getNodesVector`, `inWater`, `isNodeColliding`, `setBeamLength`, `setBeamSpringDamp`, `setGroupPressureRel`, `setSleepingEnabled`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/playerController.lua`.*
