# `util_configListGenerator`

*File: `lua/ge/extensions/util/configListGenerator.lua` · VM: Game Engine (GE) · 232 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_configListGenerator`: `extensions.load("util_configListGenerator")`, then the global `util_configListGenerator`

Generates random lists of vehicles (configs) from filters, used by gameplay systems that need vehicles for sale or traffic (career dealers, for example). It starts from the core_vehicles config list, excludes props, utility vehicles and configs without a value, then draws configs at random weighted by a popularity attribute.

## Example

```lua
local eligible = util_configListGenerator.getEligibleVehicles()
local infos = util_configListGenerator.getRandomVehicleInfos({filter = {whiteList = {Type = {'Car'}}}}, 5, eligible)
```

## Notes

- A filter is a table {whiteList = {...}, blackList = {...}}: a vehicle must pass the whitelist and not pass the blacklist. The entries are attributes: lists of values (e.g. Type = {'Car'}), or {min=, max=} for numbers; 'Years' compares ranges; 'Mileage' is ignored; dictionary-type attributes (core_vehicles.getAttributesConvertToDict) read vehicleInfo.aggregates.
- A seller's filter can have subFilters: each is recursively merged into a copy of seller.filter, and a filter is chosen at random according to its probability key (1 by default).
- A config's weight is its popularity attribute (popAttribute, 'Population' by default; 1 if absent).
- Probable bug: in chooseRandomModel, both branches set the model's popularity to 1 (no increment), so all models have the same weight regardless of the number of configs.
- Return values are deep copies: modifying them does not affect the game data.
- If no vehicle passes a filter, it is removed; when no filter remains, generation stops with fewer vehicles than requested.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter)` | Returns whether a vehicle (config) satisfies a {whiteList, blackList} filter. | 70 |
| `util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers)` | Returns the sorted list (model then config) of eligible configs: having a Type and a Value, excluding Prop, Utility, PropParked and PropTraffic; the translated brand is written to Brand. | 175 |
| `util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute)` | Draws up to numberOfVehicles different configs according to a seller's filters (filterSet.filter, with any subFilters): choice of a filter, a model then a weighted config. Each result gets a filter field (the filter used). | 195 |

### Parameter details

#### `util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter)`

Returns whether a vehicle (config) satisfies a {whiteList, blackList} filter.

- `vehicleInfo` (*table*) : Vehicle config (with aggregates).
- `filter` (*table*) : Filter {whiteList = table|nil, blackList = table|nil}.
- **returns**: boolean true if the vehicle passes.

#### `util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers)`

Returns the sorted list (model then config) of eligible configs: having a Type and a Value, excluding Prop, Utility, PropParked and PropTraffic; the translated brand is written to Brand.

- `allowAuxiliaryVehicles` (*boolean|nil*) : true to include auxiliary configs.
- `allowLoadedTrailers` (*boolean|nil*) : true to include loaded trailers (hasLoad).
- **returns**: table[] Copies of the config infos.

#### `util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute)`

Draws up to numberOfVehicles different configs according to a seller's filters (filterSet.filter, with any subFilters): choice of a filter, a model then a weighted config. Each result gets a filter field (the filter used).

- `filterSet` (*table*) : Seller {filter = {...}, subFilters = {...}|nil}.
- `numberOfVehicles` (*integer|nil*) : Number of vehicles wanted, 10 by default.
- `eligibleVehicles` (*table[]|nil*) : List from getEligibleVehicles; computed if nil.
- `popAttribute` (*string|nil*) : Popularity attribute, 'Population' by default.
- **returns**: table[] Infos of the drawn vehicles (may be shorter than requested).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/configListGenerator.lua`.*
