# `hydraulicCylinder`

*File: `lua/vehicle/powertrain/hydraulicCylinder.lua` · VM: Vehicle · 818 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `hydraulicCylinder` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Hydraulic cylinder: this is NOT a standalone powertrain component. It is a hydraulic "consumer" created by hydraulicPump.new for each entry of `v.data.powertrainHydros` whose `connectedPump` is the name of the pump and whose `type` is 'hydraulicCylinder'. The cylinder pushes or pulls beams (identified by `beamTags`) via obj:actuateBeam according to the valve position (electrics value `directionElectricsName`, -1 to 1) and the pressure supplied by the pump, returns the consumed flow to the pump, supports several valve types (float, closed, tandem, drop, bypass), telescopic stages and a position control mode (PID).

## Example

```lua
-- jbeam (powertrainHydros section): a cylinder linked to the pump "hydraulicPump"
-- {"name":"liftCyl", "type":"hydraulicCylinder", "connectedPump":"hydraulicPump", "beamTags":["lift"], "directionElectricsName":"liftInput", "pistonDiameter":0.1, "shaftDiameter":0.06, "minExtend":1, "maxExtend":2, "maxSpeed":0.5}
electrics.values.liftInput = 1 -- command -1..1
```

## Notes

- Keys read (cylinderData = merge of the powertrainHydros entry and v.data[name]): name, direction (sign: -1 reverses the direction), valveType ('closed' by default, 'float', 'tandem', 'drop', 'bypass'), hasRegen (false), regenDirection (1), dropInputThreshold (-0.8), tandemCenterFlowCoef (0.1), cylinderReliefPressure (Pa, 50000000), cylinderReliefSlipSpeedLimit (m/s, 0.1), minimumDragCoef (10000000), maximumDragCoef (100000000), frictionCoef (N, 1), stageTransitionZoneWidth (m, 0.03), maxSpeed (m/s, required), minExtend and maxExtend (m, required), virtualMassOut (-1), virtualMass (= virtualMassOut), directionElectricsName, currentExtendElectricsName, currentExtendPercentElectricsName, cylinderForceSmoothing (100), cylinderVelocitySmoothing (20), maxBypassSpeed (= cylinderReliefSlipSpeedLimit), pistonDiameter (m, min 0.001), shaftDiameter (m, min 0.0001), stages (list of {stageExtendStart, stageExtendEnd, pistonDiameter, shaftDiameter}), beamTags, and for the sounds: movementLoopEvent, movementLoopNode, movementLoopVelocitySmoothing(In|Out)Rate, ...StartAccel, ...StopAccel, movementLoopVolumeMin/Max, movementLoopVolumeMinVelocity/MaxVelocity, showDebugGraphSound.
- Public fields of the cylinder: name, connectedPump (pump device), valveType, valveMode ('direct' or 'position'), valvePosition (-1..1 after fourth-root curve), valveSign (-1, 0 or 1), currentExtend (m, average of the beam lengths), currentExtendPercent (0..1), velocity (m/s), cylinderFlow (m³/s, consumed flow), targetPosition (0..1, used in position mode), minExtend, maxExtend, maxSpeed, beamCids, beamCount, stages, currentStageId.
- Return value of update(inputPressure, dt): two numbers (consumed flow in m³/s, flow returned to the reservoir in m³/s). The first is always >= 0. Only the 'tandem' valve returns a non-zero reservoir flow.
- Valve types: float = A and B to the reservoir, no holding force, pressure * |valve position|; closed = A, B, P, T blocked (high holding force); tandem = like closed but P connected to the reservoir at center (leak flow); drop = beyond the dropInputThreshold threshold, A and B are connected to the reservoir (the cylinder drops, useful for a loader bucket); bypass = the fluid can enter without resistance when the load is in the direction of actuation. An unknown type logs an error and installs the update function that does nothing.
- Position mode: setState with a target position outside the dead zone (0.005) enables valveMode = 'position'; a PID (1, 0.4, 0) then computes the valve position; the cylinder goes back to 'direct' mode as soon as the error falls below the dead zone.
- Telescopic stages: if stages contains several elements, transition stages of width stageTransitionZoneWidth are inserted and their areas are linearly interpolated according to the extension.
- Minor bug: in updateGFX, valvePosition * cylinder.direction or 1 never applies the "or 1" (cylinder.direction is never nil). getValvePosition returns nil if valveMode is neither 'direct' nor 'position'. Without a beam found (unknown beamTags), the cylinder installs updateDummy and writes an error in the log.
- The module only exposes `new`; M.deviceCategories and M.outputPorts do not exist.

## Functions

| Function | Description | Line |
|---|---|---|
| `hydraulicCylinder.new(cylinderData, pumpDevice)` | Builds a hydraulic cylinder: piston and rod areas (or telescopic stages), beams to actuate from the beamTags tags, valve, smoothers, position PID. Called by hydraulicPump.new for each declared consumer. *(internal)* | 592 |

### Parameter details

#### `hydraulicCylinder.new(cylinderData, pumpDevice)`

Builds a hydraulic cylinder: piston and rod areas (or telescopic stages), beams to actuate from the beamTags tags, valve, smoothers, position PID. Called by hydraulicPump.new for each declared consumer.

- `cylinderData` (*table*) : Cylinder data (powertrainHydros entry merged with v.data[name]).
- `pumpDevice` (*table*) : hydraulicPump device to which the cylinder is connected (its name is used to name the state keys).
- **returns**: table The cylinder (class `cylinder`).

## Class `cylinder`

Object returned by new(cylinderData, pumpDevice). The update method changes according to the valve type (setValveType).

Object `cylinder` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `cylinder:getCylinderStage()` | Returns the active stage of the cylinder for the current extension. Conventional version: always the first stage. Telescopic version: raw stage, with interpolated areas if it is a transition. | 94 |
| `cylinder:getRawCylinderStage()` | Searches the list of stages for the one that contains the current extension, starting from the current stage (local search). Stores currentStageId. | 40 |
| `cylinder:getState()` | Returns the saveable state: key '<pump>_<cylinder>_target_position' = current extension as a percentage (0..1). | 563 |
| `cylinder:initSounds(cylinderData)` | Creates the movement sound loop (if movementLoopEvent is defined) and the speed and volume smoothers. | 490 |
| `cylinder:reset(jbeamData)` | Resets speed, smoothers, valve position, mode (direct), target position (current position), PID, current stage and reinitializes the extension electrics values. | 520 |
| `cylinder:resetSounds(cylinderData)` | Resets the movement sound speed smoother. | 516 |
| `cylinder:setState(data)` | Restores the target position (finite number, clamped to 0..1) from data['<pump>_<cylinder>_target_position'] and switches to 'position' mode if the gap exceeds the dead zone, otherwise to 'direct' mode. | 568 |
| `cylinder:setValveType(valveType)` | Chooses the valve type: 'float', 'closed', 'tandem', 'drop' or 'bypass'. An invalid type logs an error and installs an empty update function. | 399 |
| `cylinder:update(inputPressure, dt)` | Called by the pump at each physics step (consumer:update). Computes the cylinder force from the input pressure and the active area, actuates each beam (obj:actuateBeam) with speed limit, slip force (relief pressure) and drag, updates extension, velocity and consumed flow. Its version depends on the valve: updateFloat, updateClosed, updateTandem, updateDrop, updateBypass or updateDummy. | 106 |
| `cylinder:updateBlendedStage(stage)` | For a transition stage: interpolates the areas between the two neighboring stages according to the extension (factor 0 to 1). | 28 |
| `cylinder:updateGFX(dt)` | Called every frame by the pump: reads the direction electrics value (or the PID position in position mode), computes valvePosition, valveSign, the active areas and the drag coefficient, then publishes the extension and the extension percentage in the requested electrics. | 456 |
| `cylinder:updateSounds(dt)` | Sets the volume of the movement sound loop according to the (smoothed) cylinder speed. | 478 |
| `cylinder:updateStageActiveArea(stage)` | Chooses the active area of the stage: extension area if valveSign >= 0, retraction area otherwise. | 452 |

## Calls into the engine (C++)

- `obj:` `actuateBeam`, `createSFXSource2`, `getBeamLength`, `getBeamRestLength`, `getBeamStress`, `playSFX`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/hydraulicCylinder.lua`.*
