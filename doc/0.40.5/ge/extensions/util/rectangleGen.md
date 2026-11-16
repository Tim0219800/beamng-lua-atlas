# `util_rectangleGen`

*File: `lua/ge/extensions/util/rectangleGen.lua` · VM: Game Engine (GE) · 204 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_rectangleGen`: `extensions.load("util_rectangleGen")`, then the global `util_rectangleGen`

Graph generator by rectangle splitting, used for procedural circuit generation (see procTrack). From starting rectangles, it successively cuts the largest splittable rectangle (vertically or horizontally) until the desired number of zones is reached, then computes the neighborhoods between adjacent rectangles. Each rectangle becomes a node (its rounded center) of the returned graph.

## Notes

- Parameters read: params.startingRects (x, y, width, height, force, noSplit, start, finish), params.rectModeParams (numNodes, minXDist, minYDist, vertSplitFunction(width, height), cutValueFunction()) and params.path.closed.
- Rectangles marked noSplit are never split and are added after the splitting phase; start and finish are kept only for them (graph.start / graph.finish).
- Splitting stops when no rectangle can be cut any more: the number of nodes can then be lower than numNodes.
- Node coordinates are rounded down to the integer (x - x%1).
- The "rectangle with no neighbor" test is present but its action (return graph) is commented out: no validity check is performed.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_rectangleGen.dist(a, b, x, y)` | 2D Euclidean distance between points (a, b) and (x, y). | 196 |
| `util_rectangleGen.getGraph(params)` | Recursively splits the starting rectangles, computes the neighbors (adjacent rectangles sharing an edge) and builds the node graph. | 8 |

### Parameter details

#### `util_rectangleGen.dist(a, b, x, y)`

2D Euclidean distance between points (a, b) and (x, y).

- `a` (*number*) : X of the first point
- `b` (*number*) : Y of the first point
- `x` (*number*) : X of the second point
- `y` (*number*) : Y of the second point
- **returns**: number Distance

#### `util_rectangleGen.getGraph(params)`

Recursively splits the starting rectangles, computes the neighbors (adjacent rectangles sharing an edge) and builds the node graph.

- `params` (*table*) : Parameters: startingRects, rectModeParams, path (see notes)
- **returns**: table {nodes = list of {x, y, neighbours = list of {index, dist}, name = 'rect_<i>', force, closestNeighbourDist}, start = node or nil, finish = node or nil}

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/rectangleGen.lua`.*
