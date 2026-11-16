# `career_modules_vehicleClassGrouping`

*File: `lua/ge/extensions/career/modules/vehicleClassGrouping.lua` · VM: Game Engine (GE) · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_vehicleClassGrouping`: `extensions.load("career_modules_vehicleClassGrouping")`, then the global `career_modules_vehicleClassGrouping`

Generates vehicle groups by performance class (S, A, B, C, D) for the core_multiSpawn system (opponents, races). Walks through all Car/Truck models and their configs, filters by model, config and config type, keeps those whose class (gameplay_vehiclePerformance.getClassFromConfig) matches, then shuffles the result. Also provides an AI aggression coefficient per class.

## Notes

- Aggression coefficients: S 1, A 0.9, B 0.8, C 0.7, D 0.6; default class B.
- Default filters: excluded models atv, utv, us_semi, midtruck, citybus, racetruck, rockbouncer, simple_traffic; excluded config types Police, Service, Powerglow.
- With performanceIndexTarget, keeps only configs within the ±performanceIndexWindow window (5 by default); if none, takes the 10 closest. If the group remains empty, a fallback entry {model='midsize'} is added.
- The "smart shuffle" interleaves models to avoid successive duplicates of the same model.
- The mode argument ("default" or "drag") is read but has no effect in the code.

**Dependencies (loaded first):** `gameplay_vehiclePerformance`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_vehicleClassGrouping.generateGroup(class, mode, modelFilter, configFilter, configTypeFilter, invertedFilters, randomizePaint, smartShuffle, performanceIndexTarget, performanceIndexWindow)` | Builds a vehicle group of a given class, usable by core_multiSpawn. | 50 |
| `career_modules_vehicleClassGrouping.getAggressionMultiplier(class)` | Returns the AI aggression coefficient for a class. | 37 |

### Parameter details

#### `career_modules_vehicleClassGrouping.generateGroup(class, mode, modelFilter, configFilter, configTypeFilter, invertedFilters, randomizePaint, smartShuffle, performanceIndexTarget, performanceIndexWindow)`

Builds a vehicle group of a given class, usable by core_multiSpawn.

- `class` (*string|nil*) : Performance class, default "B".
- `mode` (*string|nil*) : "default" or "drag" (no effect).
- `modelFilter` (*table<string, any>|nil*) : Models to exclude (key = model).
- `configFilter` (*table<string, any>|nil*) : Configs to exclude (key "model/config").
- `configTypeFilter` (*table<string, any>|nil*) : Config types to exclude.
- `invertedFilters` (*table<string, boolean>|nil*) : E.g. {modelFilter = true} inverts the filter (whitelist).
- `randomizePaint` (*boolean|nil*) : "(Random)" paint, true by default.
- `smartShuffle` (*boolean|nil*) : Interleave models, true by default.
- `performanceIndexTarget` (*number|nil*) : Target performance index.
- `performanceIndexWindow` (*number|nil*) : Tolerance around the target, default 5.
- **returns**: table {name = "Class X", type = "custom", data = {{model, config, paintName}, ...}}.

#### `career_modules_vehicleClassGrouping.getAggressionMultiplier(class)`

Returns the AI aggression coefficient for a class.

- `class` (*string|nil*) : Class S/A/B/C/D, default "B".
- **returns**: number Coefficient (1 if the class is unknown).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"gameplay_vehiclePerformance"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/vehicleClassGrouping.lua`.*
