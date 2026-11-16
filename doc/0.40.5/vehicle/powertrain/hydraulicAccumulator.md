# `powertrain_hydraulicAccumulator`

*File: `lua/vehicle/powertrain/hydraulicAccumulator.lua` · VM: Vehicle · 472 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `hydraulicAccumulator` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `hydraulicAccumulator`: standalone hydraulic accumulator (pressurized tank, without pump or mechanical drive). It supplies hydraulic consumers (`hydraulicCylinder`, declared in `v.data.powertrainHydros` with `connectedPump` = name of the accumulator) and can be filled remotely from the pump of another coupled vehicle (trailer, tool) via shared electrics values (hydraulic PTO). Category `hydraulicPowerSource`, without an output port or torque.

## Example

```lua
local acc = powertrain.getDevice("trailerAccumulator")
print(acc.accumulatorPressure, acc.accumulatorInFlow, acc.accumulatorOutFlow) -- Pa, m^3/s, m^3/s
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio, friction, dynamicFriction, electricsName, visualShaftAVName, node, showDebugGraph, accumulatorWorkingPressure (Pa, 25000000), accumulatorMaxVolume (m³, 0.001), initialAccumulatorPressure (Pa) or initialAccumulatorOilVolume (m³) (otherwise full at working pressure), reliefOpeningPressure (1.05 * working pressure), reliefPressureRange (2000000), reliefValveArea (m², 0.0001), hydraulicPTOPressureElectricsName / hydraulicPTOMaxFlowRateElectricsName / hydraulicPTOFlowElectricsName (read but barely used), hydraulicPTOPressureBaseSyncName ('hydraulicPTOPressure'), hydraulicPTOFlowBaseSyncName ('hydraulicPTOFlow'), hydraulicPTOMaxFlowRateBaseSyncName ('hydraulicPTOMaxFlowRate'), hydraulicPTOSupplyCouplerNodeNames (nodes through which the accumulator connects to its supply), hydraulicPTOConsumerCouplerNodeNames (nodes through which another vehicle connects to it), consumerPressureDiffFlowRateCoef (0.001), breakTriggerBeam.
- Main fields: accumulatorPressure (Pa) = accumulatorWorkingPressure / accumulatorMaxVolume * accumulatorOilVolume; accumulatorOilVolume (m³, clamped to 0..2*accumulatorMaxVolume); accumulatorMaxVolume; accumulatorOutFlow (m³/s, consumers + discharge); accumulatorInFlow (m³/s, flow received from the remote supply); reliefFlow (m³/s); connectedConsumers; isBroken. outputTorque1/outputAV1 are 0.
- Remote supply: the accumulator reads electrics.values[<PressureBase>_<supplyId>] and [<MaxFlowRateBase>_<supplyId>] and writes its flow into [<FlowBase>_<supplyId>_<myId>]. The incoming flow is min((P_supply - P_local) * consumerPressureDiffFlowRateCoef, 1.1 * max supply flow), never negative (no backflow).
- It also behaves as a supply for other vehicles: it publishes its pressure in electrics '<PressureBase>_<myId>' and receives the flows requested by the remote consumers (subtracted from its volume).
- A broken accumulator (onBreak) is emptied (pressure and volume at 0) and stops receiving supply.
- Bugs: updateGFX writes device.pumpFlowRate (never defined on this device, so nil) into the published max flow electrics ('hydraulicPTOMaxFlowRate_<id>'); downstream vehicles reading this value therefore get 0 because of their "or 0". The device.inputAV field never changes (0). applyDeformGroupDamage is empty. M.requiredExternalInertiaOutputs is not defined in this module. Only one consumer per supply is supported (TODO comment in the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_hydraulicAccumulator.new(jbeamData)` | Builds the accumulator: working pressure, volume, initial state, relief valve, PTO electrics names, supply and consumer coupler nodes, then creates the hydraulic consumers declared for it in v.data.powertrainHydros. *(internal)* | 303 |

### Parameter details

#### `powertrain_hydraulicAccumulator.new(jbeamData)`

Builds the accumulator: working pressure, volume, initial state, relief valve, PTO electrics names, supply and consumer coupler nodes, then creates the hydraulic consumers declared for it in v.data.powertrainHydros.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {hydraulicPowerSource=true}. |
| `outputPorts` | table | Empty table: no output port. |

## Class `device`

Object returned by new(jbeamData). velocityUpdate is nop.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Does nothing (empty body). | 155 |
| `device:calculateInertia()` | Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio. | 198 |
| `device:getPartCondition()` | Returns 1 (0 if broken) and the table {isBroken}. | 170 |
| `device:getState()` | Returns the saveable state: oil volume (key '<name>_accumulatorOilVolume') merged with the state of the consumers. | 211 |
| `device:initSounds(jbeamData)` | Initializes the sounds of each consumer; the accumulator has no sound of its own. | 243 |
| `device:onBreak()` | Sets isBroken = true and empties the accumulator: pressure, volume, flows and PTO electrics reset to 0. | 183 |
| `device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Coupler hook. Consumer side: when the supply coupler is attached, creates the electrics names shared with the supplying vehicle and sends it the names to export. Supply side: when a vehicle connects to a consumer coupler, creates the flow electrics value for it and exports it to it. | 87 |
| `device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Coupler hook. Consumer side: removes the electrics values of the supply. Supply side: removes the flow value of the departed consumer. | 119 |
| `device:reset(jbeamData)` | Resets the state (initial pressure and volume, flows, PTO electrics, supply names), then reinitializes the consumers. | 259 |
| `device:resetSounds(jbeamData)` | Calls resetSounds of each consumer. | 251 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies isBroken from the integrity (number: not broken; table: isBroken field) by calling onBreak if needed. | 158 |
| `device:setState(data)` | Restores the oil volume (finite number, clamped, ignored if the accumulator is broken) and the pressure, then passes the state on to the consumers. | 225 |
| `device:torqueUpdate(dt)` | Called at each physics step: computes the pressure, queries each consumer (consumer:update) to get its flows, computes the relief valve flow, sets outputTorque1 to 0 and subtracts the outgoing flows from the oil volume. | 17 |
| `device:updateGFX(dt)` | Per-frame update: updates the consumers, receives the flow from the remote supply (consumer side), publishes the pressure in the electrics (supply side) and subtracts the flows requested by the remote consumers. | 42 |
| `device:updateSounds(dt)` | Calls updateSounds of each consumer (the accumulator has no sound of its own). | 81 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 179 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/hydraulicAccumulator.lua`.*
