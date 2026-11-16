# `gameplayInterfaceModules_interactMisc`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua` · VM: Vehicle · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactMisc`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactMisc")`, then the global `gameplayInterfaceModules_interactMisc`

Catch-all gameplayInterface module: connection test (ping) and opening/closing of the latches of advanced coupler controllers (advancedCouplerControl).

## Example

```lua
gameplayInterface.getSystemData(0, 14, 'ping')   -- returns {ping = true}
gameplayInterface.executeAction(0, 15, 'latchesOpen')
```

## Notes

- Lookup 'ping'(): returns {ping = true}.
- Action 'latchesOpen'(): calls detachGroup() on each controller of type advancedCouplerControl.
- Action 'latchesClose'(): calls tryAttachGroupImpulse() on each controller of type advancedCouplerControl.
- latchesOpen/latchesClose do not check their parameters.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactMisc.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 34 |
| `gameplayInterfaceModules_interactMisc.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 30 |

### Parameter details

#### `gameplayInterfaceModules_interactMisc.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: latchesOpen, latchesClose. |
| `moduleLookups` | table<string, function> | Lookups: ping. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactMisc.lua`.*
