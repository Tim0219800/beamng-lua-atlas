# `gameplayInterfaceModules_interactElectrics`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua` · VM: Vehicle · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactElectrics`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactElectrics")`, then the global `gameplayInterfaceModules_interactElectrics`

gameplayInterface module for electrics: set the ignition level, the light bar mode and the headlight state, and read any value of electrics.values.

## Example

```lua
gameplayInterface.executeAction(0, 9, 'setIgnitionLevel', 2)
gameplayInterface.getSystemData(0, 10, 'electricsValue', 'rpm')
```

## Notes

- Action 'setIgnitionLevel'(level:number): electrics.setIgnitionLevel(level) (0 to 3).
- Action 'setLightbarMode'(mode:number): electrics.set_lightbar_signal(mode).
- Action 'setLightMode'(mode:number): electrics.setLightsState(mode) (0 off, 1 low beam, 2 high beam).
- Lookup 'electricsValue'(key:string): returns {result = electrics.values[key]} (nil if the key does not exist).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactElectrics.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 51 |
| `gameplayInterfaceModules_interactElectrics.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 47 |

### Parameter details

#### `gameplayInterfaceModules_interactElectrics.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: setIgnitionLevel, setLightbarMode, setLightMode. |
| `moduleLookups` | table<string, function> | Lookups: electricsValue. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua`.*
