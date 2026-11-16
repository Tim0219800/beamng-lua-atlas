# `gameplayInterfaceModules_interactSpecialLights`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua` · VM: Vehicle · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactSpecialLights`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactSpecialLights")`, then the global `gameplayInterfaceModules_interactSpecialLights`

gameplayInterface module for special lights: reads and sets the taxi light state via the 'lights/taxiLights' controllers.

## Example

```lua
gameplayInterface.executeAction(0, 20, 'setTaxiLightState', 'on')
```

## Notes

- Action 'setTaxiLightState'(state:string): calls setTaxiState(state) on all controllers of type lights/taxiLights.
- Lookup 'taxiLightState'(): returns {result = getTaxiState()} of the first lights/taxiLights controller, or nil if there is none.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactSpecialLights.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 36 |
| `gameplayInterfaceModules_interactSpecialLights.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 32 |

### Parameter details

#### `gameplayInterfaceModules_interactSpecialLights.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: setTaxiLightState. |
| `moduleLookups` | table<string, function> | Lookups: taxiLightState. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua`.*
