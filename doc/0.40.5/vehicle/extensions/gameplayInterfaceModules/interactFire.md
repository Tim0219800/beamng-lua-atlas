# `gameplayInterfaceModules_interactFire`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua` · VM: Vehicle · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactFire`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactFire")`, then the global `gameplayInterfaceModules_interactFire`

gameplayInterface module giving access to the fire system: remote call of an argument-less function of the fire module by name.

## Example

```lua
gameplayInterface.executeAction(0, 13, 'interactFire', 'igniteVehicle')
```

## Notes

- Action 'interactFire'(methodName:string): calls fire[methodName]() with no argument; {failReason} if the function does not exist. The exact names of valid methods depend on the fire module (see its page).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactFire.onExtensionLoaded()` | Called on load: fills moduleActions. *(internal)* *(hook)* | 26 |
| `gameplayInterfaceModules_interactFire.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 22 |

### Parameter details

#### `gameplayInterfaceModules_interactFire.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: interactFire. |
| `moduleLookups` | table<string, function> | Lookups: none. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua`.*
