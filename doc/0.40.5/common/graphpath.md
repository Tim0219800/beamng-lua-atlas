# `graphpath`

*File: `lua/common/graphpath.lua` · VM: Common (GE + vehicle) · 1684 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("graphpath")`

Weighted road graph and pathfinding algorithms used by the AI and the navigator. newGraphpath() creates a graph (named nodes, bidirectional edges with length, drivability, lanes, one-way, positions and radii); the methods compute shortest path (Dijkstra with a min-heap), edge-based paths with turn penalty, point-to-point path, random/flee/chase paths, strongly connected components and minor graph. A modder uses it to query the road network (map.getGraphpath()) or build their own graph.

## Example

```lua
local gp = newGraphpath()
gp:edge('a', 'b', 7)
gp:edge('b', 'c', 3)
print(table.concat(gp:getPath('a', 'c'), '->'))  -- a->b->c
```

## Notes

- The module is returned by require('graphpath') with two functions: newGraphpath and newMinheap. There is no global newGraphpath unless another file defines it (the example in the header uses it as a global).
- Two families of edges: edge(sp, ep, dist) creates simple edges (len only); uniEdge/bidiEdge create rich data shared by both directions in graph[a][b] and graph[b][a] (same tables). Only bidiEdge assigns eId (edge identifier, two consecutive identifiers per edge, one per direction).
- The advanced algorithms (getPointNodePath, getFilteredPath, getEdgePath, getPathT...) assume rich edges: drivability, inNode, oneWay, gated, lanes, plus node positions and radii. They will fail (arithmetic on nil) on a graph created with edge() alone.
- Paths are arrays of node names ordered from the source to the goal; search functions return {} if a node is unknown or unreachable (unless stated otherwise).
- dirMult: cost multiplier for traversing a one-way edge against its direction (typical value 1e3-1e4; nil or 1 = no penalty).
- cutOffDrivability / penaltyAboveCutoff / penaltyBelowCutoff: roads whose drivability is <= cutOffDrivability have their cost multiplied by penaltyBelowCutoff (default 10000), the others by penaltyAboveCutoff (default 1).
- Edge fields: len (length m), drivability (0..1), speedLimit, lanes (string of '+' and '-' per lane, '+' in the direction inNode to outNode), oneWay, gated, inNode/outNode, inPos/outPos, inRadius/outRadius, eId.
- The min-heap (minheap) is shared at module level (local variable 'que') by most searches: these searches are not reentrant, except getPointToPointPathJob which creates its own heap.
- Minor bug: newGraphpath ignores its edgeCount parameter.
- Probable bug: in getFleePath and getRandomPathG, visited is initialized with {startNode = 0.2}, i.e. with the literal key 'startNode' and not the value of the variable startNode; the start node is therefore not penalized.
- No call to the C++ engine: pure Lua module. Uses globals from other files: vec3, square, clamp, sign2, tableSize, tableKeys, profilerPushEvent/PopEvent.

## Functions

| Function | Description | Line |
|---|---|---|
| `graphpath.newGraphpath(nodeCount, edgeCount)` | Creates an empty graph. The parameters are only used to pre-allocate the tables. | 123 |
| `graphpath.newMinheap()` | Creates a min-heap (priority queue) with the keys in the table itself and the values in vals. | 47 |

### Parameter details

#### `graphpath.newGraphpath(nodeCount, edgeCount)`

Creates an empty graph. The parameters are only used to pre-allocate the tables.

- `nodeCount` (*integer|nil*) : Expected number of nodes (pre-allocation).
- `edgeCount` (*integer|nil*) : Ignored by the code.
- **returns**: table Graphpath object (fields graph, positions, radius, edgeListCount).

#### `graphpath.newMinheap()`

Creates a min-heap (priority queue) with the keys in the table itself and the values in vals.

- **returns**: table minheap object.

## Class `Graphpath`

Undirected graph of nodes identified by keys (strings), with tables graph[n1][n2] = edge data, positions[n] (vec3), radius[n] (road width/half-width).

| Method | Description | Line |
|---|---|---|
| `Graphpath:_getPointToPointPathImpl(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ, yieldFn)` | Implementation of the point-to-point search: several possible access nodes/edges at the source (provided by the iterator iter) and exit toward targetPos by projection onto the edges; optional yieldFn called at each iteration. | 704 |
| `Graphpath:bidiEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad)` | Like uniEdge but also assigns an edge identifier eId (two consecutive identifiers per edge, one per direction); required for getEdgePath and the edge index. | 218 |
| `Graphpath:clear()` | Replaces the graph table with an empty table (positions and radii kept). | 173 |
| `Graphpath:edge(sp, ep, dist)` | Adds a simple edge from sp to ep (len = dist) and creates ep if absent. Only one direction is stored (graph[sp][ep]). | 177 |
| `Graphpath:edgeLanesInDirection(fromNode, toNode)` | Number of lanes of the edge going from fromNode to toNode (counts the '+' or '-' of the lanes string depending on the direction). | 515 |
| `Graphpath:export(edgeCount)` | Exports the graph in compact form (one entry per edge, no duplicates) for saving or sending to another VM. | 133 |
| `Graphpath:generateEdgeIndex()` | Builds the edgeList table (eId to node) from the edges created by bidiEdge. | 250 |
| `Graphpath:getBranchNodesAround(start, maxRadius)` | Depth-first traversal within a radius around start; returns the intersections (nodes with at least 2 new neighbors) and their links. | 1416 |
| `Graphpath:getChasePath(nodeBehind, nodeAhead, targetNodeBehind, targetNodeAhead, mePos, meVel, targetPos, targetVel, dirMult)` | Path to chase a target: picks the node ahead according to the target's position/velocity and computes a path to the target's node. | 1456 |
| `Graphpath:getEdgeIdFromNodes(fromNode, toNode)` | Identifier of the directed edge from fromNode to toNode (eId for the direction inNode->outNode, eId+1 for the reverse). | 263 |
| `Graphpath:getEdgePath(bNode, fNode, goal, dirMult)` | Shortest path over edges (states = directed edges) with turn penalties (left/right stronger at intersections, U-turn heavily penalized depending on road width). Starts from the edge bNode to fNode; the result is a list of nodes. | 523 |
| `Graphpath:getEdgePositions(n1id, n2id)` | Positions of the ends of an edge: the edge-specific position (inPos/outPos) if it exists, otherwise the node position. | 271 |
| `Graphpath:getEdgeRadii(n1id, n2id)` | Radii at the ends of an edge (the edge's own radius, otherwise the node's). | 277 |
| `Graphpath:getFilteredPath(start, goal, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff)` | Shortest path between two nodes with drivability (threshold) and wrong-way penalties. | 1266 |
| `Graphpath:getFleePath(startNode, initialDir, chasePos, pathLenLimit, rndDirCoef, rndDistCoef)` | Greedily builds a flee path away from chasePos, with direction randomization, until exceeding pathLenLimit. | 1480 |
| `Graphpath:getFlows(inNode, outNode)` | Forward and backward flow (capacity) of a directed edge, inferred from the exit node's radius distributed over the lanes. | 1035 |
| `Graphpath:getMaxNodeAround(start, radius, dir)` | Walks the graph within a radius radius around start and returns the farthest node, or the most advanced one according to the direction dir. | 1375 |
| `Graphpath:getNodesFromEdgeId(eId)` | Inverse of getEdgeIdFromNodes: returns the two nodes of the directed edge (start, end). | 267 |
| `Graphpath:getPath(start, goal, dirMult)` | Shortest path (Dijkstra) between two nodes minimizing the sum of len; one-way edges traversed against their direction are multiplied by dirMult. | 468 |
| `Graphpath:getPathAwayFrom(start, goal, mePos, stayAwayPos, dirMult)` | Path to goal that avoids stayAwayPos: the edge cost is weighted by (distance to mePos / distance to stayAwayPos). | 1339 |
| `Graphpath:getPathT(start, mePos, pathLenLim, illegalDirPenalty, initDir)` | Picks a weighted random path for AI traffic from start, favoring drivable roads, direction continuity and capacity (lane flow); stops at pathLenLim meters from mePos, up to 10 randomly drawn candidates. | 927 |
| `Graphpath:getPathTWithState(start, mePos, pathLenLim, state)` | Variant of getPathT that reuses the previous path as state to continue consistently (the last node of the previous path must be start). | 1045 |
| `Graphpath:getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Shortest path between a point (vec3) and a node, in either direction (if start is a cdata/vec3, the path is computed from the target node and reversed). Penalizes the distance between the point and the road and can end in the middle of an edge (first element of the array = node of the edge that contains the projection of the point). | 603 |
| `Graphpath:getPointToPointPath(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Path between two positions via the road network (synchronous version of _getPointToPointPathImpl). | 882 |
| `Graphpath:getPointToPointPathJob(job, sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Like getPointToPointPath but yields (job.yield) every 350 iterations (or global_yieldInterval) so as not to block the game; to be called from a jobsystem job. | 888 |
| `Graphpath:getRandomPath(nodeAhead, nodeBehind, dirMult)` | Random path (up to 5 candidates over 300 m, weighted draw) with a bias toward edge collinearity; prevents making a U-turn toward nodeBehind. | 1616 |
| `Graphpath:getRandomPathG(startNode, initialDir, pathLenLimit, rndDirCoef, rndDistCoef, oneway)` | Greedily builds a random path that favors direction continuity, until exceeding pathLenLimit. | 1545 |
| `Graphpath:graphMinor()` | Contracts degree-2 nodes: the result contains only dead ends and intersections. minor[a][b] is the ordered array of original nodes linking a and b (ends included), symmetric in minor[b][a]. | 373 |
| `Graphpath:import(graphData)` | Rebuilds the graph from the format produced by export (uses inNode/outNode/eId of the edges) and the edge index. | 147 |
| `Graphpath:numOfEdgeLanes(inNode, outNode)` | Total number of lanes of an edge and number of lanes in the given inNode->outNode direction; if lanes is absent, infers them from the radii (3.45 m per lane). | 904 |
| `Graphpath:scc(v)` | Strongly connected components (Tarjan) following only edges with drivability exactly 1. If v is given, computes only from v. | dyn |
| `Graphpath:setNodeRadius(node, radius)` | Sets the radius of a node. | 292 |
| `Graphpath:setPointPosition(p, pos)` | Sets the position of a node. | 283 |
| `Graphpath:setPointPositionRadius(p, pos, radius)` | Sets the position and radius of a node. | 287 |
| `Graphpath:spanMap(source, nodeBehind, target, edgeDict, dirMult)` | Shortest path where the cost of each edge is multiplied by edgeDict['a\0b'] (default 1e20 if absent), with a strong penalty (x300) for heading back to nodeBehind from the source; used to cover a set of edges. | 1305 |
| `Graphpath:uniEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad)` | Adds a rich edge shared by both directions, without an edge identifier (no eId). | 189 |

## Class `minheap`

Priority queue with the minimum numeric key at the head. Fields: length, vals; the keys are stored at indices 1..length of the table.

| Method | Description | Line |
|---|---|---|
| `minheap:clear()` | Empties the heap (keeps the table). | 63 |
| `minheap:empty()` | Tells whether the heap is empty. | 59 |
| `minheap:insert(k, v)` | Inserts the value v with the key k. | 68 |
| `minheap:peekKey()` | Minimum key without removing (nil if empty). | 51 |
| `minheap:peekVal()` | Value of the minimum key without removing. | 55 |
| `minheap:pop()` | Removes and returns the element with the minimum key. | 88 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/graphpath.lua`.*
