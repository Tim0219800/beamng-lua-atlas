# `interpolatedMap`

*File: `lua/common/interpolatedMap.lua` · VM: Common (GE + vehicle) · 267 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("interpolatedMap")`

1D (linear) or 2D (bilinear) interpolation table on a regular or irregular grid. new() creates the object, loadData(inputData, opts) loads the data (which selects the 1D or 2D get method), then get(x[, y]) returns the interpolated value. Used for engine maps, torque curves, coefficient tables. Caches the last result and the last interval used (fast lookup when x varies little).

## Example

```lua
local map = require('interpolatedMap').new()
-- 2D: empty corner then X axis; then each row = Y value, Z values
map:loadData({{nil, 0, 1000, 2000}, {0, 10, 20, 30}, {1, 15, 25, 40}})
local z = map:get(rpm, load)
-- 1D: {x, z} pairs
map:loadData({{0, 0}, {1000, 100}, {2000, 150}})
local v = map:get(1500)
```

## Notes

- Before loadData, get and reset are empty functions (return nil).
- Formats accepted by loadData: (a) {x, z} pairs (with or without a header row whose 1st cell is a string); (b) two rows {xValues}, {zValues}; (c) 2D array whose first row gives the X values (with or without an empty corner) and each following row starts with the Y value followed by the Z values. An array of 2 rows of numbers is always interpreted as {xValues, zValues}.
- opts: xScale, yScale, zScale (multipliers applied to the axes and values, default 1).
- The X and Y axes must be increasing, with at least 2 points; otherwise division by zero in the interval computation.
- Outside the data range, get returns nil unless the field clampToDataRange is set to true (the value is then bounded to the range).
- Useful public fields: is1D, is2D, xMin, xMax, yMin, yMax, clampToDataRange (default false), xIndices, yIndices, data.
- 1D case: self.lastInputY stays nil; the last-result cache compares x and the absence of y.

## Functions

| Function | Description | Line |
|---|---|---|
| `interpolatedMap.new()` | Creates an empty interpolation table. | 245 |

### Parameter details

#### `interpolatedMap.new()`

Creates an empty interpolation table.

- **returns**: table interpolatedMap object with methods loadData, get, reset.

## Class `interpolatedMap`

Object returned by new().

| Method | Description | Line |
|---|---|---|
| `interpolatedMap:get(x, y)` | Interpolated value: get(x) in 1D, get(x, y) in 2D. Replaced by loadData depending on the dimension. | dyn |
| `interpolatedMap:loadData(inputData, opts)` | Loads the data (see formats in notes), computes the bounds and selects the 1D or 2D get method. | dyn |
| `interpolatedMap:reset()` | Does nothing (empty function). | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/interpolatedMap.lua`.*
