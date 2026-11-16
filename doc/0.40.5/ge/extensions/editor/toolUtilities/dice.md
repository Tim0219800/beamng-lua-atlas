# `editor_toolUtilities_dice`

*File: `lua/ge/extensions/editor/toolUtilities/dice.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_dice`: `extensions.load("editor_toolUtilities_dice")`, then the global `editor_toolUtilities_dice`

Deterministic pseudo-random draw for editor tools: from a seed, a salt that distinguishes several decisions at the same address, and up to five numbers (a to e) that say "where" (volume, floor, piece index...), always returns the same value. Useful for reproducible variations (jitter) without state.

## Example

```lua
local r = editor_toolUtilities_dice.roll(seed, 1, floor, bay)
local j = editor_toolUtilities_dice.spread(seed, 2, floor, bay)
```

## Notes

- Missing slots a to e (nil) count as zero, as do seed and salt.
- The computation is modulo 2147483647; the result is in [0,1).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e)` | Deterministic draw in [0,1) for the address (seed, salt, a..e). | 12 |
| `editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e)` | Same draw as roll, brought to the interval -1..1 (deviation in either direction, handy for jitter). | 24 |

### Parameter details

#### `editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e)`

Deterministic draw in [0,1) for the address (seed, salt, a..e).

- `seed` (*number|nil*) : Seed
- `salt` (*number|nil*) : Salt distinguishing the decisions of a same address
- `a` (*number|nil*) : Address component 1
- `b` (*number|nil*) : Address component 2
- `c` (*number|nil*) : Address component 3
- `d` (*number|nil*) : Address component 4
- `e` (*number|nil*) : Address component 5
- **returns**: number Value in [0,1).

#### `editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e)`

Same draw as roll, brought to the interval -1..1 (deviation in either direction, handy for jitter).

- `seed` (*number|nil*) : Seed
- `salt` (*number|nil*) : Salt
- `a` (*number|nil*) : Address component 1
- `b` (*number|nil*) : Address component 2
- `c` (*number|nil*) : Address component 3
- `d` (*number|nil*) : Address component 4
- `e` (*number|nil*) : Address component 5
- **returns**: number Value in [-1,1).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/dice.lua`.*
