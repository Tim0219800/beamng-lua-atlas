# `energyStorage_fuelTank`

*File: `lua/vehicle/energyStorage/fuelTank.lua` · VM: Vehicle · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** energy storage type `fuelTank`, reachable with `energyStorage.getStorage("name")`

Energy storage type 'fuelTank': liquid fuel tank (gasoline, diesel, kerosene). Energy is stored in joules from the volume in liters, the density and the energy density; the mass of the engine group nodes is adjusted according to the level, and a leak can empty the tank in 60 s if it is punctured. Instantiated by energyStorage.lua for `type = "fuelTank"`.

## Example

```lua
local tank = energyStorage.getStorage("mainTank")
tank:setRemainingVolume(20)   -- 20 liters remaining
print(tank.remainingVolume, tank.remainingRatio)
```

## Notes

- jbeam fields read: name, type, energyType ('gasoline' default, 'diesel', 'kerosene'), fuelCapacity (L), startingFuelCapacity (L, limited to fuelCapacity), energyDensity (J/kg), fuelLiquidDensity (kg/L), breakTriggerBeam, fuel._engineGroup_nodes (nodes whose mass varies with the fuel).
- Default values: gasoline 41.5 MJ/kg and 0.75 kg/L; diesel 43 MJ/kg and 0.84 kg/L; kerosene 43 MJ/kg and 0.80 kg/L. An unknown energyType without energyDensity/fuelLiquidDensity in the jbeam gives 0 and will cause divisions by zero in updateGFX.
- Units: storedEnergy and energyCapacity in J, remainingVolume in L, brokenLeakRate = capacity / 60 (L/s, drained in 60 s).
- The fuelNodes nodes receive every frame the mass = initial mass + storedEnergy * fuelNodeMassCoef (1 / (energyDensity * number of nodes), so fuel mass is distributed).
- The leak after a break is not saved: getPartCondition always returns currentLeakRate = 0 in the state but integrityValue = 0 if the tank leaks.
- Uses the global `v` (vehicle data) and the engine's `obj:setNodeMass`.

## Functions

| Function | Description | Line |
|---|---|---|
| `energyStorage_fuelTank.new(jbeamData)` | Creates the tank instance from the jbeam entry and immediately applies the fuel mass to the relevant nodes. *(internal)* | 87 |

### Parameter details

#### `energyStorage_fuelTank.new(jbeamData)`

Creates the tank instance from the jbeam entry and immediately applies the fuel mass to the relevant nodes.

- `jbeamData` (*table*) : Merged jbeam data of the storage.
- **returns**: table Storage instance ('storage' class).

## Class `storage`

Instance returned by new(jbeamData). Notable public fields: name, type, energyType, storedEnergy (J), energyCapacity (J), initialStoredEnergy (J), capacity (L), startingCapacity (L), remainingVolume (L), remainingRatio (0 to 1), currentLeakRate (L/s), brokenLeakRate, energyDensity, fuelLiquidDensity, assignedDevices.

Object `storage` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `storage:deserialize(data)` | Restores remainingVolume from serialized data (if present). | 77 |
| `storage:getPartCondition()` | Returns the integrity (0 if leaking, 1 otherwise) and the state {storedEnergy, currentLeakRate = 0}. | 55 |
| `storage:onBreak()` | Called when a breakTriggerBeam beam breaks: enables the leak (currentLeakRate = brokenLeakRate). | 31 |
| `storage:registerDevice(device)` | Registers a device in assignedDevices. | 35 |
| `storage:reset()` | Fills the tank to the starting level, removes the leak and reapplies the mass to the nodes. | 65 |
| `storage:serialize()` | Returns {remainingVolume} for saving. | 83 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restores the state from the part condition (number = fraction of the tank, with a leak if 0; or table {storedEnergy, currentLeakRate}). | 39 |
| `storage:setRemainingRatio(ratio)` | Sets storedEnergy to energyCapacity * ratio (ratio clamped between 0 and 1). | 27 |
| `storage:setRemainingVolume(volume)` | Sets the remaining volume (clamped between 0 and capacity) and updates storedEnergy. | 23 |
| `storage:updateGFX(dt)` | Called every frame: recomputes remainingVolume/remainingRatio, applies the mass to the nodes and removes fuel if currentLeakRate > 0. | 10 |

## Calls into the engine (C++)

- `obj:` `setNodeMass`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/energyStorage/fuelTank.lua`.*
