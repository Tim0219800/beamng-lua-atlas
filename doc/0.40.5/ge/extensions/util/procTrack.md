# `util_procTrack`

*File: `lua/ge/extensions/util/procTrack.lua` · VM: Game Engine (GE) · 1475 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_procTrack`: `extensions.load("util_procTrack")`, then the global `util_procTrack`

Procedural generator of gymkhana-style courses, used by track generation scenarios. From starting rectangles (params.startingRects), it splits the area with util/rectangleGen to get a graph of key points, searches for a random path through them (depth-first search with backtracking), turns it into a winding track (turns, loops, straight lines), then creates in the level, under a "GymkhanaArena" SimGroup, the road (DecalRoad), cones, gates, concrete rings, barrels and BeamNGWaypoint waypoints for the current scenario. A seed makes the track reproducible; it can also be expressed as words (intToWords/wordsToInt). The objects use models from the driver_training level.

## Example

```lua
local p = extensions.util_procTrack.getDefaultParams()
p.populateFunction = function(params, scenarioParam) --[[ fill params.startingRects ]] end
p.decoration.afterFunction = function(scenarioParam) end
extensions.util_procTrack.makeGymkhana(p)
```

## Notes

- The caller must provide params.populateFunction(params, scenarionParam) (which fills params.startingRects, rootX/rootY/rootZ, etc.) and params.decoration.afterFunction(scenarionParam); the field name is spelled "scenarionParam" (typo kept from the code).
- Default parameters: root area (rootX, rootY, rootZ, rootAngleRad), attempt limits (nodeCreationCounter 5, pathCounter 15), rectModeParams (minXDist/minYDist 15 m, minNodes 6, maxNodes 27, density 0.85 per 1000 m2, fixNodes), path (minRadius 2.5, pylonRadiusThreshold 6, loop and gate probabilities, closed, lapCount), decoration (gateHeight 3, gateWidth 4.5).
- The number of nodes is (number of noSplit rectangles) + area / (1000 / density) + a random value between randomMin and randomMax, clamped between minNodes and maxNodes. Beyond 27 generation can become extremely long (code comment).
- The path search is a depth-first search with backtracking on a Hamiltonian path problem (NP-complete): the worst case is very costly.
- The seed is an integer: without a seed, it is drawn with os.time then math.random. math.randomseed(params.seed) is called in checkParams.
- Generation modifies the level (creation of SimGroup, DecalRoad, TSStatic, waypoints, be:reloadCollision()) and the current scenario (scenario.nodes, scenario.lapConfig); it deletes the old GymkhanaArena group.
- With debug.neighbours = true (default value) white debug roads connect neighboring nodes; debug.rects is also true by default.
- makeBarrel concatenates skin with no default value: a nil skin would cause a Lua error.
- The local coordinates (x, y, z) passed to getPosition are rotated by rootAngleRad then offset by rootX/rootY/rootZ.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_procTrack.checkParams()` | Checks and completes the parameters: sets the seed, calls populateFunction, computes the density and the target number of nodes (clamped by minNodes and maxNodes) and loads util/rectangleGen. | 244 |
| `util_procTrack.createPylons(nodes)` | Creates the cones, gates and concrete rings at the nodes (circle or central cone depending on the radius, gate for a straight line or a zero radius). | 975 |
| `util_procTrack.createWaypointsForScenario(nodes)` | Creates the positions and angles of the waypoints (directional BeamNGWaypoint objects) and fills scenario.nodes / scenario.lapConfig of the current scenario. | 1118 |
| `util_procTrack.createWindingPath(path)` | Extracts layout information (angles, distances, normals) from the path, determines the radii and node types (straight, curve, loop, gate) then computes the road points. | 589 |
| `util_procTrack.createWindingRoad(nodes)` | Creates the road's DecalRoad objects (materials tread_marks_clean and road_orange_markings) in the GymkhanaArena group. | 862 |
| `util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode)` | Tests whether adding the next edge from the current node is forbidden. | 498 |
| `util_procTrack.decorateStartAndFinish(nodes)` | Decorates the start and finish nodes. | 918 |
| `util_procTrack.determineInOutAngle(nodes)` | Determines the entry and exit angles around the circles (turns). | 756 |
| `util_procTrack.dist(a, b, x, y)` | 2D Euclidean distance from point (a, b) to point (x, y). | 1264 |
| `util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes)` | Tests whether adding nextNode to the path would split the remaining graph into unconnected parts. | 515 |
| `util_procTrack.getBaseInformationFromPath(path)` | Extracts basic information from the path: angles, distances, normals, etc. | 634 |
| `util_procTrack.getDefaultParams()` | Returns a new table of default parameters for a gymkhana (see notes). | 10 |
| `util_procTrack.getPathRoadNodes(nodes)` | Computes all the points needed to create the road around the nodes. | 788 |
| `util_procTrack.getPosition(xx, yy, zz)` | Transforms a local position of the course into a global position (rotation by rootAngleRad then offset by rootX, rootY, rootZ). | 1391 |
| `util_procTrack.getRotationDeg(dd)` | Converts a local angle (degrees) to a global angle by removing the course root's rotation. | 1387 |
| `util_procTrack.getSeed()` | Returns the seed of the current track. | 1429 |
| `util_procTrack.intToWords(int)` | Converts an integer seed to a sequence of concatenated 5-letter words (base of the word list size). | 1461 |
| `util_procTrack.isInList(list, element)` | Tests whether an element is present in a list. | 571 |
| `util_procTrack.makeBarrel(pos, rot, skin)` | Creates a signaling barrel (TSStatic barrelmarker_<skin>.dae), rotated by 180 degrees in addition to rot. | 1358 |
| `util_procTrack.makeBaseNodePositions()` | Generates the graph of key points (via rectangleGen.getGraph) and, if debug.neighbours is true, draws debug roads between neighbors. | 307 |
| `util_procTrack.makeConcreteRing(pos, radius)` | Creates a concrete ring (TSStatic ring_2m.dae) of the given radius (minimum 1). | 1329 |
| `util_procTrack.makeGate(pos, rot)` | Creates a gate (TSStatic gate.dae) at a local position. | 1302 |
| `util_procTrack.makeGymkhana(inParams)` | Main function: validates the parameters, generates the points, the path, the road, the cones/gates, the scenario waypoints, then calls decoration.afterFunction and displays a message with the seed. | 120 |
| `util_procTrack.makePath(graph)` | Searches for a random path in the graph, by depth-first search with backtracking. Uses the start/finish nodes (rectangle flags, otherwise the nodes closest to params.start/finish). In closed circuit mode, picks a neighbor of the start that does not cut the graph. | 368 |
| `util_procTrack.makePylon(pos, size, rot, skin)` | Creates a cone (TSStatic barriersegment from the driver_training level) at a local position of the course. | 1269 |
| `util_procTrack.reGenerate(seed)` | Regenerates the whole track reusing populateFunction, scenarionParam and afterFunction from the current parameters, with the given seed. makeGymkhana must have been called before. | 109 |
| `util_procTrack.wordsToInt(word)` | Converts a sequence of 5-letter words (seed expressed as words) to an integer. | 1437 |

### Parameter details

#### `util_procTrack.createPylons(nodes)`

Creates the cones, gates and concrete rings at the nodes (circle or central cone depending on the radius, gate for a straight line or a zero radius).

- `nodes` (*table*) : Layout nodes

#### `util_procTrack.createWaypointsForScenario(nodes)`

Creates the positions and angles of the waypoints (directional BeamNGWaypoint objects) and fills scenario.nodes / scenario.lapConfig of the current scenario.

- `nodes` (*table*) : Layout nodes

#### `util_procTrack.createWindingPath(path)`

Extracts layout information (angles, distances, normals) from the path, determines the radii and node types (straight, curve, loop, gate) then computes the road points.

- `path` (*table*) : Path from makePath
- **returns**: table Nodes with their road points (points)

#### `util_procTrack.createWindingRoad(nodes)`

Creates the road's DecalRoad objects (materials tread_marks_clean and road_orange_markings) in the GymkhanaArena group.

- `nodes` (*table*) : Nodes with road points

#### `util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode)`

Tests whether adding the next edge from the current node is forbidden.

- `current` (*table*) : Current node
- `path` (*table*) : Path in progress
- `nodes` (*table*) : Graph nodes
- `finishNode` (*table|nil*) : Finish node
- **returns**: boolean true if the edge is not allowed

#### `util_procTrack.decorateStartAndFinish(nodes)`

Decorates the start and finish nodes.

- `nodes` (*table*) : Layout nodes

#### `util_procTrack.determineInOutAngle(nodes)`

Determines the entry and exit angles around the circles (turns).

- `nodes` (*table*) : Layout nodes

#### `util_procTrack.dist(a, b, x, y)`

2D Euclidean distance from point (a, b) to point (x, y).

- `a` (*number*) : X of the first point
- `b` (*number*) : Y of the first point
- `x` (*number*) : X of the second point
- `y` (*number*) : Y of the second point
- **returns**: number Distance

#### `util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes)`

Tests whether adding nextNode to the path would split the remaining graph into unconnected parts.

- `path` (*table*) : Path in progress
- `nextNode` (*table*) : Candidate node
- `nodes` (*table*) : Graph nodes
- **returns**: boolean true if the graph would be split

#### `util_procTrack.getBaseInformationFromPath(path)`

Extracts basic information from the path: angles, distances, normals, etc.

- `path` (*table*) : Path from makePath
- **returns**: table Enriched nodes

#### `util_procTrack.getDefaultParams()`

Returns a new table of default parameters for a gymkhana (see notes).

- **returns**: table Default parameters

#### `util_procTrack.getPathRoadNodes(nodes)`

Computes all the points needed to create the road around the nodes.

- `nodes` (*table*) : Layout nodes

#### `util_procTrack.getPosition(xx, yy, zz)`

Transforms a local position of the course into a global position (rotation by rootAngleRad then offset by rootX, rootY, rootZ).

- `xx` (*number*) : Local X
- `yy` (*number*) : Local Y
- `zz` (*number*) : Local Z
- **returns**: table Global {x, y, z}

#### `util_procTrack.getRotationDeg(dd)`

Converts a local angle (degrees) to a global angle by removing the course root's rotation.

- `dd` (*number*) : Local angle in degrees
- **returns**: number Global angle in degrees

#### `util_procTrack.getSeed()`

Returns the seed of the current track.

- **returns**: integer|nil Seed, or nil if no track generated

#### `util_procTrack.intToWords(int)`

Converts an integer seed to a sequence of concatenated 5-letter words (base of the word list size).

- `int` (*integer*) : Seed
- **returns**: string Concatenated words

#### `util_procTrack.isInList(list, element)`

Tests whether an element is present in a list.

- `list` (*table*) : List
- `element` (*any*) : Element searched for
- **returns**: boolean true if present

#### `util_procTrack.makeBarrel(pos, rot, skin)`

Creates a signaling barrel (TSStatic barrelmarker_<skin>.dae), rotated by 180 degrees in addition to rot.

- `pos` (*number[]*) : Local position {x, y, z}
- `rot` (*number|nil*) : Local rotation in degrees (default 0)
- `skin` (*string*) : Model suffix (required)

#### `util_procTrack.makeBaseNodePositions()`

Generates the graph of key points (via rectangleGen.getGraph) and, if debug.neighbours is true, draws debug roads between neighbors.

- **returns**: table|nil Graph {nodes, start, finish}

#### `util_procTrack.makeConcreteRing(pos, radius)`

Creates a concrete ring (TSStatic ring_2m.dae) of the given radius (minimum 1).

- `pos` (*number[]*) : Local position {x, y, z}
- `radius` (*number*) : Radius (X and Y scale)

#### `util_procTrack.makeGate(pos, rot)`

Creates a gate (TSStatic gate.dae) at a local position.

- `pos` (*number[]*) : Local position {x, y, z}
- `rot` (*number|nil*) : Local rotation in degrees (default 0)

#### `util_procTrack.makeGymkhana(inParams)`

Main function: validates the parameters, generates the points, the path, the road, the cones/gates, the scenario waypoints, then calls decoration.afterFunction and displays a message with the seed.

- `inParams` (*table*) : Parameters (see getDefaultParams)

#### `util_procTrack.makePath(graph)`

Searches for a random path in the graph, by depth-first search with backtracking. Uses the start/finish nodes (rectangle flags, otherwise the nodes closest to params.start/finish). In closed circuit mode, picks a neighbor of the start that does not cut the graph.

- `graph` (*table*) : Graph from makeBaseNodePositions
- **returns**: table|nil List of path nodes, or nil if no path found

#### `util_procTrack.makePylon(pos, size, rot, skin)`

Creates a cone (TSStatic barriersegment from the driver_training level) at a local position of the course.

- `pos` (*number[]*) : Local position {x, y, z}
- `size` (*number|number[]|nil*) : Scale: number (height, width 0.33) or {x, y, z} (default {0.33, 0.33, 1})
- `rot` (*number|nil*) : Local rotation in degrees (default 0)
- `skin` (*string|nil*) : Model name suffix (default empty)

#### `util_procTrack.reGenerate(seed)`

Regenerates the whole track reusing populateFunction, scenarionParam and afterFunction from the current parameters, with the given seed. makeGymkhana must have been called before.

- `seed` (*integer|nil*) : New seed (nil: a random seed is drawn)

#### `util_procTrack.wordsToInt(word)`

Converts a sequence of 5-letter words (seed expressed as words) to an integer.

- `word` (*string*) : Concatenated words (5 letters each)
- **returns**: integer Integer seed

**UI events (guihooks.trigger):** `Message`, `procTrackSeed`

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/procTrack.lua`.*
