# `interpolateScatteredMap`

*File: `lua/common/interpolateScatteredMap.lua` · VM: Common (GE + vehicle) · 510 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("interpolateScatteredMap")`

2D interpolation over unstructured points using Delaunay triangulation (Bowyer-Watson). loadData builds the triangulation once; get(x, y) finds the triangle containing the point by walking from neighboring triangle to neighboring triangle (no allocation) and interpolates in barycentric coordinates. Useful for z(x, y) maps whose samples do not form a grid.

## Example

```lua
local m = require('interpolateScatteredMap').new()
m:loadData({{0,0,1},{1,0,2},{0,1,3},{1,1,4}}, {outsideMode = 'clamp'})
local z = m:get(0.3, 0.4)
```

## Notes

- Accepted points: {x, y, value} or {x=..., y=..., value=...}. Points without all three fields are ignored.
- opts: outsideMode ('default' = defaultValue, 'nil', 'clamp' = value interpolated on the nearest hull edge, 'extrapolate' = extension of the current triangle's plane), defaultValue (default 0), xScale/yScale/zScale, joggle (point perturbation, default 0, disabled), dedupTol (deduplication tolerance, default 1e-9, on normalized coordinates).
- At least 3 distinct points and a non-zero extent in x and y are required; otherwise loadData returns self with valid == false and get returns defaultValue.
- Coordinates are normalized to [0,1]² for the triangulation; deduplication is O(n²), so it is costly with many points.
- The result of the last call (x, y, mode, defaultValue) is cached.

## Functions

| Function | Description | Line |
|---|---|---|
| `interpolateScatteredMap.new()` | Creates an empty interpolation object (valid = false, outsideMode 'default', defaultValue 0). | 491 |

### Parameter details

#### `interpolateScatteredMap.new()`

Creates an empty interpolation object (valid = false, outsideMode 'default', defaultValue 0).

- **returns**: table Object with methods loadData, get, validate, outsideValue, bruteForce, exportTriangles.

## Class `interpolateScatteredMap`

Object returned by new(). Fields: tris, triCount, hullEdges, valid, outsideMode, defaultValue, minX/maxX/minY/maxY, sx, sy.

| Method | Description | Line |
|---|---|---|
| `interpolateScatteredMap:bruteForce(x, y)` | Linear search for the triangle containing (x, y); fallback when the walk fails. | dyn |
| `interpolateScatteredMap:exportTriangles()` | Rebuilds the triangles in input coordinates for debug/visualization. | dyn |
| `interpolateScatteredMap:get(x, y)` | Returns the interpolated value at the point (x, y). Outside the convex hull, depends on outsideMode. | dyn |
| `interpolateScatteredMap:loadData(inputData, opts)` | Loads the points, normalizes, deduplicates, triangulates and prepares the triangle neighborhood. | dyn |
| `interpolateScatteredMap:outsideValue(px, py, ti)` | Value to return for a point outside the hull according to outsideMode (normally called by get; px, py in normalized coordinates). | dyn |
| `interpolateScatteredMap:validate(inputData, tolerance)` | Tests the map on the input points and returns the maximum error. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/interpolateScatteredMap.lua`.*
