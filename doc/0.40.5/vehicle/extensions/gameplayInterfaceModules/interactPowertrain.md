# `gameplayInterfaceModules_interactPowertrain`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua` · VM: Vehicle · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactPowertrain`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactPowertrain")`, then the global `gameplayInterfaceModules_interactPowertrain`

gameplayInterface module for powertrain: reads a property of a powertrain device by its name.

## Example

```lua
gameplayInterface.getSystemData(0, 18, 'powertrainDevice', 'mainEngine', 'outputAV1')
```

## Notes

- Lookup 'powertrainDevice'(deviceName:string, property:string): returns {result = powertrain.getDevice(deviceName)[property]}.
- Anomaly: if the device does not exist, powertrain.getDevice returns nil and the indexing raises a Lua error (no {failReason}).
- This module exposes no action.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactPowertrain.onExtensionLoaded()` | Called on load: registers the lookup. *(internal)* *(hook)* | 26 |
| `gameplayInterfaceModules_interactPowertrain.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 22 |

### Parameter details

#### `gameplayInterfaceModules_interactPowertrain.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Empty. |
| `moduleLookups` | table<string, function> | Lookups: powertrainDevice. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua`.*
