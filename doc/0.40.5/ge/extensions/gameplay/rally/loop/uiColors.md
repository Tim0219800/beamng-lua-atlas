# `gameplay_rally_loop_uiColors`

*File: `lua/ge/extensions/gameplay/rally/loop/uiColors.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_uiColors`: `extensions.load("gameplay_rally_loop_uiColors")`, then the global `gameplay_rally_loop_uiColors`

UI color palette for the rally: one theme color for the loop and one for the stage, with an NGRC mode variant. The functions write the color into the theme field of a target table (data sent to the UI). A global theme color can override all the others.

## Example

```lua
local data = {}
gameplay_rally_loop_uiColors.updateForStage(data, false)
-- data.theme == '#1f8fff'
```

## Notes

- Colors: loop #009a1a, loopNgrc #00B890, stage #1f8fff, stageNgrc #1998b8.
- The override is normalized: spaces removed, # added if absent, #RRGGBB format required; otherwise it is nil (thus disabled).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_uiColors.getThemeOverride()` | Returns the current normalized override. | 30 |
| `gameplay_rally_loop_uiColors.setThemeOverride(hexOrNil)` | Sets (or clears with nil / invalid value) a theme color that replaces the default colors. | 26 |
| `gameplay_rally_loop_uiColors.updateForLoop(target, isNgrcMode)` | Writes target.theme with the loop color (or the override if it exists). Does nothing if target is nil. | 43 |
| `gameplay_rally_loop_uiColors.updateForStage(target, isNgrcMode)` | Same for the stage color. | 47 |

### Parameter details

#### `gameplay_rally_loop_uiColors.getThemeOverride()`

Returns the current normalized override.

- **returns**: string|nil '#RRGGBB' color or nil.

#### `gameplay_rally_loop_uiColors.setThemeOverride(hexOrNil)`

Sets (or clears with nil / invalid value) a theme color that replaces the default colors.

- `hexOrNil` (*string|nil*) : Hexadecimal color, with or without '#', 6 digits.

#### `gameplay_rally_loop_uiColors.updateForLoop(target, isNgrcMode)`

Writes target.theme with the loop color (or the override if it exists). Does nothing if target is nil.

- `target` (*table|nil*) : Table to modify.
- `isNgrcMode` (*boolean*) : true for the NGRC variant.

#### `gameplay_rally_loop_uiColors.updateForStage(target, isNgrcMode)`

Same for the stage color.

- `target` (*table|nil*) : Table to modify.
- `isNgrcMode` (*boolean*) : true for the NGRC variant.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/uiColors.lua`.*
