# `gameplay_missions_vehicleFilterResolver`

*File: `lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua` · VM: Game Engine (GE) · 249 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_vehicleFilterResolver`: `extensions.load("gameplay_missions_vehicleFilterResolver")`, then the global `gameplay_missions_vehicleFilterResolver`

Transforms a mission vehicle filter configuration (filterData: whitelist/blacklist, probability settings, manual additions and removals, maxVehicles) into a flat list of model/configuration pairs. Relies on util/configListGenerator to get the eligible vehicles.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData)` | Indicates whether filterData contains a real constraint: non-empty whitelist or blacklist, probabilitySettings, manualAdditions, manualRemovals or maxVehicles > 0. | 172 |
| `gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData)` | Resolves filterData into a list {model, config, name}. Applies the base filter, the probabilitySettings (which replace the result if they find vehicles), the maxVehicles limit, the manual removals ('model/config' keys), then adds the manual additions not already present, without duplicates. allowAuxiliaryVehicles and allowLoadedTrailers control eligibility. | 189 |

### Parameter details

#### `gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData)`

Indicates whether filterData contains a real constraint: non-empty whitelist or blacklist, probabilitySettings, manualAdditions, manualRemovals or maxVehicles > 0.

- `filterData` (*table|any*) : Filter data; any non-table gives false.
- **returns**: boolean true if the filter constrains the vehicle set.

#### `gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData)`

Resolves filterData into a list {model, config, name}. Applies the base filter, the probabilitySettings (which replace the result if they find vehicles), the maxVehicles limit, the manual removals ('model/config' keys), then adds the manual additions not already present, without duplicates. allowAuxiliaryVehicles and allowLoadedTrailers control eligibility.

- `filterData` (*table|any*) : Fields read: allowAuxiliaryVehicles, allowLoadedTrailers, baseFilter, probabilitySettings, maxVehicles, manualRemovals, manualAdditions.
- **returns**: table[] List of {model = string, config = string, name = string} (empty if filterData is not a table).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua`.*
