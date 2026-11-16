# `energyStorage_pressureTank`

*File: `lua/vehicle/energyStorage/pressureTank.lua` · VM: Vehicle · 399 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** energy storage type `pressureTank`, reachable with `energyStorage.getStorage("name")`

Energy storage type 'pressureTank': pressurized gas tank (compressed air for trucks, trailers, air suspensions). Energy equals P·V (ideal gas law, takes into account the powertrain's ambient pressure and temperature), the tank can leak (beam break or deformation) and can feed or be fed by another vehicle via a coupler (pneumatic PTO, synchronization through electrics). Instantiated by energyStorage.lua for `type = "pressureTank"`.

## Example

```lua
local tank = energyStorage.getStorage("airTank")
local relativePressurePa = electrics.values[tank.pressureElectricName]  -- "airTank_pressureRelative"
tank:toggleConsumerPressureCoef()  -- cuts/restores the trailer supply
```

## Notes

- jbeam fields read: name, type, energyType (default 'air'), gasMolarMass (g/mol, default 28.9647), capacity (volume in m³), maxPressure (Pa, default 1,000,000), startingPressure (relative Pa, adds the ambient pressure), isPrimarySupply, breakTriggerBeam, tankDamageDeformGroup, showDebugGraph, nodes._engineGroup_nodes, pneumaticPTOPressureBaseSyncName, pneumaticPTOFlowBaseSyncName, pneumaticPTOSupplyCouplerNodeNames, pneumaticPTOConsumerCouplerNodeNames, consumerPressureDiffFlowRateCoef (default 1e-6).
- Published electrics: <name>_pressureRelative (pressure - ambient pressure, Pa), <name>_pressureConsumer (pressure sent to consumers), <name>_pressureConsumerCoef, and the synchronization keys <base>_<objectId> (pneumaticPTOPressure_<id>, pneumaticPTOFlow_<id>).
- Roles: a tank with isPrimarySupply is a source (supplyPressure = own pressure). When coupled on a node of pneumaticPTOSupplyCouplerNodeNames it becomes a consumer of another vehicle, on a node of pneumaticPTOConsumerCouplerNodeNames it becomes a supplier. Only one consumer per supplier is supported (TODO in the code).
- Units: storedEnergy and energyCapacity in J (= Pa·m³), capacity in m³, pressure in Pa, remainingMass in kg, maxLeakRate = capacity / 3 (m³/s, the code comment says 5 seconds).
- Leaks are reported in damageTracker: group 'pressureTank', names 'breakLeak' and 'deformationLeak'.
- Anomaly: setConsumerPressureCoef uses `coef > 0` (unclamped value) for the activation message while the stored value is clamped between 0 and 1.
- Anomaly: onCouplerAttached declares the last parameter `attachForce`, but energyStorage.lua passes it attachEnergy.

## Functions

| Function | Description | Line |
|---|---|---|
| `energyStorage_pressureTank.new(jbeamData)` | Creates the pressure tank instance, computes energy, mass and electrics names, and initializes the electrics values and damages. *(internal)* | 268 |

### Parameter details

#### `energyStorage_pressureTank.new(jbeamData)`

Creates the pressure tank instance, computes energy, mass and electrics names, and initializes the electrics values and damages.

- `jbeamData` (*table*) : Merged jbeam data of the storage.
- **returns**: table Storage instance ('storage' class).

## Class `storage`

Instance returned by new(jbeamData). Notable fields: name, type, energyType, capacity (m³), storedEnergy (J), energyCapacity (J), initialStoredEnergy, remainingMass (kg), remainingRatio, currentPressure (absolute Pa), supplyPressure, maxWorkingPressure, currentLeakRate, maxLeakRate, consumerPressureCoef (0 to 1), pressureElectricName, pressureConsumerElectricName, pressureConsumerCoefElectricName.

Object `storage` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `storage:deserialize(data)` | Restores remainingMass if present. | 258 |
| `storage:getPartCondition()` | Returns the integrity (always 1) and {storedEnergy}. | 215 |
| `storage:getRemainingMass()` | Returns the remaining gas mass. | 166 |
| `storage:onBreak()` | Called when a trigger beam breaks: maximum leak and 'breakLeak' damage. | 194 |
| `storage:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Coupling hook: if the node is a supply node, creates the synchronization electrics names with the supplier vehicle and requests the pressure export; if it is a consumer node, initializes pressure and flow and requests the flow export. | 116 |
| `storage:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Detach hook: removes the synchronization electrics on the consumer side (supplyPressure reset to 0) or the flow on the supplier side. | 142 |
| `storage:registerDevice(device)` | Registers a device in assignedDevices. | 199 |
| `storage:reset()` | Resets the tank to its starting pressure, removes leaks and synchronizations, reinitializes the electrics and damages. | 224 |
| `storage:serialize()` | Returns {remainingMass}. | 264 |
| `storage:setConsumerPressureCoef(coef)` | Sets the pressure coefficient sent to consumers (clamped 0 to 1) and displays a UI message (trailerAir enabled/disabled). | 185 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restores storedEnergy from the part condition (number = fraction of energyCapacity, or table {storedEnergy}). | 203 |
| `storage:setRemainingMass(mass)` | Sets the gas mass (converted to moles then to energy). | 170 |
| `storage:setRemainingRatio(ratio)` | Sets the fill ratio relative to the maximum pressure. | 179 |
| `storage:toggleConsumerPressureCoef()` | Toggles consumerPressureCoef between 0 and 1. | 190 |
| `storage:updateEnergy(molarQuantity)` | Recomputes storedEnergy, remainingMass and remainingRatio at the current ambient temperature. Without an argument, deduces the gas quantity from the current energy and the old temperature. | 101 |
| `storage:updateGFX(dt)` | Called every frame: computes the pressure, synchronizes with suppliers/consumers, applies the leak (break or deformation), updates energy and node mass and publishes the relative pressure in electrics. | 58 |
| `storage:updateTankSync(dt)` | Consumer side: balances the energy with the supplier's supply pressure and publishes the flow; supplier side: publishes the pressure sent to the consumer and removes the energy corresponding to the received flow. | 16 |

## Calls into the engine (C++)

- `obj:` `setNodeMass`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/energyStorage/pressureTank.lua`.*
