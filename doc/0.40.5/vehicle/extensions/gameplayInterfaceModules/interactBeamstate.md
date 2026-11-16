# `gameplayInterfaceModules_interactBeamstate`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua` · VM: Vehicle · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactBeamstate`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactBeamstate")`, then the global `gameplayInterfaceModules_interactBeamstate`

gameplayInterface module giving access to beamstate: remote call of a beamstate function without arguments by its name, and reading of a coupler's offset. The actions and lookups are registered with gameplayInterface.

## Example

```lua
gameplayInterface.executeAction(0, 3, 'interactBeamstate', 'breakAllBreakgroups')
```

## Notes

- Action 'interactBeamstate'(methodName:string): calls beamstate[methodName]() without arguments; returns {failReason} if the function does not exist. Any non-nil beamstate key is called as is (a non-function value would cause a Lua error).
- Lookup 'couplerOffset'(couplerTag:string): returns {result = beamstate.getCouplerOffset(couplerTag)}.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactBeamstate.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 36 |
| `gameplayInterfaceModules_interactBeamstate.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 32 |

### Parameter details

#### `gameplayInterfaceModules_interactBeamstate.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Exposed actions: interactBeamstate. |
| `moduleLookups` | table<string, function> | Exposed lookups: couplerOffset. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua`.*
