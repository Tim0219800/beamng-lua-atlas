# `quadtree`

*File: `lua/common/quadtree.lua` · VM: Common (GE + vehicle) · 392 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("quadtree")`

2D quadtree for boxes (insertion, removal, query, compression). Unlike k-d trees, elements can be inserted and removed after construction, and an ongoing query is not disturbed by a removal. Each element is (id, xmin, ymin, xmax, ymax). Flow: newQuadtree -> preLoad (to size the canvas) -> build(maxDepth) -> [compress] -> insert/remove/query.

## Example

```lua
local tree = require('quadtree')
local q = tree.newQuadtree()
for _, it in ipairs(items) do q:preLoad(it.id, it.xmin, it.ymin, it.xmax, it.ymax) end
q:build(10) -- optional max depth (10 by default)
q:insert(id, xmin, ymin, xmax, ymax)
q:remove(id, centerX, centerY)
for id in q:queryNotNested(xmin, ymin, xmax, ymax) do ... end
```

## Notes

- The canvas (root box) is computed by preLoad as the union of the preloaded boxes and no longer changes after build; elements outside the canvas can be inserted/removed/queried (they stay in the nodes close to the root).
- Structure: self.tree[i] is the table of the elements of node i (5 values per element: id, xmin, ymin, xmax, ymax — the header comment mentions another xmin/xmax order) with itemCount; self.children[i] is the index of the first of 4 children.
- remove(itm_id, itm_x, itm_y) needs the element's CENTER to find it (descent in the tree according to this point); the removal replaces the node's table (supports active queries). An element that overflows the edges of a quadrant stays in the parent node: the removal tests the current node first before descending.
- queryNotNested reuses the tree state (no nesting); query allocates a state per query and supports nesting. Both return the ids of the elements whose box intersects the query box.
- build(maxDepth) inserts the preloaded elements then frees the preloaded list (itm_preld = nil): preLoad can no longer be called after build (use insert).
- compress() copies the node tables to reduce memory; later insertions may be slower (code note).
- The fields M.pointBBox and M.lineBBox are references to the global functions pointBB2d and lineBB2d of mathlib (the automatic extraction marks them unknown).

## Functions

| Function | Description | Line |
|---|---|---|
| `quadtree.newQuadtree(numOfItems)` | Creates an empty quadtree. Default max depth 10 (the root is depth 1). | 81 |

### Parameter details

#### `quadtree.newQuadtree(numOfItems)`

Creates an empty quadtree. Default max depth 10 (the root is depth 1).

- `numOfItems` (*integer|nil*) : number of expected elements for preallocation (optional)
- **returns**: quadTree empty quadtree

## Fields

| Field | Type | Description |
|---|---|---|
| `lineBBox` | function | Alias of lineBB2d (mathlib): bounding box of a segment expanded by a radius. |
| `pointBBox` | function | Alias of pointBB2d (mathlib): bounding box of a point expanded by a radius. |

## Class `quadTree`

Object returned by newQuadtree().

| Method | Description | Line |
|---|---|---|
| `quadTree:analytics()` | Prints (print) the depth, the number of nodes and of occupied elements. | 361 |
| `quadTree:build(maxDepth)` | Inserts all the preloaded elements into the tree. maxDepth (default 10) bounds the depth. | 244 |
| `quadTree:compress()` | Reduces memory by copying the node tables to their exact size. Optional after build. | 347 |
| `quadTree:export()` | Returns the tree data {tree, children, nodeCount, maxDepth, xmin, xmax, ymin, ymax} (references). | 101 |
| `quadTree:import(quadTreeData)` | Loads data produced by export() (and discards the preloaded list). | 114 |
| `quadTree:insert(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax)` | Inserts an element (after build or during use) into the deepest node that fully contains it. | 144 |
| `quadTree:preLoad(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax)` | Stores an element and enlarges the tree's canvas; to be used before build(). | 124 |
| `quadTree:query(query_xmin, query_ymin, query_xmax, query_ymax)` | Iterator over the ids of the elements intersecting the query box; supports nested queries and removals during iteration. | 310 |
| `quadTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax)` | Like query without allocation; do not nest. | 329 |
| `quadTree:remove(itm_id, itm_x, itm_y)` | Removes the element with identifier itm_id by searching along the path leading to its center (itm_x, itm_y). No effect if it is not found. | 194 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/quadtree.lua`.*
