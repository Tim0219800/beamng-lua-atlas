# `energyStorage_n2oTank`

*File: `lua/vehicle/energyStorage/n2oTank.lua` · VM: Vehicle · 148 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** energy storage type `n2oTank`, reachable with `energyStorage.getStorage("name")`

Energy storage type 'n2oTank': nitrous oxide (nitrous) bottle. Capacity is expressed in mass (kg), the stored energy being the mass multiplied by a fictitious energy density. Works like fuelTank (node mass adjusted, leak in 60 s if the trigger beam breaks). Instantiated by energyStorage.lua for `type = "n2oTank"`.

## Example

```lua
local n2o = energyStorage.getStorage("n2oTank")
n2o:setRemainingMass(5)  -- 5 kg remaining
```

## Notes

- jbeam fields read: name, type, capacity (kg, default 0), startingCapacity (kg, limited to capacity), energyDensity, breakTriggerBeam, nodes._engineGroup_nodes.
- Default energyDensity = 41.5e6 / 5 (fuel:N2O ratio of 1:5, so that both tanks lose the same energy). The code comment says MJ/kg but the value is in J/kg.
- energyType is set to 'n2o'. brokenLeakRate = capacity / 60 (kg/s).
- Uses the global `v` and the engine's `obj:setNodeMass`; the nodes receive initial mass + storedEnergy * nodeMassCoef.

## Functions

| Function | Description | Line |
|---|---|---|
| `energyStorage_n2oTank.new(jbeamData)` | Creates the N2O bottle instance from the jbeam entry. *(internal)* | 84 |

### Parameter details

#### `energyStorage_n2oTank.new(jbeamData)`

Creates the N2O bottle instance from the jbeam entry.

- `jbeamData` (*table*) : Merged jbeam data of the storage.
- **returns**: table Storage instance ('storage' class).

## Class `storage`

Instance returned by new(jbeamData). Notable fields: name, type, energyType ('n2o'), storedEnergy (J), energyCapacity (J), initialStoredEnergy, capacity (kg), startingCapacity (kg), remainingMass (kg), remainingRatio, currentLeakRate (kg/s), brokenLeakRate, energyDensity, assignedDevices.

Object `storage` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `storage:deserialize(data)` | Restores remainingMass if present. | 74 |
| `storage:getPartCondition()` | Returns the integrity (always 1) and {storedEnergy}. | 53 |
| `storage:onBreak()` | Called when a trigger beam breaks: enables the leak. | 31 |
| `storage:registerDevice(device)` | Registers a device in assignedDevices. | 35 |
| `storage:reset()` | Fills the bottle to the starting level, removes the leak and reapplies the mass to the nodes. | 62 |
| `storage:serialize()` | Returns {remainingMass}. | 80 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restores the state from the part condition (number = fraction, or table {storedEnergy}). | 39 |
| `storage:setRemainingMass(mass)` | Sets the remaining mass (clamped between 0 and capacity). | 23 |
| `storage:setRemainingRatio(ratio)` | Sets storedEnergy to energyCapacity * ratio (ratio clamped between 0 and 1). | 27 |
| `storage:updateGFX(dt)` | Called every frame: recomputes remainingMass/remainingRatio, applies the mass to the nodes and applies the leak if active. | 10 |

## Calls into the engine (C++)

- `obj:` `setNodeMass`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/energyStorage/n2oTank.lua`.*
