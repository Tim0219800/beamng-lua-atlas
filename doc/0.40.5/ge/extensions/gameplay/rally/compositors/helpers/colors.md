# `gameplay_rally_compositors_helpers_colors`

*File: `lua/ge/extensions/gameplay/rally/compositors/helpers/colors.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_helpers_colors`: `extensions.load("gameplay_rally_compositors_helpers_colors")`, then the global `gameplay_rally_compositors_helpers_colors`

Color palette shared by the visual rally note styles. Values are either CSS references (var(--bng-...)) consumed by the visual notes UI app, or hexadecimal codes. No functions: only color strings, grouped by usage (general, corner intensity heatmap, high-contrast neon spectrum, cut badges, cautions, modifiers).

## Notes

- These values are CSS strings, not engine Color objects.
- Aliases: iconAndTextDefault = offWhite; mainPaletteFg = offBlack; cutBg = neonGreen; cutStroke = deepGreen; dontCutBg = neonCrimson; dontCutStroke = deepCrimson; careBg/cautionBg/doubleCautionBg = offBlack; careIcon = careStroke ('#ffff00'); cautionIcon/doubleCautionIcon = '#ff0000'.
- Fields of type 'any' in the auto page are aliases to other string-typed fields.

## Fields

| Field | Type | Description |
|---|---|---|
| `black` | string | '#000000'. |
| `blue500` | string | Blue 500. |
| `blue600` | string | Blue 600. |
| `careBg` | string | Background of the 'care' note (= offBlack). |
| `careIcon` | string | Icon of the 'care' note (= careStroke). |
| `careStroke` | string | Outline of the 'care' note ('#ffff00'). |
| `cautionBg` | string | Background of the 'caution' note (= offBlack). |
| `cautionIcon` | string | 'caution' icon (= cautionStroke). |
| `cautionStroke` | string | Outline of the 'caution' note ('#ff0000'). |
| `cutBg` | string | Background of the allowed 'cut' badge (= neonGreen). |
| `cutStroke` | string | Outline of the 'cut' badge (= deepGreen). |
| `deepBlue` | string | '#005ecb'. |
| `deepCrimson` | string | '#c4002f'. |
| `deepCyan` | string | '#008fb3'. |
| `deepGold` | string | '#c7a500'. |
| `deepGreen` | string | '#00a152'. |
| `deepOrange` | string | '#c96500'. |
| `dontCutBg` | string | Background of the 'don't cut' badge (= neonCrimson). |
| `dontCutStroke` | string | Outline of the 'don't cut' badge (= deepCrimson). |
| `doubleCautionBg` | string | Background of the 'double caution' note (= offBlack). |
| `doubleCautionIcon` | string | 'double caution' icon (= doubleCautionStroke). |
| `doubleCautionStroke` | string | Outline of 'double caution' ('#ff0000'). |
| `green500` | string | Green 500. |
| `green600` | string | Green 600. |
| `iconAndTextDefault` | string | Default color for icons and text (= offWhite). |
| `indigoblue650` | string | Indigo blue 650. |
| `indigoblue750` | string | Indigo blue 750. |
| `mainPaletteFg` | string | Foreground color of the main palette (= offBlack). |
| `modifierBg` | string | Background of modifiers ('#a855f7'). |
| `modifierStroke` | string | Outline of modifiers ('#7e22ce'). |
| `neonBlue` | string | '#33a6ff'. |
| `neonCrimson` | string | '#ff1744'. |
| `neonCyan` | string | '#00d5ff'. |
| `neonGold` | string | '#ffd600'. |
| `neonGreen` | string | '#00e676'. |
| `neonOrange` | string | '#ff8a00'. |
| `offBlack` | string | var(--bng-off-black), softened black. |
| `offWhite` | string | var(--bng-off-white), softened white. |
| `orange` | string | BeamNG brand orange. |
| `orange500` | string | Orange 500. |
| `peach300` | string | Peach 300. |
| `peach400` | string | Peach 400. |
| `red550` | string | Red 550 (corner heatmap). |
| `red650` | string | Red 650. |
| `red750` | string | Red 750. |
| `white` | string | '#ffffff'. |
| `yellow400` | string | Yellow 400 (tertiary). |
| `yellow500` | string | Yellow 500. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/helpers/colors.lua`.*
