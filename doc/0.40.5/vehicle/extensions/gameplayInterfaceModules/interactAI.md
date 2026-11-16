# `gameplayInterfaceModules_interactAI`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua` · VM: Vehicle · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactAI`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactAI")`, then the global `gameplayInterfaceModules_interactAI`

gameplayInterface module for AI: reads or sets the current vehicle's AI mode and can command the AI of all other vehicles by making them flee, follow, chase, move randomly or stop. Declares its actions and lookups to gameplayInterface at load (requestRegistration).

## Example

```lua
-- from the vehicle VM
gameplayInterface.executeAction(0, 1, 'setAIMode', 'span')
gameplayInterface.getSystemData(0, 2, 'aiMode')
```

## Notes

- Action 'setAIMode'(mode:string): calls ai.setMode(mode) of the current vehicle.
- Action 'setOtherVehiclesAIMode'(mode:string): mode among 'stop', 'random', 'flee', 'chase', 'follow'; any other mode writes a warning. For 'random', 'flee', 'chase', 'follow': all other vehicles (except this one) receive ai.setSpeedMode('off'), ai.driveInLane('off'), ai.setState({mode, targetObjectID = this vehicle}) and ai.setRacing(false). 'stop' sets ai.setMode('stop') on ALL vehicles (this one included), disables gameplay_traffic and ai.setRacing(false) on the others.
- Lookup 'aiMode'(): returns {aiMode = ai.mode}.
- Each request validates its parameters with checkTableDataTypes and returns {failReason = ...} if the type is incorrect.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactAI.onExtensionLoaded()` | Called when the extension loads: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 72 |
| `gameplayInterfaceModules_interactAI.requestRegistration(gi)` | Called by gameplayInterface at startup: registers the module's actions and lookups. *(internal)* | 68 |

### Parameter details

#### `gameplayInterfaceModules_interactAI.requestRegistration(gi)`

Called by gameplayInterface at startup: registers the module's actions and lookups.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Exposed actions: setAIMode, setOtherVehiclesAIMode (filled at onExtensionLoaded). |
| `moduleLookups` | table<string, function> | Exposed lookups: aiMode. |

## Calls into the engine (C++)

- `BeamEngine:` `queueAllObjectLua`, `queueAllObjectLuaExcept`
- `obj:` `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua`.*
