# `kdtreebox3d`

*File: `lua/common/kdtreebox3d.lua` · VM: Common (GE + vehicle) · 295 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("kdtreebox3d")`

K-d tree for 3D boxes (xmin, ymin, zmin, xmax, ymax, zmax), i.e. 6 dimensions. Allows quick retrieval of all the elements whose box intersects a query box. Same API as kdtreebox2d in 3D: new -> preLoad -> build -> query/queryNotNested; export/import to reuse a tree.

## Example

```lua
local kdTreeB3d = require('kdtreebox3d')
local kdT = kdTreeB3d.new(itemCount)
kdT:preLoad(id, xmin, ymin, zmin, xmax, ymax, zmax)
kdT:build()
for id in kdT:queryNotNested(xmin, ymin, zmin, xmax, ymax, zmax) do ... end
```

## Notes

- Each element occupies 7 values in self.items (xmin, ymin, zmin, xmax, ymax, zmax, id); before build() itemCount counts values, after build() it is the number of elements.
- Same rules as kdtreebox2d: queryNotNested reuses the tree's state (no nesting), query allocates a state per query (nesting possible), query bounds clamped to ±1.7e308.
- Unlike kdtreebox2d, there is no clear() method in this version.
- In the code, the usage example at the top of the file describes the same calls as the 2D version; the 7-values-per-element version is what is implemented.

## Functions

| Function | Description | Line |
|---|---|---|
| `kdtreebox3d.new(itemCount)` | Creates an empty 3D box k-d tree. | 115 |

### Parameter details

#### `kdtreebox3d.new(itemCount)`

Creates an empty 3D box k-d tree.

- `itemCount` (*integer|nil*) : expected number of elements (preallocation, optional)
- **returns**: kdTree empty tree

## Class `kdTree`

Object returned by new().

| Method | Description | Line |
|---|---|---|
| `kdTree:_build(axis, left, right, treeIdx)` | Internal: recursive construction of a node. | 158 |
| `kdTree:analytics()` | Prints (print) tree statistics. | 284 |
| `kdTree:build()` | Builds the tree (recursive median alternating the axes) from the loaded elements. | 192 |
| `kdTree:export()` | Returns the tree data (references) for serialization/reuse. | 130 |
| `kdTree:import(kdTreeData)` | Loads data produced by export(). | 139 |
| `kdTree:preLoad(id, xmin, ymin, zmin, xmax, ymax, zmax)` | Adds an element (before build). | 146 |
| `kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Iterator over the ids of the elements whose box intersects the query box; nesting possible. | 254 |
| `kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Like query without allocation; nesting forbidden. | 268 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/kdtreebox3d.lua`.*
