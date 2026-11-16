# `gameplayInterfaceModules_interactController`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua` · VM: Vehicle · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactController`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactController")`, then the global `gameplayInterfaceModules_interactController`

gameplayInterface module for the controller system: send a gameplay event to the controllers, freeze the vehicle, change the gearbox mode, shift a gear and read the gearbox mode or the freeze state.

## Example

```lua
gameplayInterface.executeAction(0, 7, 'shiftToGearIndex', 1)
gameplayInterface.executeAction(0, 8, 'setGearboxMode', 'arcade')
```

## Notes

- Action 'controllerGameplayEvent'(eventName, ...): calls controller.onGameplayEvent(eventName, {other parameters}); no type check on the parameters.
- Action 'setFreeze'(freeze:boolean): controller.setFreeze(1) or (0).
- Action 'setGearboxMode'(mode:string): controller.mainController.setGearboxMode(mode) (e.g. 'arcade', 'realistic').
- Action 'shiftToGearIndex'(gearIndex:number): controller.mainController.shiftToGearIndex(gearIndex).
- Lookup 'mainController'(dataKey:string): 'gearboxMode' returns {result = mainController.gearboxBehavior}; 'freezeState' returns {result = electrics.values.freezeState}; any other key returns {failReason = 'Invalid data key'}.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactController.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 65 |
| `gameplayInterfaceModules_interactController.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 61 |

### Parameter details

#### `gameplayInterfaceModules_interactController.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: controllerGameplayEvent, setFreeze, setGearboxMode, shiftToGearIndex. |
| `moduleLookups` | table<string, function> | Lookups: mainController. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua`.*
