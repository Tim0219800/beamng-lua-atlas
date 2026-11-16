# `kdtreepoint3d`

*File: `lua/common/kdtreepoint3d.lua` · VM: Common (GE + vehicle) · 319 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("kdtreepoint3d")`

K-d tree for 3D points. Offers two kinds of queries: the points in a box (query / queryNotNested, iterators) and the nearest point to a given point (findNearest). Typical for finding the road node or object nearest to a position. Flow: new -> preLoad -> build -> queries.

## Example

```lua
local kdTreeP3d = require('kdtreepoint3d')
local kdT = kdTreeP3d.new(itemCount)
for id, p in pairs(points) do kdT:preLoad(id, p.x, p.y, p.z) end
kdT:build()
local nearestId, dist = kdT:findNearest(x, y, z)
for id in kdT:queryNotNested(xmin, ymin, zmin, xmax, ymax, zmax) do ... end
```

## Notes

- Each point occupies 4 values in self.items (x, y, z, id); before build() itemCount counts values, after build() it is the number of points.
- The usage comment writes `kdT:preload` but the actual method is preLoad (capital L).
- findNearest returns the id and the DISTANCE (square root, not the squared value). It uses self.qPoint and self.stack: not reentrant, and it does not work before build. It uses the global square (mathlib).
- queryNotNested cannot be nested (state reused); query can. Query bounds clamped to ±1.7e308.
- No clear() method in this version (unlike kdtreebox2d).

## Functions

| Function | Description | Line |
|---|---|---|
| `kdtreepoint3d.new(itemCount)` | Creates an empty 3D point k-d tree. | 105 |

### Parameter details

#### `kdtreepoint3d.new(itemCount)`

Creates an empty 3D point k-d tree.

- `itemCount` (*integer|nil*) : expected number of points (preallocation, optional)
- **returns**: kdTree empty tree

## Class `kdTree`

Object returned by new().

| Method | Description | Line |
|---|---|---|
| `kdTree:_build(axis, left, right, treeIdx)` | Internal: recursive construction of a node. | 143 |
| `kdTree:analytics()` | Prints (print) tree statistics. | 309 |
| `kdTree:build()` | Builds the tree from the loaded points. | 175 |
| `kdTree:export()` | Returns the tree data (references) for reuse. | 121 |
| `kdTree:findNearest(x, y, z)` | Finds the point nearest to (x, y, z) and returns its id and the Euclidean distance. | 262 |
| `kdTree:import(kdTreeData)` | Loads data produced by export(). | 130 |
| `kdTree:preLoad(id, x, y, z)` | Adds a point (before build). | 137 |
| `kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Iterator over the ids of the points located in the query box; nesting possible. | 233 |
| `kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Like query without allocation; do not nest. | 247 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/kdtreepoint3d.lua`.*
