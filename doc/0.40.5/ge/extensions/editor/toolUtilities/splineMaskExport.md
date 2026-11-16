# `editor_toolUtilities_splineMaskExport`

*File: `lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_splineMaskExport`: `extensions.load("editor_toolUtilities_splineMaskExport")`, then the global `editor_toolUtilities_splineMaskExport`

Exports ribbon surfaces (splines) as a 16-bit PNG mask (GFXFormatR16) at the terrain grid size. Each texel is 65535 if its world center is inside a quadrilateral, 0 otherwise. Used by spline tools to make a mask usable by the terrain editor (painting). Requires a loaded terrain and the editor_terrainEditor extension.

## Example

```lua
extensions.editor_toolUtilities_splineMaskExport.export('/levels/mon_niveau/masque.png', sources, 0.5)
```

## Notes

- Without a terrain block or without the terrain editor, the function logs an error ('E') and exits without returning anything.
- Iterates over every texel of the grid: high cost on large terrains.
- The result is not returned: the success or failure of saveFile is only logged.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_splineMaskExport.export(filepath, sources, margin)` | Builds a kd-tree of the sources' quadrilaterals (enlarged by `margin`), rasterizes a bitmap of the terrain size and saves it as PNG. | 19 |

### Parameter details

#### `editor_toolUtilities_splineMaskExport.export(filepath, sources, margin)`

Builds a kd-tree of the sources' quadrilaterals (enlarged by `margin`), rasterizes a bitmap of the terrain size and saves it as PNG.

- `filepath` (*string*) : Path of the .png file to write.
- `sources` (*table*) : Table of tables of quadrilaterals representing the ribbon surfaces.
- `margin` (*number|nil*) : Margin added around the quadrilaterals (0 by default), in meters (inferred from code).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua`.*
