---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/procTrack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procedural generator of gymkhana-style courses, used by track generation scenarios. From starting rectangles (params.startingRects), it splits the area with util/rectangleGen to get a graph of key points, searches for a random path through them (depth-first search with backtracking), turns it into a winding track (turns, loops, straight lines), then creates in the level, under a "GymkhanaArena" SimGroup, the road (DecalRoad), cones, gates, concrete rings, barrels and BeamNGWaypoint waypoints for the current scenario. A seed makes the track reproducible; it can also be expressed as words (intToWords/wordsToInt). The objects use models from the driver_training level.
--- Access: extension `util_procTrack`: `extensions.load("util_procTrack")`, then the global `util_procTrack`
---@class util_procTrack
util_procTrack = {}

--- Checks and completes the parameters: sets the seed, calls populateFunction, computes the density and the target number of nodes (clamped by minNodes and maxNodes) and loads util/rectangleGen.
---Source: lua/ge/extensions/util/procTrack.lua:244
function util_procTrack.checkParams() end

--- Creates the cones, gates and concrete rings at the nodes (circle or central cone depending on the radius, gate for a straight line or a zero radius).
---Source: lua/ge/extensions/util/procTrack.lua:975
---@param nodes table Layout nodes
function util_procTrack.createPylons(nodes) end

--- Creates the positions and angles of the waypoints (directional BeamNGWaypoint objects) and fills scenario.nodes / scenario.lapConfig of the current scenario.
---Source: lua/ge/extensions/util/procTrack.lua:1118
---@param nodes table Layout nodes
function util_procTrack.createWaypointsForScenario(nodes) end

--- Extracts layout information (angles, distances, normals) from the path, determines the radii and node types (straight, curve, loop, gate) then computes the road points.
---Source: lua/ge/extensions/util/procTrack.lua:589
---@param path table Path from makePath
---@return table  Nodes with their road points (points)
function util_procTrack.createWindingPath(path) end

--- Creates the road's DecalRoad objects (materials tread_marks_clean and road_orange_markings) in the GymkhanaArena group.
---Source: lua/ge/extensions/util/procTrack.lua:862
---@param nodes table Nodes with road points
function util_procTrack.createWindingRoad(nodes) end

--- Tests whether adding the next edge from the current node is forbidden.
---Source: lua/ge/extensions/util/procTrack.lua:498
---@param current table Current node
---@param path table Path in progress
---@param nodes table Graph nodes
---@param finishNode table|nil Finish node
---@return boolean  true if the edge is not allowed
function util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode) end

--- Decorates the start and finish nodes.
---Source: lua/ge/extensions/util/procTrack.lua:918
---@param nodes table Layout nodes
function util_procTrack.decorateStartAndFinish(nodes) end

--- Determines the entry and exit angles around the circles (turns).
---Source: lua/ge/extensions/util/procTrack.lua:756
---@param nodes table Layout nodes
function util_procTrack.determineInOutAngle(nodes) end

--- 2D Euclidean distance from point (a, b) to point (x, y).
---Source: lua/ge/extensions/util/procTrack.lua:1264
---@param a number X of the first point
---@param b number Y of the first point
---@param x number X of the second point
---@param y number Y of the second point
---@return number  Distance
function util_procTrack.dist(a, b, x, y) end

--- Tests whether adding nextNode to the path would split the remaining graph into unconnected parts.
---Source: lua/ge/extensions/util/procTrack.lua:515
---@param path table Path in progress
---@param nextNode table Candidate node
---@param nodes table Graph nodes
---@return boolean  true if the graph would be split
function util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes) end

--- Extracts basic information from the path: angles, distances, normals, etc.
---Source: lua/ge/extensions/util/procTrack.lua:634
---@param path table Path from makePath
---@return table  Enriched nodes
function util_procTrack.getBaseInformationFromPath(path) end

--- Returns a new table of default parameters for a gymkhana (see notes).
---Source: lua/ge/extensions/util/procTrack.lua:10
---@return table  Default parameters
function util_procTrack.getDefaultParams() end

--- Computes all the points needed to create the road around the nodes.
---Source: lua/ge/extensions/util/procTrack.lua:788
---@param nodes table Layout nodes
function util_procTrack.getPathRoadNodes(nodes) end

--- Transforms a local position of the course into a global position (rotation by rootAngleRad then offset by rootX, rootY, rootZ).
---Source: lua/ge/extensions/util/procTrack.lua:1391
---@param xx number Local X
---@param yy number Local Y
---@param zz number Local Z
---@return table  Global {x, y, z}
function util_procTrack.getPosition(xx, yy, zz) end

--- Converts a local angle (degrees) to a global angle by removing the course root's rotation.
---Source: lua/ge/extensions/util/procTrack.lua:1387
---@param dd number Local angle in degrees
---@return number  Global angle in degrees
function util_procTrack.getRotationDeg(dd) end

--- Returns the seed of the current track.
---Source: lua/ge/extensions/util/procTrack.lua:1429
---@return integer|nil  Seed, or nil if no track generated
function util_procTrack.getSeed() end

--- Converts an integer seed to a sequence of concatenated 5-letter words (base of the word list size).
---Source: lua/ge/extensions/util/procTrack.lua:1461
---@param int integer Seed
---@return string  Concatenated words
function util_procTrack.intToWords(int) end

--- Tests whether an element is present in a list.
---Source: lua/ge/extensions/util/procTrack.lua:571
---@param list table List
---@param element any Element searched for
---@return boolean  true if present
function util_procTrack.isInList(list, element) end

--- Creates a signaling barrel (TSStatic barrelmarker_<skin>.dae), rotated by 180 degrees in addition to rot.
---Source: lua/ge/extensions/util/procTrack.lua:1358
---@param pos number[] Local position {x, y, z}
---@param rot number|nil Local rotation in degrees (default 0)
---@param skin string Model suffix (required)
function util_procTrack.makeBarrel(pos, rot, skin) end

--- Generates the graph of key points (via rectangleGen.getGraph) and, if debug.neighbours is true, draws debug roads between neighbors.
---Source: lua/ge/extensions/util/procTrack.lua:307
---@return table|nil  Graph {nodes, start, finish}
function util_procTrack.makeBaseNodePositions() end

--- Creates a concrete ring (TSStatic ring_2m.dae) of the given radius (minimum 1).
---Source: lua/ge/extensions/util/procTrack.lua:1329
---@param pos number[] Local position {x, y, z}
---@param radius number Radius (X and Y scale)
function util_procTrack.makeConcreteRing(pos, radius) end

--- Creates a gate (TSStatic gate.dae) at a local position.
---Source: lua/ge/extensions/util/procTrack.lua:1302
---@param pos number[] Local position {x, y, z}
---@param rot number|nil Local rotation in degrees (default 0)
function util_procTrack.makeGate(pos, rot) end

--- Main function: validates the parameters, generates the points, the path, the road, the cones/gates, the scenario waypoints, then calls decoration.afterFunction and displays a message with the seed.
---Source: lua/ge/extensions/util/procTrack.lua:120
---@param inParams table Parameters (see getDefaultParams)
function util_procTrack.makeGymkhana(inParams) end

--- Searches for a random path in the graph, by depth-first search with backtracking. Uses the start/finish nodes (rectangle flags, otherwise the nodes closest to params.start/finish). In closed circuit mode, picks a neighbor of the start that does not cut the graph.
---Source: lua/ge/extensions/util/procTrack.lua:368
---@param graph table Graph from makeBaseNodePositions
---@return table|nil  List of path nodes, or nil if no path found
function util_procTrack.makePath(graph) end

--- Creates a cone (TSStatic barriersegment from the driver_training level) at a local position of the course.
---Source: lua/ge/extensions/util/procTrack.lua:1269
---@param pos number[] Local position {x, y, z}
---@param size number|number[]|nil Scale: number (height, width 0.33) or {x, y, z} (default {0.33, 0.33, 1})
---@param rot number|nil Local rotation in degrees (default 0)
---@param skin string|nil Model name suffix (default empty)
function util_procTrack.makePylon(pos, size, rot, skin) end

--- Regenerates the whole track reusing populateFunction, scenarionParam and afterFunction from the current parameters, with the given seed. makeGymkhana must have been called before.
---Source: lua/ge/extensions/util/procTrack.lua:109
---@param seed integer|nil New seed (nil: a random seed is drawn)
function util_procTrack.reGenerate(seed) end

--- Converts a sequence of 5-letter words (seed expressed as words) to an integer.
---Source: lua/ge/extensions/util/procTrack.lua:1437
---@param word string Concatenated words (5 letters each)
---@return integer  Integer seed
function util_procTrack.wordsToInt(word) end

