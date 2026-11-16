# `util_screenshotCreator_shippedConfigs`

*File: `lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua` · VM: Game Engine (GE) · 93 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_shippedConfigs`: `extensions.load("util_screenshotCreator_shippedConfigs")`, then the global `util_screenshotCreator_shippedConfigs`

Determines whether a vehicle model or configuration (.pc) is "shipped" with the game, i.e. not excluded by the deployment filter file /DevTools/deployfilters/shared_prepack.txt. The file is read once (lowercase rules, empty lines and # comments ignored), glob-style rules (*, **, ?) are converted to Lua patterns and results are cached. Used by the thumbnail creator (modelSelection, job) to photograph only shipped vehicles.

## Notes

- A path is considered shipped by default; it stops being so as soon as a rule in the file matches it (exact prefix or glob pattern).
- If the file /DevTools/deployfilters/shared_prepack.txt does not exist (the case for a normal game installation, this DevTools folder being an internal tool), no rule is loaded and everything is considered shipped.
- The tested paths are /vehicles/<model>/ and /vehicles/<model>/<config>.pc (lowercase).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_shippedConfigs.clearCache()` | Forgets the loaded rules and the result cache; the filter file will be reread on the next call. | 87 |
| `util_screenshotCreator_shippedConfigs.isConfigShipped(modelName, configName)` | Indicates whether the model AND the file /vehicles/<model>/<config>.pc are shipped. | 82 |
| `util_screenshotCreator_shippedConfigs.isModelShipped(modelName)` | Indicates whether the /vehicles/<model>/ folder is not excluded by the deployment filters. | 78 |

### Parameter details

#### `util_screenshotCreator_shippedConfigs.isConfigShipped(modelName, configName)`

Indicates whether the model AND the file /vehicles/<model>/<config>.pc are shipped.

- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name, without the .pc extension.
- **returns**: boolean true if the config is shipped.

#### `util_screenshotCreator_shippedConfigs.isModelShipped(modelName)`

Indicates whether the /vehicles/<model>/ folder is not excluded by the deployment filters.

- `modelName` (*string*) : Model name (vehicle folder).
- **returns**: boolean true if the model is shipped.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua`.*
