# `editor_toolUtilities_simplex3`

*File: `lua/ge/extensions/editor/toolUtilities/simplex3.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_simplex3`: `extensions.load("editor_toolUtilities_simplex3")`, then the global `editor_toolUtilities_simplex3`

3D simplex noise (Ken Perlin's simplicial grid, after Stefan Gustavson's reference). Deterministic, continuous with continuous first derivative. The gradient indices (perm % 12 + 1) are precomputed to speed up massive calls.

## Example

```lua
local simplex3 = extensions.editor_toolUtilities_simplex3
local n = simplex3.noise(x * 0.05, y * 0.05, z * 0.05)
```

## Notes

- Value roughly in [-1, 1] (scale factor 32).
- The auto page flags an assigned global "i": these are initialization loop variables, not a real global.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_simplex3.noise(xin, yin, zin)` | 3D simplex noise at point (xin, yin, zin). | 55 |

### Parameter details

#### `editor_toolUtilities_simplex3.noise(xin, yin, zin)`

3D simplex noise at point (xin, yin, zin).

- `xin` (*number*) : x coordinate.
- `yin` (*number*) : y coordinate.
- `zin` (*number*) : z coordinate.
- **returns**: number Noise value, roughly [-1, 1].

**Globals assigned:** `i`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/simplex3.lua`.*
