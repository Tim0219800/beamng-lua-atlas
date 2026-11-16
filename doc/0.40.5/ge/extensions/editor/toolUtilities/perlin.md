# `editor_toolUtilities_perlin`

*File: `lua/ge/extensions/editor/toolUtilities/perlin.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_perlin`: `extensions.load("editor_toolUtilities_perlin")`, then the global `editor_toolUtilities_perlin`

Classic 2D Perlin noise (fixed 256-entry permutation table, Perlin's improved fade curve), deterministic. Used by editor tools to generate reproducible pseudo-random variations.

## Example

```lua
local perlin = extensions.editor_toolUtilities_perlin
local n = perlin.noise(x * 0.1, y * 0.1) -- smoothed value
```

## Notes

- The result is periodic with period 256 in x and in y (mask band(floor(x),255)).
- Uses the game's global lerp function.
- The auto page flags an assigned global "i": the initialization loop is actually `for i = 0, 255` (local loop variable), so it is a false alarm.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_perlin.noise(x, y)` | Returns 2D Perlin noise at point (x, y). Continuous value, zero at integer coordinates, with amplitude around [-1, 1] approximately. | 49 |

### Parameter details

#### `editor_toolUtilities_perlin.noise(x, y)`

Returns 2D Perlin noise at point (x, y). Continuous value, zero at integer coordinates, with amplitude around [-1, 1] approximately.

- `x` (*number*) : x coordinate.
- `y` (*number*) : y coordinate.
- **returns**: number Noise value.

**Globals assigned:** `i`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/perlin.lua`.*
