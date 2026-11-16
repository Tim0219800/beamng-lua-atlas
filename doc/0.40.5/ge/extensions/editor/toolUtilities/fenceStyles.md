# `editor_toolUtilities_fenceStyles`

*File: `lua/ge/extensions/editor/toolUtilities/fenceStyles.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_fenceStyles`: `extensions.load("editor_toolUtilities_fenceStyles")`, then the global `editor_toolUtilities_fenceStyles`

Declarative fence styles for the editor tools (fences, railings). Each style gives the post height (which chooses the baked shape fence_post_sq_*), the height band of the rails, the number of rails and the default post spacing. Also provides the computation of rail heights according to a layout preset.

## Example

```lua
local fs = require('editor/toolUtilities/fenceStyles')
local style = fs.get('deck')
local h = fs.railHeights(style, 3, 'pinned', {})
```

## Notes

- Two styles exist: 'postrail' (Post & Rail, post 1.4 m, 1 to 7 rails, rails between 0.35 and 1.25 m, spacing 2.4 m) and 'deck' (Deck Railing, post 1.0 m, 1 to 5 rails, rails between 0.30 and 0.90 m, spacing 1.8 m).
- Heights in meters (Z of the rail center). Recognized layouts: 'pinned' (default), 'even', 'topGroup', 'bottomGroup', 'split'.
- The functions rewrite the supplied 'out' array (table.clear then fill) and return it.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_fenceStyles.get(id)` | Returns the style with the given id, or the 'postrail' style if the id is unknown. | 84 |
| `editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac)` | Computes the fractional positions of the rails in [0,1] (0 = bottom, 1 = top) for a layout preset. With a single rail, it is at 0.5. Group layouts cap pitchFrac at 0.9/max(1,count-2). | 41 |
| `editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH)` | Computes the Z heights (m) of the rail centers for a style, a rail count and a layout. For group layouts, the top of the band is raised so that the top rail ends up just under the post cap. | 71 |

### Parameter details

#### `editor_toolUtilities_fenceStyles.get(id)`

Returns the style with the given id, or the 'postrail' style if the id is unknown.

- `id` (*string*) : Style id ('postrail' or 'deck').
- **returns**: table Style table.

#### `editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac)`

Computes the fractional positions of the rails in [0,1] (0 = bottom, 1 = top) for a layout preset. With a single rail, it is at 0.5. Group layouts cap pitchFrac at 0.9/max(1,count-2).

- `count` (*integer*) : Number of rails (minimum 1).
- `layout` (*string|nil*) : 'pinned' (default, spread from 0 to 1), 'even', 'topGroup', 'bottomGroup' or 'split'.
- `out` (*table*) : Output array, cleared then filled.
- `pitchFrac` (*number|nil*) : Fractional pitch between grouped rails (default 0.18).
- **returns**: table The out array.

#### `editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH)`

Computes the Z heights (m) of the rail centers for a style, a rail count and a layout. For group layouts, the top of the band is raised so that the top rail ends up just under the post cap.

- `style` (*table*) : Style (see get).
- `count` (*integer|nil*) : Number of rails; default style.railCountDefault.
- `layout` (*string|nil*) : Layout preset (see railFractions).
- `out` (*table*) : Output array.
- `railH` (*number|nil*) : Height of a rail (m); used to compute the group pitch (railH * 1.25).
- `postH` (*number|nil*) : Post height (m); used to raise the top of the band for group layouts.
- **returns**: table The out array, filled with Z heights.

## Fields

| Field | Type | Description |
|---|---|---|
| `styleOrder` | string[] | Display order of the styles: { 'postrail', 'deck' }. |
| `styles` | table<string, table> | Style definitions keyed by id ('postrail', 'deck'). Fields: id, name, postHeight, railCountDefault/Min/Max, railBottom, railTop, spacingDefault. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/fenceStyles.lua`.*
