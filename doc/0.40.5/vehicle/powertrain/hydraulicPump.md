# `powertrain_hydraulicPump`

*File: `lua/vehicle/powertrain/hydraulicPump.lua` · VM: Vehicle · 516 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `hydraulicPump` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `hydraulicPump`: hydraulic pump (variable or fixed displacement) driven by a shaft, with a built-in accumulator and a relief valve. It is a torque consumer without an output port (leaf of the powertrain tree). It also creates the hydraulic consumers (`hydraulicCylinder`) declared in `v.data.powertrainHydros` with `connectedPump` = name of the pump, and updates them. It can supply another vehicle through a coupler (hydraulic PTO) thanks to shared electrics values.

## Example

```lua
local pump = powertrain.getDevice("hydraulicPump")
pump:setConnected(true) -- engage the pump (power take-off)
print(pump.accumulatorPressure, pump.pumpFlowRate) -- Pa, m^3/s
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (1), friction, dynamicFriction, electricsName, visualShaftAVName, node, isConnected (if absent or false, the pump starts DISENGAGED: isConnectedCoef = 0), stallProtectionPumpRPM (500), showDebugGraph, showDebugGraphSound, pumpMaxDisplacement (m³/rev, 0.0002), pumpType ('variableDisplacement' by default or 'fixedDisplacement'), pumpRegulationRange (Pa, 10000000), pumpWorkingPressure (Pa, 25000000), accumulatorMaxVolume (m³, 0.001), initialAccumulatorPressure (Pa) or initialAccumulatorOilVolume (m³) (otherwise 90 % of the pressure and volume), reliefOpeningPressure (1.05 * working pressure), reliefPressureRange (2000000), reliefValveArea (m², 0.00001), unloadValveMaxFlow (m³/s, 0), hydraulicPTOPressureBaseSyncName ('hydraulicPTOPressure'), hydraulicPTOFlowBaseSyncName ('hydraulicPTOFlow'), hydraulicPTOMaxFlowRateBaseSyncName ('hydraulicPTOMaxFlowRate'), hydraulicPTOConsumerCouplerNodeNames (list of coupler node names), breakTriggerBeam, and for the sounds: pumpLoopEvent, pumpLoopNode, pumpSoundVolume (0.5), pumpSoundMaxFlowRate, pumpSoundMinRPM, pumpSoundMaxRPM, pumpSoundMinPitch, pumpSoundMaxPitch.
- Main fields: inputAV (rad/s, input speed = parent / gearRatio * isConnectedCoef), torqueDiff (N·m, resisting torque returned to the driver), currentDisplacement (m³/rev), pumpFlowRate (m³/s), accumulatorPressure (Pa), accumulatorOilVolume (m³, clamped to 2 * accumulatorMaxVolume), accumulatorMaxVolume, accumulatorOutFlow (m³/s going out to the consumers), reliefFlow, unloadFlow, pumpWorkingPressure, connectedConsumers (list of hydraulic consumers), isConnectedCoef, isBroken. outputTorque1/outputAV1 exist at 0.
- Accumulator pressure: accumulatorPressure = pumpWorkingPressure * accumulatorOilVolume / accumulatorMaxVolume (linear model). The variable displacement decreases linearly from 100 % to 10 % between (working pressure - regulation range) and the working pressure, and is progressively cut below 500 pump RPM (anti-stall protection).
- The pump publishes on electrics.values: <PressureBase>_<objectId> (pressure, Pa) and <MaxFlowRateBase>_<objectId> (max flow, m³/s); a consumer on another vehicle sends its flow via <FlowBase>_<objectId>_<objectId2>. The coupler must be one of the nodes listed in hydraulicPTOConsumerCouplerNodeNames.
- The consumers are built by factory.new(consumerJbeamData, device); only the 'hydraulicCylinder' type exists (hydraulicRotator is commented out). An unknown type or a duplicated consumer name writes an error in the log.
- Inconsistencies: applyDeformGroupDamage is empty; a broken pump (isBroken) switches to updateVelocityBroken, which empties the accumulator; hydraulicPTOPressureElectricsName, hydraulicPTOMaxFlowRateElectricsName and hydraulicPTOFlowElectricsName are read but never used (only the names with an object suffix are used). M.requiredExternalInertiaOutputs is not defined in this module.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_hydraulicPump.new(jbeamData)` | Builds the pump: displacement parameters, working pressure, accumulator, relief valve and PTO, then creates the hydraulic consumers declared for this pump in v.data.powertrainHydros. *(internal)* | 349 |

### Parameter details

#### `powertrain_hydraulicPump.new(jbeamData)`

Builds the pump: displacement parameters, working pressure, accumulator, relief valve and PTO, then creates the hydraulic consumers declared for this pump in v.data.powertrainHydros.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, clutch=true, hydraulicPowerSource=true, torqueConsumer=true}. |
| `outputPorts` | table | Empty table: no output port. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Does nothing (empty body). | 173 |
| `device:calculateInertia()` | Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio. | 206 |
| `device:getPartCondition()` | Returns 1 (0 if broken) and the table {isBroken}. | 188 |
| `device:getState()` | Returns the saveable state: oil volume of the accumulator (key '<name>_accumulatorOilVolume') merged with the states of the consumers. | 219 |
| `device:initSounds(jbeamData)` | Creates the pump sound loop (volume 0), computes maximum speed and flow for the sound from the driving engine, reads the sound settings from the jbeam and initializes the consumers' sounds. | 252 |
| `device:onBreak()` | Sets isBroken = true and switches to the "broken" version of velocityUpdate (the accumulator empties). | 201 |
| `device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Coupler hook: when a PTO coupler of this pump attaches to another vehicle, creates the flow electrics value for that vehicle and sends it its name via beamstate.sendExportCouplerData. | 134 |
| `device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Coupler hook: when the PTO coupler of this pump detaches, removes the flow electrics value of the other vehicle. | 148 |
| `device:reset(jbeamData)` | Resets speeds, flows, accumulator (initial pressure and volume), state, PTO electrics values, then reinitializes each consumer. | 301 |
| `device:resetSounds(jbeamData)` | Calls resetSounds of each consumer; does not touch the sound of the pump itself. | 293 |
| `device:setConnected(isConnected)` | Engages (true) or disengages (false) the pump from its driver: isConnectedCoef = 1 or 0. Can be called by a PTO controller. | 159 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies isBroken from the integrity (number: not broken; table: isBroken field) by calling onBreak if needed. | 176 |
| `device:setState(data)` | Restores the oil volume of the accumulator (finite number, clamped to 2 * accumulatorMaxVolume) and the corresponding pressure, then passes the state on to the consumers. | 233 |
| `device:torqueUpdate(dt)` | Called at each physics step: computes the accumulator pressure, the resisting torque torqueDiff = pressure * displacement / (2π) / gearRatio, queries each consumer (consumer:update) to get its flows, then computes the relief flow (unloader and progressive relief valve). | 51 |
| `device:updateGFX(dt)` | Per-frame update: updates the consumers (updateGFX), publishes the pressure and max flow on electrics, subtracts the flow requested by the remote consumers (PTO) from the accumulator and displays a debug graph if showDebugGraph. | 74 |
| `device:updateSounds(dt)` | Sets the volume, pitch (according to the pump speed) and color (according to the hydraulic power) of the pump sound and calls updateSounds of the consumers. | 96 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 197 |
| `device:velocityUpdate(dt)` | Called at each physics step: computes the current displacement (variable or fixed), inputAV = parent speed / gearRatio * isConnectedCoef, the pump flow and updates the accumulator oil volume (incoming flow minus outputs, relief, unloader). Broken version: everything at 0 and draining. | 44 |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `playSFX`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/hydraulicPump.lua`.*
