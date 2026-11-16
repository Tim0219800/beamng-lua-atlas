# `util_screenshotCreator_thumbnailTargets`

*File: `lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua` · VM: Game Engine (GE) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_thumbnailTargets`: `extensions.load("util_screenshotCreator_thumbnailTargets")`, then the global `util_screenshotCreator_thumbnailTargets`

Helper to build the list of thumbnail targets (model/config pairs) for the thumbnail composer. It validates the targets received from the UI (at most 2000, names of 128 characters maximum, duplicates removed), turns them into work items from core_vehicles data, produces the catalog of models and configs for the UI (with the "shipped" flag from shippedConfigs) and handles the default case where only the player vehicle's config is photographed.

## Notes

- A work item is {modelName, modelKey, configName, isDefaultConfig}; modelKey is configData.model_key if it exists, otherwise the model name.
- resolveStartMessage without targets requires a player vehicle whose partConfig is a named .pc file; otherwise it returns nil and an error message.
- Targets are tables {model = string, config = string}.

**Dependencies (loaded first):** `core_vehicles`, `util_screenshotCreator_shippedConfigs`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_thumbnailTargets.buildExplicitWorkItems(targets)` | Turns sanitized targets into work items. Fails if a config is unknown. | 54 |
| `util_screenshotCreator_thumbnailTargets.buildModelCatalog()` | Builds the sorted catalog of models for the UI: {key, label "Brand Name", category = Type, configs = [{key, label, isDefault, shipped}]}. Models without configs are omitted. | 71 |
| `util_screenshotCreator_thumbnailTargets.buildShippedTargets(modelKeys)` | Lists all the shipped {model, config} targets (according to shippedConfigs) for the given models. | 100 |
| `util_screenshotCreator_thumbnailTargets.getConfigData(modelKey, configName)` | Looks in core_vehicles.getModel(modelKey).configs for the configuration whose key is configName. | 16 |
| `util_screenshotCreator_thumbnailTargets.isDefaultConfig(modelKey, configName, configData)` | Indicates whether the config is the model's default one (is_default_config or the model's default_pc). | 24 |
| `util_screenshotCreator_thumbnailTargets.normalizeConfigName(partConfig)` | Extracts the config name from a .pc path (last segment, without extension). Returns nil if it is not a string ending in .pc. | 9 |
| `util_screenshotCreator_thumbnailTargets.resolveStartMessage(message)` | Converts a start message from the UI into work items: message.targets if present, otherwise the player vehicle's current config. | 113 |
| `util_screenshotCreator_thumbnailTargets.sanitizeTargets(targets)` | Validates and deduplicates a list of targets. | 30 |

### Parameter details

#### `util_screenshotCreator_thumbnailTargets.buildExplicitWorkItems(targets)`

Turns sanitized targets into work items. Fails if a config is unknown.

- `targets` (*table[]*) : List of {model, config}.
- **returns**: table[]|nil Work items.
- **returns**: string|nil "Unknown vehicle config: model/config".

#### `util_screenshotCreator_thumbnailTargets.buildModelCatalog()`

Builds the sorted catalog of models for the UI: {key, label "Brand Name", category = Type, configs = [{key, label, isDefault, shipped}]}. Models without configs are omitted.

- **returns**: table[] Model catalog.

#### `util_screenshotCreator_thumbnailTargets.buildShippedTargets(modelKeys)`

Lists all the shipped {model, config} targets (according to shippedConfigs) for the given models.

- `modelKeys` (*string[]*) : Model keys.
- **returns**: table[] {model, config} targets.

#### `util_screenshotCreator_thumbnailTargets.getConfigData(modelKey, configName)`

Looks in core_vehicles.getModel(modelKey).configs for the configuration whose key is configName.

- `modelKey` (*string*) : Model key.
- `configName` (*string*) : Configuration key.
- **returns**: table|nil Config data, or nil.

#### `util_screenshotCreator_thumbnailTargets.isDefaultConfig(modelKey, configName, configData)`

Indicates whether the config is the model's default one (is_default_config or the model's default_pc).

- `modelKey` (*string*) : Model key.
- `configName` (*string*) : Configuration key.
- `configData` (*table|nil*) : Config data, if already known.
- **returns**: boolean true if default config.

#### `util_screenshotCreator_thumbnailTargets.normalizeConfigName(partConfig)`

Extracts the config name from a .pc path (last segment, without extension). Returns nil if it is not a string ending in .pc.

- `partConfig` (*string|nil*) : Value of vehicle.partConfig, e.g. vehicles/pickup/d15_4wd.pc.
- **returns**: string|nil Configuration name, e.g. d15_4wd.

#### `util_screenshotCreator_thumbnailTargets.resolveStartMessage(message)`

Converts a start message from the UI into work items: message.targets if present, otherwise the player vehicle's current config.

- `message` (*table|nil*) : UI message ({targets = ...}).
- **returns**: table[]|nil Work items.
- **returns**: string|nil Error message.

#### `util_screenshotCreator_thumbnailTargets.sanitizeTargets(targets)`

Validates and deduplicates a list of targets.

- `targets` (*table|nil*) : List of {model, config}.
- **returns**: table|nil Sanitized list; nil if targets is nil.
- **returns**: string|nil Error message (invalid list, invalid target at index N).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: core_vehicles and util_screenshotCreator_shippedConfigs. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua`.*
