---@meta
-- tim19Atlas stub generated from lua/vehicle/wheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages all the vehicle's wheels on the Lua side: table of wheels (wheels), of rotors (rotators) and of both together (wheelRotators), reading their angular speeds from the physics core, computing braking torques (service brake + parking brake), ABS (realistic / arcade / off modes, with virtual air speed), brake thermals (surface/core temperature, fading, pad glazing, smoke, glow), punctures, brake noise and damage tracking. A modder mostly reads M.wheels[i] to get the speed, slip, load or temperature of a wheel, or calls setABSBehavior / scaleBrakeTorque / setWheelBrakeUpdate to modify braking.
--- Access: global `wheels`
---@class wheels
---@field brakeSurfaceTempOverride number|nil If not nil, forces the surface temperature (°C) of all brakes in the thermal simulation. nil by default.
---@field rotatorCount integer Number of intact rotors.
---@field rotatorIDs table<string, integer> Rotor name -> wheelID.
---@field rotators table<integer, table> Elements of type 'rotator' (rotors without a tire such as propellers or discs), indices 0..rotatorCount-1.
---@field wheelCount integer Number of intact wheels of type wheel (decremented when an axle breaks).
---@field wheelIDs table<string, integer> Wheel name -> wheelID for the wheels.
---@field wheelPower number Total power transmitted to the wheels in W (sum of propulsionTorque*angularVelocity of the intact wheels), recomputed at each updateGFX.
---@field wheelRotatorCount integer Total number of wheels and rotors recognized by the engine. Not decremented when an axle breaks.
---@field wheelRotatorIDs table<string, integer> Wheel/rotor name -> cid in wheelRotators.
---@field wheelRotators table<integer, table> All wheels and rotors, keyed by cid starting at 0. See notes for the fields of a wheel.
---@field wheelTorque number Total propulsion torque in N·m (sum of propulsionTorque*wheelDir), recomputed at each updateGFX.
---@field wheels table<integer, table> 'wheel' type wheels only, contiguous indices 0..wheelCount-1 (filled by initSecondStage).
wheels = {}

--- Hook called when a beam breaks: if it is an axle beam (axleBeams) of a wheel, the wheel is declared broken (torques and speed to 0, damage recorded, wheelCount/rotatorCount counters and speed averages updated).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:119
---@param id integer Index of the broken beam.
function wheels.beamBroke(id) end

--- Marks all wheels and rotors as punctured (isPunctured = true).
---Source: lua/vehicle/wheels.lua:781
function wheels.deflateAllTires() end

--- Marks a wheel as punctured (isPunctured = true); the air leak and the final deflation then take place in updateGFX.
---Source: lua/vehicle/wheels.lua:777
---@param wheelID integer Index (cid) in wheelRotators.
function wheels.deflateTire(wheelID) end

--- First initialization stage: creates the Lua wheel object for each jbeam wheel (default values of the keys brakeTorque, parkingTorque, absHz, punctureLeakRate...), installs the default ABS then initializes the brake thermals. Disables updateGFX/updateWheelTorques/updateWheelVelocities if there are no wheels.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:1217
function wheels.init() end

--- Second stage (after powertrain and controllers): splits wheelRotators into wheels and rotators, computes the left/right side of each wheel, the tire volume, the dynamic radius smoothers and the virtual air speed gains.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:1244
function wheels.initSecondStage() end

--- Creates the brake squeal sounds (3D loop on node1) and flat tire sounds for each wheel. Called when the vehicle sounds are initialized.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:901
function wheels.initSounds() end

--- Indicates whether the module needs to be called at each physics step (at least one wheel).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:1357
---@return boolean  wheelRotatorCount > 0.
function wheels.isPhysicsStepUsed() end

--- Node collision hook: stores the tread node in contact and triggers the body collision sounds (sounds.bodyCollision) when there is slip.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:100
---@param p table Engine collision data (id1, slipForce, materialID, materialID2...).
function wheels.nodeCollision(p) end

--- Resets the state of all wheels (speeds, torques, ABS, punctures, thermals) and restores the initial brake torques. Called on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:896
function wheels.reset() end

--- Resets the ABS mode to the default value of the 'absBehavior' user setting ('realistic' if absent). Used by .Tech.
---Source: lua/vehicle/wheels.lua:760
function wheels.resetABSBehavior() end

--- Resets the wheel counters, damage tracking and virtual air speed state after a reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:1222
function wheels.resetSecondStage() end

--- Scales the brake torque and parking brake torque of all wheels from their initial values (initialBrakeTorque * coef). Not cumulative. Without argument, coef = 0 (brakes off).
---Source: lua/vehicle/wheels.lua:154
---@param coef number|nil Multiplier coefficient (0 if nil).
function wheels.scaleBrakeTorque(coef) end

--- Chooses the ABS mode and rebuilds the brake methods of each wheel (enables the virtual air speed only in realistic); updates electrics.values.hasABS.
---Source: lua/vehicle/wheels.lua:744
---@param behavior string 'realistic', 'arcade' or 'off'.
function wheels.setABSBehavior(behavior) end

--- Replaces the brake computation functions of a wheel (without ABS / with ABS) then rebuilds the active methods. Lets a controller manage the brake torque of a wheel itself.
---Source: lua/vehicle/wheels.lua:1347
---@param wheelName string Wheel name (jbeam name).
---@param brakeUpdateMethodNoABS function function(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt) -> desired brake torque (N·m) without ABS.
---@param brakeUpdateMethodABS function Same signature, version with ABS.
function wheels.setWheelBrakeUpdate(wheelName, brakeUpdateMethodNoABS, brakeUpdateMethodABS) end

--- Changes the rotatorType ('wheel' or 'rotator') of an existing wheel. The wheels/rotators tables are not rebuilt automatically.
---Source: lua/vehicle/wheels.lua:773
---@param wheelID integer cid index in wheelRotators.
---@param rotatorType string 'wheel' or 'rotator'.
function wheels.setWheelRotatorType(wheelID, rotatorType) end

--- Hook called when the user settings change: rereads the 'absBehavior' setting for the default ABS mode (does not change the current mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:756
function wheels.settingsChanged() end

--- Toggles the ABS between 'off' and the default mode (never 'off' as default: falls back to 'realistic') and displays an 'ABS behavior: …' message.
---Source: lua/vehicle/wheels.lua:764
function wheels.toggleABSBehavior() end

--- ABS regulator of a wheel (PID on the slip error). Returns the coefficient 0..1 to apply to the desired brake torque, or 0 if the brake is not applied. Only works at the wheel's absTime period; in between, returns lastABSCoef. Also limits the wheel to the coefficient of the opposite side.
---Source: lua/vehicle/wheels.lua:569
---@param wd table Wheel object.
---@param brake number Brake input 0..1.
---@param invAirspeed number 1 / air speed (s/m).
---@param airspeed number Air speed (m/s): virtual in realistic, electrics.airspeed in arcade.
---@param airspeedCutOff boolean True if the speed exceeds 5 m/s; otherwise the ABS does not modulate (coef 1).
---@param dt number Time step (s).
---@return number  ABS coefficient between 0 and 1.
function wheels.updateABSCoef(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt) end

--- Called each graphics frame: updates brake thermals/sounds, then for each wheel the slip, load, dynamic radius, punctures (spike strip and air leak), wheelPower/wheelTorque, and the electrics values abs, absActive and odometer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:503
---@param dt number Frame time step (s).
function wheels.updateGFX(dt) end

--- Called at each physics step after the powertrain: applies the brake pressure delay and the thermal efficiency, then writes propulsionTorque, brakingTorque and engineReactionTorque into the FFI structure of each wheel (0 if the wheel is broken).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:702
---@param dt number Physics step (s). Unused.
function wheels.updateWheelTorques(dt) end

--- Called at each physics step: reads the angular speeds from the core, computes wheelSpeed, avgWheelAV, wheelspeed, the virtual air speed and the desired brake torques (ABS included) of each wheel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/wheels.lua:624
---@param dt number Physics step (s).
function wheels.updateWheelVelocities(dt) end

