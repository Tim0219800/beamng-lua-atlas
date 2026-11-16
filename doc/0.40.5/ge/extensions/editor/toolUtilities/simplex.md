# `editor_toolUtilities_simplex`

*File: `lua/ge/extensions/editor/toolUtilities/simplex.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_simplex`: `extensions.load("editor_toolUtilities_simplex")`, then the global `editor_toolUtilities_simplex`

2D simplex noise (Perlin's simplicial grid) with a fixed permutation table, hence deterministic. Optimized for millions of samples (precomputed skew factors, gradients in two flat arrays, precomputed gradient indices). Used by editor tools for reproducible pseudo-random variations.

## Example

```lua
local simplex = extensions.editor_toolUtilities_simplex
local n = simplex.noise(x * 0.05, y * 0.05)
```

## Notes

- Continuous value, roughly in [-1, 1] (scale factor 70).
- Periodic with 256 cells in i and j (i % 256, j % 256).
- The auto page flags an assigned global "i": these are `for i = ...` loop variables, not a real global.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_simplex.noise(xin, yin)` | 2D simplex noise at point (xin, yin). | 54 |

### Parameter details

#### `editor_toolUtilities_simplex.noise(xin, yin)`

2D simplex noise at point (xin, yin).

- `xin` (*number*) : x coordinate.
- `yin` (*number*) : y coordinate.
- **returns**: number Noise value, roughly [-1, 1].

**Globals assigned:** `i`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/simplex.lua`.*
