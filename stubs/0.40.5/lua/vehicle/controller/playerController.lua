---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/playerController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main controller (type "main", defaultOrder 500) of the "unicycle" vehicle used for the on-foot player (walking mode). The character is a physical ball (nodes with tag "ball") on which a torque propels the player, with PID stabilization forces that keep the body upright and turn it toward the camera direction. It handles walking, sprinting, jumping, crouching (ball pressure), locking the ball when stopped and freezing. It also implements, as nop, the mandatory main controller API (gearbox, starter...) to be interchangeable with a vehicle controller.
--- Access: controller `playerController` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_playerController
---@field brake number Always 0.
---@field clutchRatio number Always 0.
---@field cycleGearboxModes function nop.
---@field defaultOrder number Default order (500).
---@field engineInfo table Array of 21 static values (index 14 = "manual", index 15 = vehicle object id, index 18 = 1) compatible with the engine info format of the other main controllers.
---@field fireEngineTemperature number Always 0 (main controller API).
---@field sendTorqueData function nop.
---@field setAggressionOverride function nop.
---@field setDefaultForwardMode function nop.
---@field setEngineIgnition function nop.
---@field setGearboxMode function nop.
---@field setStarter function nop.
---@field shiftDown function nop.
---@field shiftToGearIndex function nop.
---@field shiftUp function nop (mandatory main API).
---@field smartParkingBrake function nop.
---@field throttle number Always 0.
---@field type string "main" (mandatory main controller for this vehicle).
---@field vehicleActivated function nop.
local controller_playerController = {}

--- Value < 0: crouches (reduces the ball pressure to ballPressureCrouch); value > 0: gradually stands back up.
---Source: lua/vehicle/controller/playerController.lua:428
---@param value number Input value; only the sign matters.
function controller_playerController.crouch(value) end

--- Draws the debug vectors stored in debugVectors (empty in practice).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:143
---@param focusPos vec3 Focus position (unused).
function controller_playerController.debugDraw(focusPos) end

--- Reads the jbeam parameters, locates the stabilization, ball and locking nodes and beams, enables mapmgr tracking and disables the vehicle's physics sleep.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:480
---@param jbeamData table Controller jbeam data (see notes).
function controller_playerController.init(jbeamData) end

--- Triggers a jump if the character touches the ground, outside the 0.5 s delay and outside freeze.
---Source: lua/vehicle/controller/playerController.lua:417
---@param value number Input value (unused).
function controller_playerController.jump(value) end

--- Called by the engine at each collision particle of a node; estimates the player's speed from the ball's speed and the slip.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:149
---@param p table Physics particle (fields slipVec, nodeVel, id1).
function controller_playerController.nodeCollision(p) end

--- Resets freeze, locking, crouching, walk vector, forces and PIDs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:455
function controller_playerController.reset() end

--- Provides the camera orientation that determines the walking direction and the look direction.
---Source: lua/vehicle/controller/playerController.lua:556
---@param controlData table Table with cameraRotation (quat).
function controller_playerController.setCameraControlData(controlData) end

--- Freezes or unfreezes the character (no more movement, jumping or crouching).
---Source: lua/vehicle/controller/playerController.lua:451
---@param mode integer 1 = frozen, any other value = free.
function controller_playerController.setFreeze(mode) end

--- Sets the speed coefficient (0 walk, 1 sprint).
---Source: lua/vehicle/controller/playerController.lua:409
---@param value number 0 to 1.
function controller_playerController.setSpeedCoef(value) end

--- Toggles crouched/standing.
---Source: lua/vehicle/controller/playerController.lua:442
function controller_playerController.toggleCrouch() end

--- Inverts the speed coefficient (1 - value).
---Source: lua/vehicle/controller/playerController.lua:413
function controller_playerController.toggleSpeedCoef() end

--- Every physics step: applies stabilization forces, yaw forces, the ball's propulsion torque and the jump force.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:170
---@param dt number Time step (s).
function controller_playerController.update(dt) end

--- Fixed step: computes tilt, stabilization and yaw PIDs, the propulsion torque according to the desired speed and handles the ball locking.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:249
---@param dt number Time step (s).
function controller_playerController.updateFixedStep(dt) end

--- Every frame: detects ground/water contact, handles the pressure recovery after crouching, decrements the jump delay and writes electrics.values.gearboxMode and freezeState.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/playerController.lua:360
---@param dt number Graphics time step (s).
function controller_playerController.updateGFX(dt) end

--- Adds to the left/right component (to combine several keys).
---Source: lua/vehicle/controller/playerController.lua:397
---@param value number Increment.
function controller_playerController.walkLeftRight(value) end

--- Sets the left/right component of the walk (+1 = right).
---Source: lua/vehicle/controller/playerController.lua:393
---@param value number -1 to 1.
function controller_playerController.walkLeftRightRaw(value) end

--- Adds to the forward/backward component.
---Source: lua/vehicle/controller/playerController.lua:405
---@param value number Increment.
function controller_playerController.walkUpDown(value) end

--- Sets the forward/backward component of the walk (+1 = forward).
---Source: lua/vehicle/controller/playerController.lua:401
---@param value number -1 to 1.
function controller_playerController.walkUpDownRaw(value) end

return controller_playerController
