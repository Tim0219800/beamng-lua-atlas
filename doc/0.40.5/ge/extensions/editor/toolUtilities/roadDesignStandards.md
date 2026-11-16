# `editor_toolUtilities_roadDesignStandards`

*File: `lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_roadDesignStandards`: `extensions.load("editor_toolUtilities_roadDesignStandards")`, then the global `editor_toolUtilities_roadDesignStandards`

Road design standards shared by several editor tools. Defines six ordered presets, from the most rigorous to the most rustic, each with four constraints: maximum longitudinal slope (ratio), minimum curvature radius (m), maximum banking (degrees) and maximum width gradient.

## Example

```lua
local rds = extensions.editor_toolUtilities_roadDesignStandards
for _, name in ipairs(rds.getPresetStrings()) do
  local p = rds.getPresetsMap()[name]
  print(name, p.maxSlope, p.minRadius, p.maxBanking, p.maxWidthGradient)
end
```

## Notes

- Presets (maxSlope / minRadius / maxBanking / maxWidthGradient): Freeway / Autobahn 0.04 / 500 / 5 / 0.02; Major Rural Road 0.06 / 200 / 7 / 0.03; Secondary Road 0.08 / 100 / 9 / 0.05; Mountain Pass 0.12 / 40 / 12 / 0.07; Unpaved Trail 0.18 / 20 / 14 / 0.10; Off-Road / F-Road 0.24 / 12 / 18 / 0.12.
- Units: maxSlope as a rise/distance ratio, minRadius in meters, maxBanking in degrees.
- The functions return the internal tables (not copies): do not modify them.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_roadDesignStandards.getPresetStrings()` | Returns the ordered array of preset names. | 93 |
| `editor_toolUtilities_roadDesignStandards.getPresetsMap()` | Returns the table preset name -> parameters {maxSlope, minRadius, maxBanking, maxWidthGradient}. | 97 |

### Parameter details

#### `editor_toolUtilities_roadDesignStandards.getPresetStrings()`

Returns the ordered array of preset names.

- **returns**: string[] Names of the six presets.

#### `editor_toolUtilities_roadDesignStandards.getPresetsMap()`

Returns the table preset name -> parameters {maxSlope, minRadius, maxBanking, maxWidthGradient}.

- **returns**: table<string, table> Parameters of each preset.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua`.*
