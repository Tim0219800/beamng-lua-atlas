# `vehicles_saveConfigUtils`

*File: `lua/ge/extensions/vehicles/saveConfigUtils.lua` · VM: Game Engine (GE) · 592 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `vehicles_saveConfigUtils`: `extensions.load("vehicles_saveConfigUtils")`, then the global `vehicles_saveConfigUtils`

Utilities for the vehicle configuration metadata editor (info_<config>.json) when saving. Defines the list of editable fields (Description, Value, Years, vehicleSelectorSubCluster, vehicleSelectorSubGroup, Country, Region, Type, Body Style, Config Type, Commercial Class, Derby Class, InsuranceClass, Population) with their type, limits and labels. `getFields` prepares these fields for the UI (values, options, fallback value) and `validateMetadata` normalizes and validates the metadata before writing.

## Example

```lua
local fields = vehicles_saveConfigUtils.getFields('pickup', '/vehicles/pickup/', 'base', 'mon_config')
local meta, err = vehicles_saveConfigUtils.validateMetadata({Description = 'Ma config', Population = 500}, 'pickup')
if not meta then log('E', 'x', dumps(err)) end
```

## Notes

- The list options come from the vehicle catalog (core_vehicles.getModelList / getModel) or from the model's configs; they are cached (clearCache empties them).
- Type values excluded from the options: Traffic, PropTraffic, PropParked, Utility, Debug, Unknown.
- Limits: Description 120 characters max; Population integer from 0 to 50000; Value (price) >= 0; Years = {min, max} integers with min <= max; InsuranceClass among dailyDriver, commercial, prestige.
- The errors of validateMetadata have the form {field, code} with code among notTable, unknownField, invalidType, empty, tooLong, invalidRange, invalidOption, invalidNumber.
- If two catalog values have the same translated label, the most frequent one is kept and a warning is logged only once.

## Functions

| Function | Description | Line |
|---|---|---|
| `vehicles_saveConfigUtils.clearCache()` | Empties the option caches (country and catalog); call when the vehicle list has changed. | 581 |
| `vehicles_saveConfigUtils.getFields(modelKey, vehicleDirectory, sourceConfigName, targetConfigName)` | Builds the list of metadata fields for the editor. For each definition, computes the target config's value (falling back to the source config if useSourceFallback), the model's fallback value, the `included` state, and the options (with a "custom" entry for lists that allow a free value). Returns copies of the definitions, without the internal keys. | 452 |
| `vehicles_saveConfigUtils.validateMetadata(metadata, modelKey)` | Validates and normalizes a metadata table. The lowercase alias `description` is accepted for `Description`. Rejects unknown keys and invalid values; trims texts, sorts multi-selections. | 506 |

### Parameter details

#### `vehicles_saveConfigUtils.getFields(modelKey, vehicleDirectory, sourceConfigName, targetConfigName)`

Builds the list of metadata fields for the editor. For each definition, computes the target config's value (falling back to the source config if useSourceFallback), the model's fallback value, the `included` state, and the options (with a "custom" entry for lists that allow a free value). Returns copies of the definitions, without the internal keys.

- `modelKey` (*string*) : vehicle model key
- `vehicleDirectory` (*string|nil*) : vehicle folder (ending with /) where to read info_<config>.json; otherwise core_vehicles.getConfig is used
- `sourceConfigName` (*string|nil*) : name of the source config (fallback values)
- `targetConfigName` (*string|nil*) : name of the target config whose current values are read
- **returns**: table[] ordered list of fields: key, type, label, value, fallbackValue, included, optional, options, etc.

#### `vehicles_saveConfigUtils.validateMetadata(metadata, modelKey)`

Validates and normalizes a metadata table. The lowercase alias `description` is accepted for `Description`. Rejects unknown keys and invalid values; trims texts, sorts multi-selections.

- `metadata` (*table|nil*) : metadata to validate; nil gives an empty table
- `modelKey` (*string|nil*) : model key, used to resolve the options of model-dependent lists
- **returns**: table|nil normalized metadata, or nil on error
- **returns**: table|nil on error: {field = key or nil, code = string}

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/vehicles/saveConfigUtils.lua`.*
