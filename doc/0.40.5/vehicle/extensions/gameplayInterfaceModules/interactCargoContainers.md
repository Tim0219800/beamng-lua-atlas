# `gameplayInterfaceModules_interactCargoContainers`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua` · VM: Vehicle · 352 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactCargoContainers`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactCargoContainers")`, then the global `gameplayInterfaceModules_interactCargoContainers`

gameplayInterface module for cargo containers (jbeam section cargoStorage): lets the GE gameplay virtually fill the containers (target volume and density) and read their state. The filling is smoothed over time and translates into node mass changes and stiffness/damping/strength changes of the beams linked to the group via jbeam functions (nodeWeightFunction, beamSpringFunction...).

## Example

```lua
-- target: 0.5 volume for container 12
gameplayInterface.executeAction(0, 5, 'setCargoContainers', {[12] = {containerId = 12, volume = 0.5, density = 1}}, 'updateExplicit')
gameplayInterface.getSystemData(0, 6, 'getCargoContainers')
```

## Notes

- Action 'setCargoContainers'(data:table, mode:string): data is keyed by container id (cid), each entry must contain containerId and volume (density optional, default 1); otherwise {failReason}. mode (default 'updateExplicit'): 'updateExplicit' keeps the target of containers not mentioned; any other mode resets the unmentioned ones to volume 0/density 1; 'updateDelivery' ignores containers reserved for passengers (cargoTypes all 'passenger') and keeps their target.
- Lookup 'getCargoContainers'(): returns a list (in an enclosing table) of entries {id, cargoTypes, capacity, name, groupId, partPath, nodeId, reachTargetDuration, reachTargetTimeRemaining, targetVolume, currentVolume, rateVolume, targetDensity, currentDensity}.
- The container cache is built at the first call from v.data.cargoStorage, v.data.nodes and v.data.beams (via cargoGroup + partPath); it is destroyed at reset and at load.
- The smoothing uses newTemporalSmoothing: volume (speed maxVolumeRate of the container, default 1000) and density (speed 2). The jbeam functions are evaluated by jbeam/expressionParser with the variables $volume and $density (smoothed values), then applied via obj:setNodeMass, setBeamSpringDamp, setBeamStrength, setBeamDeform, setBoundedBeamShortBound/LongBound, setPrecompressionRatio.
- The update (updateGFX) is only active as long as a container has not reached its target: setUpdateEnabled enables/disables this extension's updateGFX hook.
- Anomaly: in buildContainerCache, hasValidFunction is initialized to true and never set to false: the filter has no effect, all nodes and beams of the group are registered.
- Anomaly: setUpdateEnabled(false) sets M.updateGFX to nil (not nop) before extensions.hookUpdate.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactCargoContainers.onExtensionLoaded()` | Called at load: disables the update, fills moduleActions/moduleLookups and clears the cache. *(internal)* *(hook)* | 332 |
| `gameplayInterfaceModules_interactCargoContainers.onReset()` | Called at vehicle reset: disables the update and clears the container cache. *(internal)* *(hook)* | 340 |
| `gameplayInterfaceModules_interactCargoContainers.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 328 |
| `gameplayInterfaceModules_interactCargoContainers.setUpdateEnabled(enabled)` | Enables or disables this extension's updateGFX loop (with extensions.hookUpdate('updateGFX')). *(internal)* | 238 |
| `gameplayInterfaceModules_interactCargoContainers.updateGFX(dtSim)` | Called every frame during filling: advances the smoothers of each container that has not reached its target and applies masses/beam properties; disables itself when everything is at target. Is nop otherwise. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `gameplayInterfaceModules_interactCargoContainers.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

#### `gameplayInterfaceModules_interactCargoContainers.setUpdateEnabled(enabled)`

Enables or disables this extension's updateGFX loop (with extensions.hookUpdate('updateGFX')).

- `enabled` (*boolean*) : true to start the container smoothing.

#### `gameplayInterfaceModules_interactCargoContainers.updateGFX(dtSim)`

Called every frame during filling: advances the smoothers of each container that has not reached its target and applies masses/beam properties; disables itself when everything is at target. Is nop otherwise. (dynamically assigned)

- `dtSim` (*number*) : Simulation time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Exposed actions: setCargoContainers. |
| `moduleLookups` | table<string, function> | Exposed lookups: getCargoContainers. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `updateGFX`

## Calls into the engine (C++)

- `obj:` `setBeamDeform`, `setBeamSpringDamp`, `setBeamStrength`, `setBoundedBeamLongBound`, `setBoundedBeamShortBound`, `setBoundedBeamSpringDampLimits`, `setNodeMass`, `setPrecompressionRatio`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua`.*
