# `gameplayInterfaceModules_interactRecovery`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua` · VM: Vehicle · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactRecovery`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactRecovery")`, then the global `gameplayInterfaceModules_interactRecovery`

gameplayInterface module giving access to the recovery system: remote call of an argument-less function of the recovery module by name.

## Example

```lua
gameplayInterface.executeAction(0, 19, 'interactRecovery', 'startRecovering')
```

## Notes

- Action 'interactRecovery'(methodName:string): calls recovery[methodName]() with no argument; {failReason} if the function does not exist. Valid names depend on the recovery module.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactRecovery.onExtensionLoaded()` | Called on load: fills moduleActions. *(internal)* *(hook)* | 26 |
| `gameplayInterfaceModules_interactRecovery.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 22 |

### Parameter details

#### `gameplayInterfaceModules_interactRecovery.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: interactRecovery. |
| `moduleLookups` | table<string, function> | Lookups: none. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua`.*
