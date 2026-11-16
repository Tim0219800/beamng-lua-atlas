# `wheels`

*File: `lua/vehicle/wheels.lua` · VM: Vehicle · 1386 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `wheels`

Manages all the vehicle's wheels on the Lua side: table of wheels (wheels), of rotors (rotators) and of both together (wheelRotators), reading their angular speeds from the physics core, computing braking torques (service brake + parking brake), ABS (realistic / arcade / off modes, with virtual air speed), brake thermals (surface/core temperature, fading, pad glazing, smoke, glow), punctures, brake noise and damage tracking. A modder mostly reads M.wheels[i] to get the speed, slip, load or temperature of a wheel, or calls setABSBehavior / scaleBrakeTorque / setWheelBrakeUpdate to modify braking.

## Example

```lua
-- linear speed of each wheel (m/s) and slip
for i = 0, wheels.wheelCount - 1 do
  local wd = wheels.wheels[i]
  print(wd.name, wd.wheelSpeed, wd.lastSlip, wd.downForce)
end
-- disable ABS
wheels.setABSBehavior('off')
-- brakes at 50%
wheels.scaleBrakeTorque(0.5)
```

## Notes

- Three tables of wheel objects share the SAME Lua tables: wheelRotators = all (wheels + rotors), keyed by cid (jbeam wheel identifier, from 0 to wheelRotatorCount-1); wheels = only those whose rotatorType == 'wheel', reindexed from 0 to wheelCount-1 (contiguous indices); rotators = those whose rotatorType == 'rotator', from 0 to rotatorCount-1. All are 0-based (not 1). Use wheelCount/rotatorCount/wheelRotatorCount as bounds (i = 0..count-1).
- wheelIDs[name], rotatorIDs[name] give the wheelID by name; wheelRotatorIDs[name] gives the cid. wheels only exists after initSecondStage (called after the init of the controllers/powertrain); before that, M.wheels temporarily contains all the wheels keyed by cid.
- wheelCount/rotatorCount decrease during the game when a wheel is torn off (beamBroke); wheelRotatorCount is not decremented. The internal loops use frozen initial counters (initialWheelCountDec...), so M.wheels[i] stays valid even for a broken wheel: test wd.isBroken.
- Fields of a wheel (wd = M.wheelRotators[cid] or M.wheels[i]), SI units:
-   identity: name (string, jbeam name), wheelID / cid (integers), wheelSection, rotatorType ('wheel'|'rotator'), wheelDir (±1, rotation direction relative to forward motion), node1/node2 (axis nodes), nodes / treadNodes (lists of nodes), rayCount (number of spokes), pressureGroup / pressureGroupId, hasTire (boolean), obj (C++ wheel object), coreData (core FFI structure: angularVelocity, angularVelocityBrakeCouple, propulsionTorque, brakingTorque, engineReactionTorque, brakeTorqueApplied...).
-   geometry: radius (m, tire radius; hub radius if no tire), hubRadius (m), tireWidth (m), dynamicRadius (m, effective radius smoothed according to the deformation at contact), inertia (kg·m², sum of mass*distance² of the nodes to the axis), tireVolume (m³, wheels only, computed in initSecondStage), startingPressure (absolute Pa, pressurePSI converted, 105000 psi by default is a raw code default).
-   kinematics: angularVelocity (rad/s, signed), angularVelocityBrakeCouple (rad/s, speed seen by the brake torque), lastAngularVelocity / lastAngularVelocityBrakeCouple (value of the previous step), wheelSpeed (m/s = angularVelocity*wheelDir*dynamicRadius or radius for rotors, signed), isSpeedo (1/0: the wheel counts for the speedometer and avgWheelAV/wheelspeed).
-   contact (updated at each updateGFX): lastSlip (m/s, longitudinal slip), lastSideSlip (m/s, lateral), slipEnergy (slip energy, raw engine value), downForceRaw / downForce (N, raw / smoothed vertical load), peakForce (N), contactDepth (m), contactMaterialID1 / contactMaterialID2 (ground material id; 32 = spike strip, 4 = ignored for collision sounds, -1 = none), lastTreadContactNode (last tread node in contact).
-   torques (N·m): propulsionTorque (engine torque received, written by the powertrain), brakingTorque (effective brake after pressure delay and thermal efficiency), desiredBrakingTorque (max(service brake, parking brake)), desiredMainBrakingTorque (service brake only), frictionTorque (internal friction, written by the powertrain), brakeTorque / initialBrakeTorque (max brake torque, jbeam brakeTorque), parkingTorque / initialParkingTorque (max parking brake), brakeInputSplit and brakeSplitCoef (0..1), isPropulsed (boolean, set to true by powertrain.lua).
-   ABS: hasABS (boolean), absFrequency (Hz, jbeam absHz, 100 by default), absTime (s, period = 1/absFrequency in realistic, 0.01 in arcade), absTimer, absActive (boolean, the ABS is modulating this wheel), lastABSCoef (0..1), slipRatioTarget (jbeam absSlipRatioTarget, 0.18 by default), slipErrorIntegral, lastSlipError, ownWheelSide / oppositeWheelSide ('left'|'right', computed from the position relative to the center of the braked wheels).
-   brake thermals (if enableBrakeThermals): brakeSurfaceTemperature / brakeCoreTemperature (°C), brakeThermalEfficiency (0..1, final braking efficiency = thermal efficiency x glazing), padGlazingFactor (0..1), isBrakeMolten (boolean), brakeMass (kg), brakeDiameter (m, 0.35 by default), brakeType ('vented-disc'|'carbon-ceramic-vented-disc'|'disc'|'drum'), rotorMaterial ('steel'|'aluminum'|'carbon-ceramic'), padMaterial ('basic','premium','sport','semi-race','full-race','carbon-ceramic','godmode'), brakeMeltingPoint (°C), brakeGlowElectricsName ('brakeGlow_<name>', electrics value 0..1).
-   state: isBroken (boolean, broken axle), isPunctured (puncture in progress), isTireDeflated (tire deflated by beamstate), punctureLeakRate (Pa/s, 20000 by default), punctureAngle (rad), torsionReactor / torsionReactorIdx (associated torsion reactor, see powertrain).
- electrics values written: avgWheelAV (rad/s, signed average of the isSpeedo wheels), wheelspeed (m/s, absolute average), virtualAirspeed (m/s), abs (0/1 blinking for the warning light), absActive, hasABS, odometer (m, cumulative), wheelThermals[wheelName] = {brakeSurfaceTemperature, brakeCoreTemperature, brakeThermalEfficiency}.
- The ABS modes are 'realistic' (default, virtual air speed estimated from the wheels and the accelerometer), 'arcade' (uses electrics.airspeed, ABS active on all wheels) and 'off'. The default value comes from the 'absBehavior' setting.
- The service brake reads electrics.values[wd.brakeElectricsName] (default 'brake') multiplied by defaultBrakeInputUsageCoef (1 for wheels, 0 for rotors unless useDefaultBrakeInput).
- Bug/inconsistency: initThermals does `M.updateThermalsGFX = nop`, but updateGFX calls the local variable updateThermalsGFXMethod; M.updateThermalsGFX is never used. Moreover updateThermalsGFXMethod is never set back to nop when the new vehicle has no brake thermals (the old function remains if the module is reloaded without recreating the local state).
- Bug/inconsistency: M.treadNodeLookup is created in initWheels but never filled nor read in this file. M.brakeSurfaceTempOverride (nil by default) allows forcing the brake surface temperature (debug tool).
- Potential bug: updateWheelsGFX indexes v.data.pressureGroups[wd.pressureGroup] without testing that pressureGroups exists during spike strip detection (material 32).
- Minor bug: toggleABSBehavior declares a local defaultABSBehavior that shadows the module's one; no functional effect. A 'broken' wheel keeps its fields but angularVelocity is forced to 0.
- deflateTire(wheelID) indexes M.wheelRotators by cid, not by name: pass the numeric index.

## Functions

| Function | Description | Line |
|---|---|---|
| `wheels.beamBroke(id)` | Hook called when a beam breaks: if it is an axle beam (axleBeams) of a wheel, the wheel is declared broken (torques and speed to 0, damage recorded, wheelCount/rotatorCount counters and speed averages updated). *(internal)* | 119 |
| `wheels.deflateAllTires()` | Marks all wheels and rotors as punctured (isPunctured = true). | 781 |
| `wheels.deflateTire(wheelID)` | Marks a wheel as punctured (isPunctured = true); the air leak and the final deflation then take place in updateGFX. | 777 |
| `wheels.init()` | First initialization stage: creates the Lua wheel object for each jbeam wheel (default values of the keys brakeTorque, parkingTorque, absHz, punctureLeakRate...), installs the default ABS then initializes the brake thermals. Disables updateGFX/updateWheelTorques/updateWheelVelocities if there are no wheels. *(internal)* | 1217 |
| `wheels.initSecondStage()` | Second stage (after powertrain and controllers): splits wheelRotators into wheels and rotators, computes the left/right side of each wheel, the tire volume, the dynamic radius smoothers and the virtual air speed gains. *(internal)* | 1244 |
| `wheels.initSounds()` | Creates the brake squeal sounds (3D loop on node1) and flat tire sounds for each wheel. Called when the vehicle sounds are initialized. *(internal)* | 901 |
| `wheels.isPhysicsStepUsed()` | Indicates whether the module needs to be called at each physics step (at least one wheel). *(internal)* | 1357 |
| `wheels.nodeCollision(p)` | Node collision hook: stores the tread node in contact and triggers the body collision sounds (sounds.bodyCollision) when there is slip. *(internal)* | 100 |
| `wheels.reset()` | Resets the state of all wheels (speeds, torques, ABS, punctures, thermals) and restores the initial brake torques. Called on vehicle reset. *(internal)* | 896 |
| `wheels.resetABSBehavior()` | Resets the ABS mode to the default value of the 'absBehavior' user setting ('realistic' if absent). Used by .Tech. | 760 |
| `wheels.resetSecondStage()` | Resets the wheel counters, damage tracking and virtual air speed state after a reset. *(internal)* | 1222 |
| `wheels.scaleBrakeTorque(coef)` | Scales the brake torque and parking brake torque of all wheels from their initial values (initialBrakeTorque * coef). Not cumulative. Without argument, coef = 0 (brakes off). | 154 |
| `wheels.setABSBehavior(behavior)` | Chooses the ABS mode and rebuilds the brake methods of each wheel (enables the virtual air speed only in realistic); updates electrics.values.hasABS. | 744 |
| `wheels.setWheelBrakeUpdate(wheelName, brakeUpdateMethodNoABS, brakeUpdateMethodABS)` | Replaces the brake computation functions of a wheel (without ABS / with ABS) then rebuilds the active methods. Lets a controller manage the brake torque of a wheel itself. | 1347 |
| `wheels.setWheelRotatorType(wheelID, rotatorType)` | Changes the rotatorType ('wheel' or 'rotator') of an existing wheel. The wheels/rotators tables are not rebuilt automatically. | 773 |
| `wheels.settingsChanged()` | Hook called when the user settings change: rereads the 'absBehavior' setting for the default ABS mode (does not change the current mode). *(internal)* | 756 |
| `wheels.toggleABSBehavior()` | Toggles the ABS between 'off' and the default mode (never 'off' as default: falls back to 'realistic') and displays an 'ABS behavior: …' message. | 764 |
| `wheels.updateABSCoef(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt)` | ABS regulator of a wheel (PID on the slip error). Returns the coefficient 0..1 to apply to the desired brake torque, or 0 if the brake is not applied. Only works at the wheel's absTime period; in between, returns lastABSCoef. Also limits the wheel to the coefficient of the opposite side. | 569 |
| `wheels.updateGFX(dt)` | Called each graphics frame: updates brake thermals/sounds, then for each wheel the slip, load, dynamic radius, punctures (spike strip and air leak), wheelPower/wheelTorque, and the electrics values abs, absActive and odometer. *(internal)* | 503 |
| `wheels.updateWheelTorques(dt)` | Called at each physics step after the powertrain: applies the brake pressure delay and the thermal efficiency, then writes propulsionTorque, brakingTorque and engineReactionTorque into the FFI structure of each wheel (0 if the wheel is broken). *(internal)* | 702 |
| `wheels.updateWheelVelocities(dt)` | Called at each physics step: reads the angular speeds from the core, computes wheelSpeed, avgWheelAV, wheelspeed, the virtual air speed and the desired brake torques (ABS included) of each wheel. *(internal)* | 624 |

### Parameter details

#### `wheels.beamBroke(id)`

Hook called when a beam breaks: if it is an axle beam (axleBeams) of a wheel, the wheel is declared broken (torques and speed to 0, damage recorded, wheelCount/rotatorCount counters and speed averages updated).

- `id` (*integer*) : Index of the broken beam.

#### `wheels.deflateTire(wheelID)`

Marks a wheel as punctured (isPunctured = true); the air leak and the final deflation then take place in updateGFX.

- `wheelID` (*integer*) : Index (cid) in wheelRotators.

#### `wheels.isPhysicsStepUsed()`

Indicates whether the module needs to be called at each physics step (at least one wheel).

- **returns**: boolean wheelRotatorCount > 0.

#### `wheels.nodeCollision(p)`

Node collision hook: stores the tread node in contact and triggers the body collision sounds (sounds.bodyCollision) when there is slip.

- `p` (*table*) : Engine collision data (id1, slipForce, materialID, materialID2...).

#### `wheels.scaleBrakeTorque(coef)`

Scales the brake torque and parking brake torque of all wheels from their initial values (initialBrakeTorque * coef). Not cumulative. Without argument, coef = 0 (brakes off).

- `coef` (*number|nil*) : Multiplier coefficient (0 if nil).

#### `wheels.setABSBehavior(behavior)`

Chooses the ABS mode and rebuilds the brake methods of each wheel (enables the virtual air speed only in realistic); updates electrics.values.hasABS.

- `behavior` (*string*) : 'realistic', 'arcade' or 'off'.

#### `wheels.setWheelBrakeUpdate(wheelName, brakeUpdateMethodNoABS, brakeUpdateMethodABS)`

Replaces the brake computation functions of a wheel (without ABS / with ABS) then rebuilds the active methods. Lets a controller manage the brake torque of a wheel itself.

- `wheelName` (*string*) : Wheel name (jbeam name).
- `brakeUpdateMethodNoABS` (*function*) : function(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt) -> desired brake torque (N·m) without ABS.
- `brakeUpdateMethodABS` (*function*) : Same signature, version with ABS.

#### `wheels.setWheelRotatorType(wheelID, rotatorType)`

Changes the rotatorType ('wheel' or 'rotator') of an existing wheel. The wheels/rotators tables are not rebuilt automatically.

- `wheelID` (*integer*) : cid index in wheelRotators.
- `rotatorType` (*string*) : 'wheel' or 'rotator'.

#### `wheels.updateABSCoef(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt)`

ABS regulator of a wheel (PID on the slip error). Returns the coefficient 0..1 to apply to the desired brake torque, or 0 if the brake is not applied. Only works at the wheel's absTime period; in between, returns lastABSCoef. Also limits the wheel to the coefficient of the opposite side.

- `wd` (*table*) : Wheel object.
- `brake` (*number*) : Brake input 0..1.
- `invAirspeed` (*number*) : 1 / air speed (s/m).
- `airspeed` (*number*) : Air speed (m/s): virtual in realistic, electrics.airspeed in arcade.
- `airspeedCutOff` (*boolean*) : True if the speed exceeds 5 m/s; otherwise the ABS does not modulate (coef 1).
- `dt` (*number*) : Time step (s).
- **returns**: number ABS coefficient between 0 and 1.

#### `wheels.updateGFX(dt)`

Called each graphics frame: updates brake thermals/sounds, then for each wheel the slip, load, dynamic radius, punctures (spike strip and air leak), wheelPower/wheelTorque, and the electrics values abs, absActive and odometer.

- `dt` (*number*) : Frame time step (s).

#### `wheels.updateWheelTorques(dt)`

Called at each physics step after the powertrain: applies the brake pressure delay and the thermal efficiency, then writes propulsionTorque, brakingTorque and engineReactionTorque into the FFI structure of each wheel (0 if the wheel is broken).

- `dt` (*number*) : Physics step (s). Unused.

#### `wheels.updateWheelVelocities(dt)`

Called at each physics step: reads the angular speeds from the core, computes wheelSpeed, avgWheelAV, wheelspeed, the virtual air speed and the desired brake torques (ABS included) of each wheel.

- `dt` (*number*) : Physics step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `brakeSurfaceTempOverride` | number|nil | If not nil, forces the surface temperature (°C) of all brakes in the thermal simulation. nil by default. |
| `rotatorCount` | integer | Number of intact rotors. |
| `rotatorIDs` | table<string, integer> | Rotor name -> wheelID. |
| `rotators` | table<integer, table> | Elements of type 'rotator' (rotors without a tire such as propellers or discs), indices 0..rotatorCount-1. |
| `wheelCount` | integer | Number of intact wheels of type wheel (decremented when an axle breaks). |
| `wheelIDs` | table<string, integer> | Wheel name -> wheelID for the wheels. |
| `wheelPower` | number | Total power transmitted to the wheels in W (sum of propulsionTorque*angularVelocity of the intact wheels), recomputed at each updateGFX. |
| `wheelRotatorCount` | integer | Total number of wheels and rotors recognized by the engine. Not decremented when an axle breaks. |
| `wheelRotatorIDs` | table<string, integer> | Wheel/rotor name -> cid in wheelRotators. |
| `wheelRotators` | table<integer, table> | All wheels and rotors, keyed by cid starting at 0. See notes for the fields of a wheel. |
| `wheelTorque` | number | Total propulsion torque in N·m (sum of propulsionTorque*wheelDir), recomputed at each updateGFX. |
| `wheels` | table<integer, table> | 'wheel' type wheels only, contiguous indices 0..wheelCount-1 (filled by initSecondStage). |

## Calls into the engine (C++)

- `obj:` `addParticleByNodesRelative`, `createSFXSource2`, `cutSFX`, `getEnvTemperature`, `getGroupPressure`, `getNodeTemperature`, `getPosition`, `getWheel`, `getWheelAvgTemperature`, `getWheelCoreTemperature`, `getWheelFFI`, `inSameNodeCluster`, `inWater`, `nodeLineSectionDistance`, `playSFX`, `setBeamSpringDamp`, `setGroupPressure`, `setVolumePitchCT`, `setWheelTorqueAndBrakeTorque`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/wheels.lua`.*
