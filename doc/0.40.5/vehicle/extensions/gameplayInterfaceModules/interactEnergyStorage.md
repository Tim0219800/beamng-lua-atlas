# `gameplayInterfaceModules_interactEnergyStorage`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua` · VM: Vehicle · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactEnergyStorage`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactEnergyStorage")`, then the global `gameplayInterfaceModules_interactEnergyStorage`

gameplayInterface module for energyStorage: sets the stored energy of a tank and lists all storages with their current and maximum energy.

## Example

```lua
gameplayInterface.executeAction(0, 11, 'setEnergyStorageEnergy', 'mainTank', 1.0e8)
gameplayInterface.getSystemData(0, 12, 'energyStorage')
```

## Notes

- Action 'setEnergyStorageEnergy'(name:string, energy:number): writes storage.storedEnergy directly (in joules); {failReason} if the storage is not found. No clamp to energyCapacity.
- Lookup 'energyStorage'(): returns a table containing a list {name, storageType, energyType, currentEnergy, maxEnergy} (currentEnergy = storedEnergy, maxEnergy = energyCapacity). The list is wrapped in a table (the result is {list}).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactEnergyStorage.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 44 |
| `gameplayInterfaceModules_interactEnergyStorage.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 40 |

### Parameter details

#### `gameplayInterfaceModules_interactEnergyStorage.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: setEnergyStorageEnergy. |
| `moduleLookups` | table<string, function> | Lookups: energyStorage. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua`.*
