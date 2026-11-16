# `gameplay_rally_fuelUtils`

*File: `lua/ge/extensions/gameplay/rally/fuelUtils.lua` · VM: Game Engine (GE) · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_fuelUtils`: `extensions.load("gameplay_rally_fuelUtils")`, then the global `gameplay_rally_fuelUtils`

Tools to save and restore a rally vehicle's fuel (for example after a reset or a repair). createFuelSnapshot analyzes the energyStorage data: with a single valid gasoline/diesel tank, it stores the current level ('remembered' mode); otherwise it plans a full tank ('full' mode) with the reason for the fallback. applyFuelSnapshot reapplies the snapshot via core_vehicleBridge.

## Example

```lua
gameplay_rally_fuelUtils.requestFuelSnapshot(veh, function(snap)
  -- later:
  gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snap, 'MyTag', 'reset')
end)
```

## Notes

- Only 'gasoline' and 'diesel' fuels are remembered; an electric battery, multiple tanks, or another storage type (other than n2oTank) force the 'full' mode.
- The energies are those of energyStorage (game unit, inferred from code).
- Snapshot: {mode='full'|'remembered', tanks={...}, reason=string|nil}. In 'full' mode, tanks contains {name, maxEnergy}; in 'remembered', {name, currentEnergy}.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snapshot, logTag, reason)` | Applies the snapshot: in 'remembered' mode puts currentEnergy back in each tank; otherwise fills each tank to maxEnergy (with a warning in the log if a reason is provided). Uses the vehicle action setEnergyStorageEnergy. Does nothing without a vehicle, without a snapshot or without a tank. | 112 |
| `gameplay_rally_fuelUtils.createFuelSnapshot(energyStorageData)` | Builds a fuel snapshot from a vehicle's energyStorage data. | 31 |
| `gameplay_rally_fuelUtils.requestFuelSnapshot(veh, callback)` | Asynchronously requests the 'energyStorage' value from the vehicle (core_vehicleBridge.requestValue) then calls callback with the snapshot. Without a vehicle, calls callback immediately with an empty 'full' snapshot. | 101 |

### Parameter details

#### `gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snapshot, logTag, reason)`

Applies the snapshot: in 'remembered' mode puts currentEnergy back in each tank; otherwise fills each tank to maxEnergy (with a warning in the log if a reason is provided). Uses the vehicle action setEnergyStorageEnergy. Does nothing without a vehicle, without a snapshot or without a tank.

- `veh` (*table*) : Vehicle object.
- `snapshot` (*table*) : Snapshot from createFuelSnapshot.
- `logTag` (*string|nil*) : Log tag.
- `reason` (*string|nil*) : Context for the log message ('recovery' by default).

#### `gameplay_rally_fuelUtils.createFuelSnapshot(energyStorageData)`

Builds a fuel snapshot from a vehicle's energyStorage data.

- `energyStorageData` (*table|nil*) : List of energy storages (storageType, energyType, name, currentEnergy, maxEnergy).
- **returns**: table {mode, tanks, reason}; reason explains why it falls back to a full tank.

#### `gameplay_rally_fuelUtils.requestFuelSnapshot(veh, callback)`

Asynchronously requests the 'energyStorage' value from the vehicle (core_vehicleBridge.requestValue) then calls callback with the snapshot. Without a vehicle, calls callback immediately with an empty 'full' snapshot.

- `veh` (*table|nil*) : Vehicle object.
- `callback` (*function*) : function(snapshot).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/fuelUtils.lua`.*
