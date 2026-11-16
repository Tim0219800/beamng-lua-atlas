# `core_settings_graphicsQualityGroup`

*File: `lua/ge/extensions/core/settings/graphicsQualityGroup.lua` · VM: Game Engine (GE) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/settings/graphicsQualityGroup")` (file under extensions/ but not a regular extension)

Base class of a graphics quality group. It loads a presets module (e.g. meshQuality, terrainQuality), keeps the current level and applies a level by writing each key to VariableRegistry; if a value changed, it calls the module's onApply hook. Used by graphic.lua, not by regular extensions.

## Example

```lua
local group = require("extensions/core/settings/graphicsQualityGroup")("core_settings_meshQuality", "mesh")
group:applyLevel("High")
```

## Notes

- The module returns a factory function (qualityLevelsFilename, groupName, options) and not an extension table.
- The auto-generated page says init(groupName) but the actual code is init(qualitiyLevelsFilename, groupName).
- applyLevel with an unknown level applies an empty table (no change) but still stores the name as the current level.
- getCurrentLevel ignores its levelString parameter and returns the current level's table (nil if unknown).

## Class `C`

Quality group. Instance fields: currentQualityLevel (string, "" at start), qualityLevels (copy of group.qualityLevels), name (string, 'unnamed_quality_group' by default), onApply (module function, nop otherwise).

The module returns a constructor: `local obj = require("core_settings_graphicsQualityGroup")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:apply(qualityLevel)` | For each key/value pair of the preset, reads VariableRegistry.get(key), compares by tostring, then VariableRegistry.set(key, value). If at least one value changed, calls self:onApply(). | 36 |
| `C:applyLevel(levelString)` | Applies the named level (via apply) then stores it as the current level. Does nothing if levelString is nil. | 20 |
| `C:getCurrentLevel(levelString)` | Returns the preset table of the current level. | 28 |
| `C:getCurrentLevelId()` | Returns the name of the current level. | 32 |
| `C:init(qualitiyLevelsFilename, groupName)` | Constructor called by the factory: require(qualityLevelsFilename) then copies qualityLevels and gets onApply. Without a file name, the group is empty. | 7 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/graphicsQualityGroup.lua`.*
