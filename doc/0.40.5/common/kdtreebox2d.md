# `kdtreebox2d`

*File: `lua/common/kdtreebox2d.lua` · VM: Common (GE + vehicle) · 286 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("kdtreebox2d")`

K-d tree for 2D boxes (xmin, ymin, xmax, ymax), hence 4 dimensions, allowing quick retrieval of all the elements whose box intersects a query area. Typically used for road segments, zones or obstacles. Flow: new -> preLoad (for each element) -> build -> query / queryNotNested. Queries are Lua iterators usable in a for loop.

## Example

```lua
local kdTreeB2d = require('kdtreebox2d')
local kdT = kdTreeB2d.new(itemCount) -- itemCount optional (preallocation)
for _, it in ipairs(items) do kdT:preLoad(it.id, it.xmin, it.ymin, it.xmax, it.ymax) end
kdT:build()
for id in kdT:queryNotNested(xmin, ymin, xmax, ymax) do ... end   -- non-nested queries
for id1 in kdT:query(xmin, ymin, xmax, ymax) do                    -- nested queries (creates garbage)
  for id2 in kdT:query(...) do ... end
end
```

## Notes

- Elements are stored flat in self.items in groups of 5 values (xmin, ymin, xmax, ymax, id). Before build(), self.itemCount counts values (x5); after build() it is divided by 5 and becomes the number of elements.
- The iterators return the id of each element whose box intersects the query box (inclusive). The query bounds are clamped to ±1.7e308 to accept infinities.
- queryNotNested reuses the tree's internal state: another query cannot be nested (neither queryNotNested nor query on the same tree during iteration with queryNotNested). query allocates a new state per call and supports nesting.
- build() must be called only once after all the preLoad calls (it modifies itemCount). Calling query before build() fails (tree == nil).
- clear() does nothing as long as the tree has not been built (self.tree == nil). After clear the object can be reused (preLoad then build).

## Functions

| Function | Description | Line |
|---|---|---|
| `kdtreebox2d.new(itemCount)` | Creates an empty 2D box k-d tree. | 106 |

### Parameter details

#### `kdtreebox2d.new(itemCount)`

Creates an empty 2D box k-d tree.

- `itemCount` (*integer|nil*) : expected number of elements, to preallocate (optional)
- **returns**: kdTree empty tree

## Class `kdTree`

Object returned by new(). Fields: tree, items, itemCount, nonLeafLimIdx and internal query states.

| Method | Description | Line |
|---|---|---|
| `kdTree:_build(axis, left, right, treeIdx)` | Internal: recursive construction of a node; returns the bounding box of the subtree. | 160 |
| `kdTree:analytics()` | Prints (print) tree statistics: depth, number of nodes, leaves, elements. | 275 |
| `kdTree:build()` | Builds the tree from the loaded elements (recursive median selection alternating the 4 axes). | 187 |
| `kdTree:clear()` | Empties an existing tree to reuse it (useful for frequently updated trees). No effect before build. | 122 |
| `kdTree:export()` | Returns a table {tree, nonLeafLimIdx, items, itemCount} (references, no copy) to serialize or reuse it. | 138 |
| `kdTree:import(kdTreeData)` | Replaces the content with data produced by export(). | 147 |
| `kdTree:preLoad(id, xmin, ymin, xmax, ymax)` | Adds an element (before build). | 154 |
| `kdTree:query(query_xmin, query_ymin, query_xmax, query_ymax)` | Iterator (to use in for) over the ids of the elements intersecting the given box; supports nested queries. | 247 |
| `kdTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax)` | Like query but without allocation (reuses the tree's state): do not nest. | 261 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/kdtreebox2d.lua`.*
