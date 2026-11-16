# `editor_toolUtilities_surfaceKit`

*File: `lua/ge/extensions/editor/toolUtilities/surfaceKit.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_surfaceKit`: `extensions.load("editor_toolUtilities_surfaceKit")`, then the global `editor_toolUtilities_surfaceKit`

Shared kit for painting groundmodels (physics) on mesh roads (groundmodel mode of the Hero Road Editor). The groundmodel is inferred from the name of a triangle's material: grip variants look the same as the base and differ only by groundType. The variants are the road's pavement material plus a suffix (_wet, _snow or _snowy, _ice); Dry is the base material and serves as an eraser. A state can only be painted if its material exists in the level. The paint is stored in world stamps { x, y, r, m } (m = palette index starting at 1).

## Notes

- Palette: 1 Dry (ASPHALT1), 2 Wet (ASPHALT_WET), 3 Snow (SNOW), 4 Ice (ICE). The colors are only used for the editor overlay.
- In materialAt, the stamp with the highest index (painted last) wins, including a Dry eraser stamp.
- The spatial grid has a cell equal to the largest brush radius (at least 0.5) and a 3x3 neighborhood search.
- materialOf falls back to the base material if the variant does not exist; without baseMat, returns 'dry' (palette id).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_surfaceKit.buildGrid(stamps)` | Builds a uniform spatial hash over the stamps so the per-quad lookup is roughly O(1). Returns nil if nothing is painted. | 84 |
| `editor_toolUtilities_surfaceKit.colOf(i)` | Overlay color { r, g, b } (0-255); that of Dry if the index is unknown. | 41 |
| `editor_toolUtilities_surfaceKit.count()` | Number of palette entries. | 37 |
| `editor_toolUtilities_surfaceKit.get(i)` | Palette entry (id, label, groundmodel, col, suffixes). | 38 |
| `editor_toolUtilities_surfaceKit.isAvailable(i, baseMat)` | True if surface `i` is paintable: Dry always, the others only if a variant exists. | 62 |
| `editor_toolUtilities_surfaceKit.isBase(i)` | True if the index is that of the base surface (Dry); nil is treated as the base. | 39 |
| `editor_toolUtilities_surfaceKit.labelOf(i)` | Label of the entry, '?' if unknown. | 40 |
| `editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py)` | Palette index of the painted surface at world point (px, py): the highest-index stamp covering the point wins. Returns the base index if nothing covers it. | 101 |
| `editor_toolUtilities_surfaceKit.materialExists(name)` | True if a material of this name is present in the level (scenetree.findObject). | 44 |
| `editor_toolUtilities_surfaceKit.materialOf(i, baseMat)` | Material actually applied to a painted quad of surface `i`: the variant if it exists, otherwise the base. | 69 |
| `editor_toolUtilities_surfaceKit.resolveMaterials(baseMat)` | Resolves the material of each surface for a given base, in one pass (called once per mesh build). | 75 |
| `editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat)` | Name of the variant material of surface `i` for the pavement `baseMat`, or nil if no variant exists (not paintable). Dry returns the base material. | 50 |

### Parameter details

#### `editor_toolUtilities_surfaceKit.buildGrid(stamps)`

Builds a uniform spatial hash over the stamps so the per-quad lookup is roughly O(1). Returns nil if nothing is painted.

- `stamps` (*table|nil*) : List of stamps { x, y, r, m }.
- **returns**: table|nil { cell, map } or nil.

#### `editor_toolUtilities_surfaceKit.colOf(i)`

Overlay color { r, g, b } (0-255); that of Dry if the index is unknown.

- `i` (*integer*) : Index.
- **returns**: table { r, g, b }.

#### `editor_toolUtilities_surfaceKit.count()`

Number of palette entries.

- **returns**: integer 4

#### `editor_toolUtilities_surfaceKit.get(i)`

Palette entry (id, label, groundmodel, col, suffixes).

- `i` (*integer*) : Index starting at 1.
- **returns**: table|nil Entry.

#### `editor_toolUtilities_surfaceKit.isAvailable(i, baseMat)`

True if surface `i` is paintable: Dry always, the others only if a variant exists.

- `i` (*integer*) : Palette index.
- `baseMat` (*string*) : Base material.
- **returns**: boolean Available.

#### `editor_toolUtilities_surfaceKit.isBase(i)`

True if the index is that of the base surface (Dry); nil is treated as the base.

- `i` (*integer|nil*) : Palette index.
- **returns**: boolean Is the base.

#### `editor_toolUtilities_surfaceKit.labelOf(i)`

Label of the entry, '?' if unknown.

- `i` (*integer*) : Index.
- **returns**: string Label.

#### `editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py)`

Palette index of the painted surface at world point (px, py): the highest-index stamp covering the point wins. Returns the base index if nothing covers it.

- `grid` (*table|nil*) : Result of buildGrid.
- `stamps` (*table*) : The same stamps.
- `px` (*number*) : World X (m).
- `py` (*number*) : World Y (m).
- **returns**: integer Palette index.

#### `editor_toolUtilities_surfaceKit.materialExists(name)`

True if a material of this name is present in the level (scenetree.findObject).

- `name` (*string|nil*) : Material name.
- **returns**: boolean Exists.

#### `editor_toolUtilities_surfaceKit.materialOf(i, baseMat)`

Material actually applied to a painted quad of surface `i`: the variant if it exists, otherwise the base.

- `i` (*integer*) : Index.
- `baseMat` (*string*) : Base material.
- **returns**: string Material name.

#### `editor_toolUtilities_surfaceKit.resolveMaterials(baseMat)`

Resolves the material of each surface for a given base, in one pass (called once per mesh build).

- `baseMat` (*string*) : Base material.
- **returns**: table<integer, string> Palette index -> material name.

#### `editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat)`

Name of the variant material of surface `i` for the pavement `baseMat`, or nil if no variant exists (not paintable). Dry returns the base material.

- `i` (*integer*) : Palette index.
- `baseMat` (*string*) : Base material of the pavement.
- **returns**: string|nil Material name.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/surfaceKit.lua`.*
