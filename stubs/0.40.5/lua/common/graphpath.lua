---@meta
-- tim19Atlas stub generated from lua/common/graphpath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Weighted road graph and pathfinding algorithms used by the AI and the navigator. newGraphpath() creates a graph (named nodes, bidirectional edges with length, drivability, lanes, one-way, positions and radii); the methods compute shortest path (Dijkstra with a min-heap), edge-based paths with turn penalty, point-to-point path, random/flee/chase paths, strongly connected components and minor graph. A modder uses it to query the road network (map.getGraphpath()) or build their own graph.
--- Access: `require("graphpath")`
---@class graphpath
local graphpath = {}

--- Creates an empty graph. The parameters are only used to pre-allocate the tables.
---Source: lua/common/graphpath.lua:123
---@param nodeCount integer|nil Expected number of nodes (pre-allocation).
---@param edgeCount integer|nil Ignored by the code.
---@return table  Graphpath object (fields graph, positions, radius, edgeListCount).
function graphpath.newGraphpath(nodeCount, edgeCount) end

--- Creates a min-heap (priority queue) with the keys in the table itself and the values in vals.
---Source: lua/common/graphpath.lua:47
---@return table  minheap object.
function graphpath.newMinheap() end

--- Undirected graph of nodes identified by keys (strings), with tables graph[n1][n2] = edge data, positions[n] (vec3), radius[n] (road width/half-width).
---@class graphpath_Graphpath
local graphpath_Graphpath = {}

--- Implementation of the point-to-point search: several possible access nodes/edges at the source (provided by the iterator iter) and exit toward targetPos by projection onto the edges; optional yieldFn called at each iteration.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/graphpath.lua:704
---@param sourcePos vec3 Source position.
---@param iter function Iterator returning (node or {n1,n2}, cost, xnorm) from nearest to farthest.
---@param targetPos vec3 Target position.
---@param cutOffDrivability number|nil Drivability threshold (default 0).
---@param dirMult number|nil Wrong-way penalty.
---@param penaltyAboveCutoff number|nil Default 1.
---@param penaltyBelowCutoff number|nil Default 10000.
---@param wZ number|nil Vertical weight (default 1).
---@param yieldFn function|nil Called at each iteration.
---@return table  Path (nodes); {} if impossible or if the direct path is better.
function graphpath_Graphpath:_getPointToPointPathImpl(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ, yieldFn) end

--- Like uniEdge but also assigns an edge identifier eId (two consecutive identifiers per edge, one per direction); required for getEdgePath and the edge index.
---Source: lua/common/graphpath.lua:218
---@param inNode any Entry node.
---@param outNode any Exit node.
---@param dist number|nil Length (default 1).
---@param drivability number|nil Drivability.
---@param speedLimit number|nil Speed limit.
---@param lanes string|nil Lanes string.
---@param oneWay boolean|nil One-way.
---@param gated number|boolean|nil Gate.
---@param inPos vec3|nil Position at inNode.
---@param inRad number|nil Radius at inNode.
---@param outPos vec3|nil Position at outNode.
---@param outRad number|nil Radius at outNode.
function graphpath_Graphpath:bidiEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad) end

--- Replaces the graph table with an empty table (positions and radii kept).
---Source: lua/common/graphpath.lua:173
function graphpath_Graphpath:clear() end

--- Adds a simple edge from sp to ep (len = dist) and creates ep if absent. Only one direction is stored (graph[sp][ep]).
---Source: lua/common/graphpath.lua:177
---@param sp any Start node.
---@param ep any End node.
---@param dist number|nil Length/cost (default 1).
function graphpath_Graphpath:edge(sp, ep, dist) end

--- Number of lanes of the edge going from fromNode to toNode (counts the '+' or '-' of the lanes string depending on the direction).
---Source: lua/common/graphpath.lua:515
---@param fromNode any Start node.
---@param toNode any End node.
---@return integer  Number of lanes in this direction.
function graphpath_Graphpath:edgeLanesInDirection(fromNode, toNode) end

--- Exports the graph in compact form (one entry per edge, no duplicates) for saving or sending to another VM.
---Source: lua/common/graphpath.lua:133
---@param edgeCount integer|nil Expected number of edges (pre-allocation).
---@return table  {edgeData, positions, radius, edgeDataCount, nodeCount}.
function graphpath_Graphpath:export(edgeCount) end

--- Builds the edgeList table (eId to node) from the edges created by bidiEdge.
---Source: lua/common/graphpath.lua:250
function graphpath_Graphpath:generateEdgeIndex() end

--- Depth-first traversal within a radius around start; returns the intersections (nodes with at least 2 new neighbors) and their links.
---Source: lua/common/graphpath.lua:1416
---@param start any Start node.
---@param maxRadius number|nil Max radius in m (default 1000).
---@return table[]|nil  List of {node, links, sqDist}; nil if start is unknown.
function graphpath_Graphpath:getBranchNodesAround(start, maxRadius) end

--- Path to chase a target: picks the node ahead according to the target's position/velocity and computes a path to the target's node.
---Source: lua/common/graphpath.lua:1456
---@param nodeBehind any Node behind the chaser.
---@param nodeAhead any Node ahead of the chaser.
---@param targetNodeBehind any Node behind the target.
---@param targetNodeAhead any Node ahead of the target.
---@param mePos vec3 Chaser position.
---@param meVel vec3 Chaser velocity.
---@param targetPos vec3 Target position.
---@param targetVel vec3 Target velocity.
---@param dirMult number|nil Wrong-way penalty.
---@return table  Node path.
function graphpath_Graphpath:getChasePath(nodeBehind, nodeAhead, targetNodeBehind, targetNodeAhead, mePos, meVel, targetPos, targetVel, dirMult) end

--- Identifier of the directed edge from fromNode to toNode (eId for the direction inNode->outNode, eId+1 for the reverse).
---Source: lua/common/graphpath.lua:263
---@param fromNode any Start node.
---@param toNode any End node.
---@return integer  Edge identifier.
function graphpath_Graphpath:getEdgeIdFromNodes(fromNode, toNode) end

--- Shortest path over edges (states = directed edges) with turn penalties (left/right stronger at intersections, U-turn heavily penalized depending on road width). Starts from the edge bNode to fNode; the result is a list of nodes.
---Source: lua/common/graphpath.lua:523
---@param bNode any Node behind.
---@param fNode any Node ahead (start direction).
---@param goal any Goal node.
---@param dirMult number|nil Wrong-way penalty (at least 1).
---@return table|nil  List of nodes; nil if the nodes do not form a valid edge or if the goal is unknown.
function graphpath_Graphpath:getEdgePath(bNode, fNode, goal, dirMult) end

--- Positions of the ends of an edge: the edge-specific position (inPos/outPos) if it exists, otherwise the node position.
---Source: lua/common/graphpath.lua:271
---@param n1id any First node.
---@param n2id any Second node.
---@return vec3  Position on the n1id side.
---@return vec3  Position on the n2id side.
function graphpath_Graphpath:getEdgePositions(n1id, n2id) end

--- Radii at the ends of an edge (the edge's own radius, otherwise the node's).
---Source: lua/common/graphpath.lua:277
---@param n1id any First node.
---@param n2id any Second node.
---@return number  Radius on the n1id side.
---@return number  Radius on the n2id side.
function graphpath_Graphpath:getEdgeRadii(n1id, n2id) end

--- Shortest path between two nodes with drivability (threshold) and wrong-way penalties.
---Source: lua/common/graphpath.lua:1266
---@param start any Start node.
---@param goal any End node.
---@param cutOffDrivability number|nil Threshold (default 0).
---@param dirMult number|nil Wrong-way penalty.
---@param penaltyAboveCutoff number|nil Default 1.
---@param penaltyBelowCutoff number|nil Default 10000.
---@return table  Node path.
function graphpath_Graphpath:getFilteredPath(start, goal, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff) end

--- Greedily builds a flee path away from chasePos, with direction randomization, until exceeding pathLenLimit.
---Source: lua/common/graphpath.lua:1480
---@param startNode any Start node.
---@param initialDir vec3 Initial direction.
---@param chasePos vec3 Chaser position.
---@param pathLenLimit number|nil Length to reach in m (default 100).
---@param rndDirCoef number|nil Magnitude of the direction randomization (default 0).
---@param rndDistCoef number|nil Growth of the randomization with distance (default 0.05, max 1).
---@return table|nil  Node path; nil if startNode is unknown.
function graphpath_Graphpath:getFleePath(startNode, initialDir, chasePos, pathLenLimit, rndDirCoef, rndDistCoef) end

--- Forward and backward flow (capacity) of a directed edge, inferred from the exit node's radius distributed over the lanes.
---Source: lua/common/graphpath.lua:1035
---@param inNode any Entry node.
---@param outNode any Exit node.
---@return number  Flow in the inNode->outNode direction.
---@return number  Flow in the reverse direction.
function graphpath_Graphpath:getFlows(inNode, outNode) end

--- Walks the graph within a radius radius around start and returns the farthest node, or the most advanced one according to the direction dir.
---Source: lua/common/graphpath.lua:1375
---@param start any Start node.
---@param radius number Search radius (m).
---@param dir vec3|nil If provided, score = projection onto dir instead of the squared distance.
---@return any|nil  Node found, nil if start is unknown.
function graphpath_Graphpath:getMaxNodeAround(start, radius, dir) end

--- Inverse of getEdgeIdFromNodes: returns the two nodes of the directed edge (start, end).
---Source: lua/common/graphpath.lua:267
---@param eId integer Edge identifier.
---@return any  Start node.
---@return any  End node.
function graphpath_Graphpath:getNodesFromEdgeId(eId) end

--- Shortest path (Dijkstra) between two nodes minimizing the sum of len; one-way edges traversed against their direction are multiplied by dirMult.
---Source: lua/common/graphpath.lua:468
---@param start any Start node.
---@param goal any End node.
---@param dirMult number|nil Wrong-way penalty (default 1).
---@return table  List of nodes; {} if start or goal is unknown.
function graphpath_Graphpath:getPath(start, goal, dirMult) end

--- Path to goal that avoids stayAwayPos: the edge cost is weighted by (distance to mePos / distance to stayAwayPos).
---Source: lua/common/graphpath.lua:1339
---@param start any Start node.
---@param goal any Goal node.
---@param mePos vec3 Agent position.
---@param stayAwayPos vec3 Position to avoid.
---@param dirMult number|nil Wrong-way penalty.
---@return table  Node path.
function graphpath_Graphpath:getPathAwayFrom(start, goal, mePos, stayAwayPos, dirMult) end

--- Picks a weighted random path for AI traffic from start, favoring drivable roads, direction continuity and capacity (lane flow); stops at pathLenLim meters from mePos, up to 10 randomly drawn candidates.
---Source: lua/common/graphpath.lua:927
---@param start any Start node.
---@param mePos vec3 Reference position for the distance.
---@param pathLenLim number Minimum path distance (m).
---@param illegalDirPenalty number|nil Not used in the code.
---@param initDir vec3 Initial direction (x, y used).
---@return table  Node path ({} if start is unknown).
function graphpath_Graphpath:getPathT(start, mePos, pathLenLim, illegalDirPenalty, initDir) end

--- Variant of getPathT that reuses the previous path as state to continue consistently (the last node of the previous path must be start).
---Source: lua/common/graphpath.lua:1045
---@param start any Start node.
---@param mePos vec3|nil Reference position (default position of start).
---@param pathLenLim number|nil Minimum path length (default 150).
---@param state vec3|table|nil Initial direction (vec3) or previous path (list of nodes).
---@return table  Node path ({} if impossible).
function graphpath_Graphpath:getPathTWithState(start, mePos, pathLenLim, state) end

--- Shortest path between a point (vec3) and a node, in either direction (if start is a cdata/vec3, the path is computed from the target node and reversed). Penalizes the distance between the point and the road and can end in the middle of an edge (first element of the array = node of the edge that contains the projection of the point).
---Source: lua/common/graphpath.lua:603
---@param start any Node or vec3.
---@param target any Vec3 or node (the other side).
---@param cutOffDrivability number|nil Drivability threshold (default 0).
---@param dirMult number|nil Wrong-way penalty.
---@param penaltyAboveCutoff number|nil Multiplier above the threshold (default 1).
---@param penaltyBelowCutoff number|nil Multiplier below the threshold (default 10000).
---@param wZ number|nil Weight of the vertical offset in the distance (default 4).
---@return table  Node path ({} if start is unknown).
function graphpath_Graphpath:getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Path between two positions via the road network (synchronous version of _getPointToPointPathImpl).
---Source: lua/common/graphpath.lua:882
---@param sourcePos vec3 Source position.
---@param iter function Iterator of nodes/edges near the source.
---@param targetPos vec3 Target position.
---@param cutOffDrivability number|nil Drivability threshold.
---@param dirMult number|nil Wrong-way penalty.
---@param penaltyAboveCutoff number|nil Multiplier above the threshold.
---@param penaltyBelowCutoff number|nil Multiplier below the threshold.
---@param wZ number|nil Vertical weight.
---@return table  Node path.
function graphpath_Graphpath:getPointToPointPath(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Like getPointToPointPath but yields (job.yield) every 350 iterations (or global_yieldInterval) so as not to block the game; to be called from a jobsystem job.
---Source: lua/common/graphpath.lua:888
---@param job table|nil core_jobsystem job (with .yield).
---@param sourcePos vec3 Source position.
---@param iter function Iterator of nodes/edges near the source.
---@param targetPos vec3 Target position.
---@param cutOffDrivability number|nil Drivability threshold.
---@param dirMult number|nil Wrong-way penalty.
---@param penaltyAboveCutoff number|nil Multiplier above the threshold.
---@param penaltyBelowCutoff number|nil Multiplier below the threshold.
---@param wZ number|nil Vertical weight.
---@return table  Node path.
function graphpath_Graphpath:getPointToPointPathJob(job, sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Random path (up to 5 candidates over 300 m, weighted draw) with a bias toward edge collinearity; prevents making a U-turn toward nodeBehind.
---Source: lua/common/graphpath.lua:1616
---@param nodeAhead any Node ahead.
---@param nodeBehind any Node behind.
---@param dirMult number|nil Wrong-way penalty.
---@return table  Node path ({} if a node is unknown).
function graphpath_Graphpath:getRandomPath(nodeAhead, nodeBehind, dirMult) end

--- Greedily builds a random path that favors direction continuity, until exceeding pathLenLimit.
---Source: lua/common/graphpath.lua:1545
---@param startNode any Start node.
---@param initialDir vec3 Initial direction.
---@param pathLenLimit number|nil Length to reach in m (default 100).
---@param rndDirCoef number|nil Direction randomization (default 0).
---@param rndDistCoef number|nil Randomization growth (default 0.05).
---@param oneway boolean|nil If false, does not penalize one-way streets taken the wrong way (default true: penalized).
---@return table|nil  Node path; nil if startNode is unknown.
function graphpath_Graphpath:getRandomPathG(startNode, initialDir, pathLenLimit, rndDirCoef, rndDistCoef, oneway) end

--- Contracts degree-2 nodes: the result contains only dead ends and intersections. minor[a][b] is the ordered array of original nodes linking a and b (ends included), symmetric in minor[b][a].
---Source: lua/common/graphpath.lua:373
---@return table  Minor graph.
function graphpath_Graphpath:graphMinor() end

--- Rebuilds the graph from the format produced by export (uses inNode/outNode/eId of the edges) and the edge index.
---Source: lua/common/graphpath.lua:147
---@param graphData table Export data.
function graphpath_Graphpath:import(graphData) end

--- Total number of lanes of an edge and number of lanes in the given inNode->outNode direction; if lanes is absent, infers them from the radii (3.45 m per lane).
---Source: lua/common/graphpath.lua:904
---@param inNode any Start node.
---@param outNode any End node.
---@return integer  Total lanes.
---@return integer  Lanes in the inNode->outNode direction.
function graphpath_Graphpath:numOfEdgeLanes(inNode, outNode) end

--- Strongly connected components (Tarjan) following only edges with drivability exactly 1. If v is given, computes only from v.
---Source: lua/common/graphpath.lua:dyn
---@param v any|nil Optional start node.
---@return table[]  List of components; each component is a node=true dictionary with the number of nodes in the key [0].
function graphpath_Graphpath:scc(v) end

--- Sets the radius of a node.
---Source: lua/common/graphpath.lua:292
---@param node any Node.
---@param radius number Radius.
function graphpath_Graphpath:setNodeRadius(node, radius) end

--- Sets the position of a node.
---Source: lua/common/graphpath.lua:283
---@param p any Node.
---@param pos vec3 Position.
function graphpath_Graphpath:setPointPosition(p, pos) end

--- Sets the position and radius of a node.
---Source: lua/common/graphpath.lua:287
---@param p any Node.
---@param pos vec3 Position.
---@param radius number Radius.
function graphpath_Graphpath:setPointPositionRadius(p, pos, radius) end

--- Shortest path where the cost of each edge is multiplied by edgeDict['a\0b'] (default 1e20 if absent), with a strong penalty (x300) for heading back to nodeBehind from the source; used to cover a set of edges.
---Source: lua/common/graphpath.lua:1305
---@param source any Start node.
---@param nodeBehind any Node behind the source.
---@param target any Goal node.
---@param edgeDict table<string, number> Per-edge coefficient, key node..'\0'..child.
---@param dirMult number|nil Wrong-way penalty.
---@return table  Node path.
function graphpath_Graphpath:spanMap(source, nodeBehind, target, edgeDict, dirMult) end

--- Adds a rich edge shared by both directions, without an edge identifier (no eId).
---Source: lua/common/graphpath.lua:189
---@param inNode any Entry node of the edge.
---@param outNode any Exit node.
---@param dist number|nil Length (default 1).
---@param drivability number|nil Drivability of the road (1 = ideal).
---@param speedLimit number|nil Speed limit.
---@param lanes string|nil Lanes string ('+' direction inNode->outNode, '-' reverse).
---@param oneWay boolean|nil One-way (inNode to outNode).
---@param gated number|boolean|nil Gate flag (value used as a number in the getPathT calculations).
---@param inPos vec3|nil Specific position of the inNode end.
---@param inRad number|nil Radius at inNode.
---@param outPos vec3|nil Specific position at outNode.
---@param outRad number|nil Radius at outNode.
function graphpath_Graphpath:uniEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad) end

--- Priority queue with the minimum numeric key at the head. Fields: length, vals; the keys are stored at indices 1..length of the table.
---@class graphpath_minheap
local graphpath_minheap = {}

--- Empties the heap (keeps the table).
---Source: lua/common/graphpath.lua:63
function graphpath_minheap:clear() end

--- Tells whether the heap is empty.
---Source: lua/common/graphpath.lua:59
---@return boolean  true if empty.
function graphpath_minheap:empty() end

--- Inserts the value v with the key k.
---Source: lua/common/graphpath.lua:68
---@param k number Key (priority, smallest comes out first).
---@param v any Associated value.
function graphpath_minheap:insert(k, v) end

--- Minimum key without removing (nil if empty).
---Source: lua/common/graphpath.lua:51
---@return number|nil  Minimum key.
function graphpath_minheap:peekKey() end

--- Value of the minimum key without removing.
---Source: lua/common/graphpath.lua:55
---@return any  Value.
function graphpath_minheap:peekVal() end

--- Removes and returns the element with the minimum key.
---Source: lua/common/graphpath.lua:88
---@return number|nil  Key (nil if empty).
---@return any  Associated value.
function graphpath_minheap:pop() end

return graphpath
