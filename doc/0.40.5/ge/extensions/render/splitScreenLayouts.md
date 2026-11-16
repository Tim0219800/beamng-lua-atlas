# `render_splitScreenLayouts`

*File: `lua/ge/extensions/render/splitScreenLayouts.lua` · VM: Game Engine (GE) · 267 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_splitScreenLayouts`: `extensions.load("render_splitScreenLayouts")`, then the global `render_splitScreenLayouts`

Catalog of split screen layouts, used by render_splitScreen. It provides predefined layouts for 2, 3 and 4 players, an automatic grid layout for any number of players, and on load loads modders' custom layouts from /settings/**/*.splitscreenLayout.json. Rectangles are normalized from 0 to 1: {x, y, width, height}.

## Example

```lua
-- file /settings/mon_layout.splitscreenLayout.json
-- {"layouts":[{"id":"trois_colonnes","label":"Trois colonnes","playerCount":3,"layout":[[0,0,0.33,1],[0.33,0,0.34,1],[0.67,0,0.33,1]]}]}
local rects = require('ge/extensions/render/splitScreenLayouts').getLayout(3, 'trois_colonnes', 1920, 1080)
```

## Notes

- Custom layout format: id (letters, digits, _ . - ; 'automatic' and 'shared' reserved), playerCount (integer >= 1), layout (exactly one rectangle [x, y, w, h] per player), label (optional, otherwise translation key ui.multiseat.layout.<id>). Rectangles must stay within the screen (x,y >= 0, w,h > 0, x+w <= 1, y+h <= 1) and may overlap.
- An invalid or duplicate layout is ignored with a warning (tag splitScreenLayouts).
- Files are read only once, on the module's first require, in alphabetical path order.
- Predefined layouts: 2 players horizontal and vertical; 3 players horizontal, vertical, top, left, right, bottom; 4 players horizontal, vertical, corners.
- The automatic layout chooses the number of rows for which the views' aspect is closest to 16/9 * 1.2.
- A 2-pixel gap is left between views (cropping on inner edges only).
- Per-player-count settings are limited to 8: beyond that, getSettingsPlayerCount returns 9 (common setting).
- The functions are fields of M (function M.getLayout...), not locals: this module has no hooks. 'shared' (single full-screen view) does not appear in getOptions.

## Functions

| Function | Description | Line |
|---|---|---|
| `render_splitScreenLayouts.getLayout(playerCount, layoutId, screenWidth, screenHeight)` | Returns the rectangles of the requested layout for this number of players. 'shared' gives a single full-screen rectangle; an unknown identifier or 'automatic' gives the automatic layout. Gaps between views are applied. | 224 |
| `render_splitScreenLayouts.getOptions(playerCount, screenWidth, screenHeight)` | List of layout choices offered to the user for this number of players (without 'shared'), with label and rectangles. | 240 |
| `render_splitScreenLayouts.getSettingsPlayerCount(playerCount)` | Converts a player count into a multiseatLayout<N> setting number: integer value between 0 and 8, or 9 beyond 8. | 235 |
| `render_splitScreenLayouts.isShared(layoutId)` | True if the identifier is 'shared' (single shared view). | 262 |
| `render_splitScreenLayouts.isValid(playerCount, layoutId)` | Indicates whether a layout identifier exists for this number of players ('automatic' and 'shared' are always valid). | 256 |

### Parameter details

#### `render_splitScreenLayouts.getLayout(playerCount, layoutId, screenWidth, screenHeight)`

Returns the rectangles of the requested layout for this number of players. 'shared' gives a single full-screen rectangle; an unknown identifier or 'automatic' gives the automatic layout. Gaps between views are applied.

- `playerCount` (*integer*) : Number of players.
- `layoutId` (*string*) : 'automatic', 'shared' or identifier of a predefined or custom layout.
- `screenWidth` (*number|nil*) : Width in pixels (if invalid, a number below 2 is read as an aspect ratio).
- `screenHeight` (*number|nil*) : Height in pixels.
- **returns**: number[][] List of normalized rectangles {x, y, w, h}.

#### `render_splitScreenLayouts.getOptions(playerCount, screenWidth, screenHeight)`

List of layout choices offered to the user for this number of players (without 'shared'), with label and rectangles.

- `playerCount` (*integer*) : Number of players.
- `screenWidth` (*number|nil*) : Screen width in pixels.
- `screenHeight` (*number|nil*) : Screen height in pixels.
- **returns**: table[] Items {value, label, layout}.

#### `render_splitScreenLayouts.getSettingsPlayerCount(playerCount)`

Converts a player count into a multiseatLayout<N> setting number: integer value between 0 and 8, or 9 beyond 8.

- `playerCount` (*number*) : Number of players.
- **returns**: integer Setting index.

#### `render_splitScreenLayouts.isShared(layoutId)`

True if the identifier is 'shared' (single shared view).

- `layoutId` (*string*) : Identifier.
- **returns**: boolean Result.

#### `render_splitScreenLayouts.isValid(playerCount, layoutId)`

Indicates whether a layout identifier exists for this number of players ('automatic' and 'shared' are always valid).

- `playerCount` (*integer*) : Number of players.
- `layoutId` (*string*) : Identifier.
- **returns**: boolean Validity.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/splitScreenLayouts.lua`.*
