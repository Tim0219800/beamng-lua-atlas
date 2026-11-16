# `core_multiseatPlayerMarkers`

*File: `lua/ge/extensions/core/multiseatPlayerMarkers.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_multiseatPlayerMarkers`: `extensions.load("core_multiseatPlayerMarkers")`, then the global `core_multiseatPlayerMarkers`

GE extension `core_multiseatPlayerMarkers`: reads and writes the 'multiseatTags' setting that controls the display of player markers (tags) in local multiplayer. Three modes: 'always', 'smart' (default) and 'never'. Old boolean values are converted (true becomes 'smart', false becomes 'never').

## Example

```lua
local mode = core_multiseatPlayerMarkers.getMode()  -- 'smart' by default
core_multiseatPlayerMarkers.setMode('always')
```

## Notes

- getMode rewrites the setting in settings if the stored value was not already normalized (boolean migration).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_multiseatPlayerMarkers.getMode()` | Returns the current mode of the multiseatTags setting (default 'smart'), normalizing it and fixing the setting if needed. | 19 |
| `core_multiseatPlayerMarkers.isEnabled(mode)` | Indicates whether markers are active, i.e. whether the normalized mode is not 'never'. | 32 |
| `core_multiseatPlayerMarkers.normalize(mode)` | Converts a setting value into a valid mode: true becomes 'smart', false becomes 'never', 'always'/'smart'/'never' stay, any other value becomes 'smart'. | 13 |
| `core_multiseatPlayerMarkers.setMode(mode)` | Normalizes then saves the mode in the multiseatTags setting. | 26 |

### Parameter details

#### `core_multiseatPlayerMarkers.getMode()`

Returns the current mode of the multiseatTags setting (default 'smart'), normalizing it and fixing the setting if needed.

- **returns**: string 'always', 'smart' or 'never'.

#### `core_multiseatPlayerMarkers.isEnabled(mode)`

Indicates whether markers are active, i.e. whether the normalized mode is not 'never'.

- `mode` (*string|boolean|nil*) : Mode to test.
- **returns**: boolean true except for 'never'.

#### `core_multiseatPlayerMarkers.normalize(mode)`

Converts a setting value into a valid mode: true becomes 'smart', false becomes 'never', 'always'/'smart'/'never' stay, any other value becomes 'smart'.

- `mode` (*string|boolean|nil*) : Value to normalize.
- **returns**: string 'always', 'smart' or 'never'.

#### `core_multiseatPlayerMarkers.setMode(mode)`

Normalizes then saves the mode in the multiseatTags setting.

- `mode` (*string|boolean|nil*) : Desired mode.
- **returns**: string The mode actually saved.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/multiseatPlayerMarkers.lua`.*
