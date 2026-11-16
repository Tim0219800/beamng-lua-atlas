# `editor_toolUtilities_style`

*File: `lua/ge/extensions/editor/toolUtilities/style.lua` · VM: Game Engine (GE) · 409 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_style`: `extensions.load("editor_toolUtilities_style")`, then the global `editor_toolUtilities_style`

Style settings of the editor's spline tools: 3D colors (cursor, nodes, junctions, splines, handles, preview wires) for debug drawing, and ImGui color palettes per theme. The available themes are blueRose, vapourStatic, canyonClay, terminalAurora, summerOfLove, deerPark, dreamMachine, headlights, crystal (default) and neoIndustrial.

## Example

```lua
local cols = require('editor/toolUtilities/style').getImguiCols('crystal')
im.TextColored(cols.dullWhite, 'texte')
```

## Notes

- getStyle() builds a new table on each call (color(r,g,b,a) 0-255 for rendering, ImVec4 0-1 for ImGui).
- getImguiCols returns the 'crystal' palette for an unknown or nil theme.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_style.getImguiCols(theme)` | Returns the ImGui color palette of the requested theme. | 379 |
| `editor_toolUtilities_style.getStyle()` | Returns the interface style properties: colors of cursor, nodes, junctions, splines (selected, faded, linked), handles, preview wires, and a few ImVec4 (greenD, blueB, blueD, redB, yellowB). | 14 |

### Parameter details

#### `editor_toolUtilities_style.getImguiCols(theme)`

Returns the ImGui color palette of the requested theme.

- `theme` (*string|nil*) : Theme name (see module); 'crystal' by default.
- **returns**: table Palette of named colors (ImVec4).

#### `editor_toolUtilities_style.getStyle()`

Returns the interface style properties: colors of cursor, nodes, junctions, splines (selected, faded, linked), handles, preview wires, and a few ImVec4 (greenD, blueB, blueD, redB, yellowB).

- **returns**: table Table of named colors.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/style.lua`.*
