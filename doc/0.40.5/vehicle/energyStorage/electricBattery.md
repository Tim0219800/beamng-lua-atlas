# `energyStorage_electricBattery`

*File: `lua/vehicle/energyStorage/electricBattery.lua` · VM: Vehicle · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** energy storage type `electricBattery`, reachable with `energyStorage.getStorage("name")`

Energy storage type 'electricBattery': electric vehicle battery. Energy is kept in joules (energyType 'electricEnergy') and configured in kWh in the jbeam. Instantiated by energyStorage.lua from a jbeam entry with `type = "electricBattery"`; electric motors consume it through the powertrain devices.

## Example

```lua
-- jbeam
-- "energyStorage": [["name","type","batteryCapacity","startingCapacity"],["mainBattery","electricBattery",60,60]]
```

## Notes

- jbeam fields read: name, type, batteryCapacity (kWh, default 0), startingCapacity (kWh, default = batteryCapacity).
- Conversion: 1 kWh = 3,600,000 J. storedEnergy, energyCapacity, initialStoredEnergy are in joules.
- Naming anomaly: remainingVolume contains storedEnergy / 3600000, i.e. the energy in kWh, not a volume.
- updateGFX rewrites storedEnergy through setStoredEnergy every frame to recompute remainingVolume and remainingRatio; no limit (clamp) is applied to storedEnergy at this point.
- setRemainingRatio only updates storedEnergy (the rest is recomputed on the next frame).
- No leak, no onBreak, no serialize/deserialize for this type.

## Functions

| Function | Description | Line |
|---|---|---|
| `energyStorage_electricBattery.new(jbeamData)` | Creates an electric battery type storage from the jbeam entry. The returned storage is a table with name, type, energyType, assignedDevices, capacity (kWh), startingCapacity (kWh), energyCapacity (J), initialStoredEnergy (J), storedEnergy, remainingRatio, remainingVolume, jbeamData and the methods listed in the 'storage' class. *(internal)* | 52 |

### Parameter details

#### `energyStorage_electricBattery.new(jbeamData)`

Creates an electric battery type storage from the jbeam entry. The returned storage is a table with name, type, energyType, assignedDevices, capacity (kWh), startingCapacity (kWh), energyCapacity (J), initialStoredEnergy (J), storedEnergy, remainingRatio, remainingVolume, jbeamData and the methods listed in the 'storage' class.

- `jbeamData` (*table*) : Merged jbeam data of the storage.
- **returns**: table Storage instance ('storage' class).

## Class `storage`

Instance returned by new(jbeamData). Methods are called with the `storage:method(...)` syntax.

Object `storage` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `storage:getPartCondition()` | Returns the integrity (always 1) and the state {storedEnergy}. | 39 |
| `storage:registerDevice(device)` | Registers a powertrain device in assignedDevices (by its name). | 23 |
| `storage:reset()` | Restores the starting charge (startingCapacity in kWh converted to J). | 48 |
| `storage:setPartCondition(odometer, integrity, visual)` | Restores the state from the part condition: a number is interpreted as a fraction of energyCapacity, a table must contain storedEnergy. | 27 |
| `storage:setRemainingRatio(ratio)` | Sets the energy to energyCapacity * ratio (ratio clamped between 0 and 1). | 15 |
| `storage:setStoredEnergy(energy)` | Sets the stored energy and recomputes remainingVolume (kWh) and remainingRatio. | 9 |
| `storage:updateGFX(dt)` | Called every frame by energyStorage.updateGFX: recomputes the derived values. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/energyStorage/electricBattery.lua`.*
