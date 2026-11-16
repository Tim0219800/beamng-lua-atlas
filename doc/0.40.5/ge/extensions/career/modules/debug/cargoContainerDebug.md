# `career_modules_debug_cargoContainerDebug`

*File: `lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua` · VM: Game Engine (GE) · 373 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_cargoContainerDebug`: `extensions.load("career_modules_debug_cargoContainerDebug")`, then the global `career_modules_debug_cargoContainerDebug`

"Vehicle > Cargo Containers" debug tool. Queries all active vehicles (core_vehicleBridge.requestValue 'getCargoContainers'), shows their cargo containers (volume, density, capacity, node cluster) and lets you send volume/density to them or fill them at an adjustable flow rate. Can be opened outside career.

## Example

```lua
extensions.load("career/modules/debug/cargoContainerDebug")
career_modules_debug_cargoContainerDebug.show()
```

## Notes

- Fill rate: volume += flowRate * maxRate * dt (liters), clamped to [0, capacity].
- drawFlowRate can push/pop the 'Refueling' actionMap.
- Probable typo: container.currenDensity (instead of currentDensity) is read to initialize the density, which is therefore always 1 by default.
- onInstabilityDetected is the same handler as onVehicleDestroyed.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_cargoContainerDebug.drawDebugMenu(dt)` | Draws the 'Cargo Container Debug' window: refresh button, flow rate, and for each vehicle updateVehicle then drawVehicle (removes those that no longer exist). *(internal)* | 320 |
| `career_modules_debug_cargoContainerDebug.drawFlowRate(dt)` | Draws the Flow Rate (0..1) and Max Fill Rate (L/s) sliders, the 'Refueling' actionMap checkbox, and applies filling to the marked containers. *(internal)* | 279 |
| `career_modules_debug_cargoContainerDebug.drawVehicle(data)` | Draws in ImGui the table of a vehicle and its containers with volume/density input fields and a checkbox to fill at the flow rate. *(internal)* | 101 |
| `career_modules_debug_cargoContainerDebug.getData()` | Asks each active vehicle for its list of containers and fills M.vehCargoData when all have replied (asynchronous). Returns an empty table if core_vehicleBridge is missing. | 19 |
| `career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor)` | Hook (e.g. input action) that sets the flow rate, clamped to [0, 1]. *(hook)* | 315 |
| `career_modules_debug_cargoContainerDebug.onInstabilityDetected(id)` | Hook: same handling as onVehicleDestroyed. *(internal)* *(hook)* | 364 |
| `career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id)` | Hook: removes the data of the destroyed vehicle. *(internal)* *(hook)* | 364 |
| `career_modules_debug_cargoContainerDebug.onVehicleResetted(id)` | Hook: removes the data of the reset vehicle and forces a new getData. *(internal)* *(hook)* | 357 |
| `career_modules_debug_cargoContainerDebug.show()` | Opens the tool outside career: hooks drawDebugMenu onto onUpdate (hookUpdate) and calls getData. | 351 |
| `career_modules_debug_cargoContainerDebug.updateVehicle(data)` | Refreshes a vehicle's data: node cluster (if the generation changed), position of the vehicle and of each container. Returns false if the vehicle no longer exists. | 75 |

### Parameter details

#### `career_modules_debug_cargoContainerDebug.drawDebugMenu(dt)`

Draws the 'Cargo Container Debug' window: refresh button, flow rate, and for each vehicle updateVehicle then drawVehicle (removes those that no longer exist).

- `dt` (*number*) : Time delta.

#### `career_modules_debug_cargoContainerDebug.drawFlowRate(dt)`

Draws the Flow Rate (0..1) and Max Fill Rate (L/s) sliders, the 'Refueling' actionMap checkbox, and applies filling to the marked containers.

- `dt` (*number*) : Time delta in seconds.

#### `career_modules_debug_cargoContainerDebug.drawVehicle(data)`

Draws in ImGui the table of a vehicle and its containers with volume/density input fields and a checkbox to fill at the flow rate.

- `data` (*table*) : Entry of vehCargoData.

#### `career_modules_debug_cargoContainerDebug.getData()`

Asks each active vehicle for its list of containers and fills M.vehCargoData when all have replied (asynchronous). Returns an empty table if core_vehicleBridge is missing.

- **returns**: table|nil {} if core_vehicleBridge is missing, otherwise nothing.

#### `career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor)`

Hook (e.g. input action) that sets the flow rate, clamped to [0, 1].

- `factor` (*number*) : New flow factor.

#### `career_modules_debug_cargoContainerDebug.onInstabilityDetected(id)`

Hook: same handling as onVehicleDestroyed.

- `id` (*integer*) : Vehicle id.

#### `career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id)`

Hook: removes the data of the destroyed vehicle.

- `id` (*integer*) : Vehicle id.

#### `career_modules_debug_cargoContainerDebug.onVehicleResetted(id)`

Hook: removes the data of the reset vehicle and forces a new getData.

- `id` (*integer*) : Vehicle id.

#### `career_modules_debug_cargoContainerDebug.updateVehicle(data)`

Refreshes a vehicle's data: node cluster (if the generation changed), position of the vehicle and of each container. Returns false if the vehicle no longer exists.

- `data` (*table*) : Entry of vehCargoData.
- **returns**: boolean false if the vehicle cannot be found.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicle > Cargo Containers'. |
| `debugOrder` | number | Sort order in the debug window (11). |
| `vehCargoData` | table[] | List of vehicles with their containers, sorted by vehId: {vehId, name, containers, vehPos, clusterGeneration…}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua`.*
