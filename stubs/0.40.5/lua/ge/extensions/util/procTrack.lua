---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/procTrack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_procTrack` : `extensions.load("util_procTrack")`, puis la globale `util_procTrack`
---@class util_procTrack
util_procTrack = {}

--- this function checks if the parameters are OK.
---Source : lua/ge/extensions/util/procTrack.lua:244
function util_procTrack.checkParams() end

--- create pylons, like circles and gates.
---Source : lua/ge/extensions/util/procTrack.lua:975
---@param nodes any
function util_procTrack.createPylons(nodes) end

--- creates the waypoint positions, angles etc.
---Source : lua/ge/extensions/util/procTrack.lua:1118
---@param nodes any
function util_procTrack.createWaypointsForScenario(nodes) end

--- this function extracts information such as angle, distance between nodes from the path.
---  then
---Source : lua/ge/extensions/util/procTrack.lua:589
---@param path any
function util_procTrack.createWindingPath(path) end

--- actually creates the road object.
---Source : lua/ge/extensions/util/procTrack.lua:862
---@param nodes any
function util_procTrack.createWindingRoad(nodes) end

--- this function checks wether adding the next edge for the node current is allowed or not.
---Source : lua/ge/extensions/util/procTrack.lua:498
---@param current any
---@param path any
---@param nodes any
---@param finishNode any
function util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode) end

--- decorates the start and finish nodes.
---Source : lua/ge/extensions/util/procTrack.lua:918
---@param nodes any
function util_procTrack.decorateStartAndFinish(nodes) end

--- determines the in and out angles for circles.
---Source : lua/ge/extensions/util/procTrack.lua:756
---@param nodes any
function util_procTrack.determineInOutAngle(nodes) end

--- returns the distance from a/b to x/y.
---Source : lua/ge/extensions/util/procTrack.lua:1264
---@param a any
---@param b any
---@param x any
---@param y any
function util_procTrack.dist(a, b, x, y) end

--- this function checks if the adding of the nextNode would result in splitting the graph.
---Source : lua/ge/extensions/util/procTrack.lua:515
---@param path any
---@param nextNode any
---@param nodes any
function util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes) end

--- extracts basic information from the path like angles, distances, normals etc.
---Source : lua/ge/extensions/util/procTrack.lua:634
---@param path any
function util_procTrack.getBaseInformationFromPath(path) end

--- This function gives you a fresh instance of the default params
---Source : lua/ge/extensions/util/procTrack.lua:10
function util_procTrack.getDefaultParams() end

--- gets all the nodes needed to create a road around the nodes.
---Source : lua/ge/extensions/util/procTrack.lua:788
---@param nodes any
function util_procTrack.getPathRoadNodes(nodes) end

--- this function transforms local position to global position.
---Source : lua/ge/extensions/util/procTrack.lua:1391
---@param xx any
---@param yy any
---@param zz any
function util_procTrack.getPosition(xx, yy, zz) end

--- this function transforms local angle in rad to global angle in deg.
---Source : lua/ge/extensions/util/procTrack.lua:1387
---@param dd any
function util_procTrack.getRotationDeg(dd) end

---Source : lua/ge/extensions/util/procTrack.lua:1429
function util_procTrack.getSeed() end

---Source : lua/ge/extensions/util/procTrack.lua:1461
---@param int any
function util_procTrack.intToWords(int) end

--- checks wether an element is in a list or not.
---Source : lua/ge/extensions/util/procTrack.lua:571
---@param list any
---@param element any
function util_procTrack.isInList(list, element) end

---Source : lua/ge/extensions/util/procTrack.lua:1358
---@param pos any
---@param rot any
---@param skin any
function util_procTrack.makeBarrel(pos, rot, skin) end

---Source : lua/ge/extensions/util/procTrack.lua:307
function util_procTrack.makeBaseNodePositions() end

---Source : lua/ge/extensions/util/procTrack.lua:1329
---@param pos any
---@param radius any
function util_procTrack.makeConcreteRing(pos, radius) end

---Source : lua/ge/extensions/util/procTrack.lua:1302
---@param pos any
---@param rot any
function util_procTrack.makeGate(pos, rot) end

--- this is the main function and will create a complete track .
---Source : lua/ge/extensions/util/procTrack.lua:120
---@param inParams any
function util_procTrack.makeGymkhana(inParams) end

--- this function finds a random path through the nodes with backtracking.
---  NOTE: currently uses depth first search with backtracking which has a worst case of about O(#edges!) which is very bad. Unfortunately, the hamilton path problem is NP-complete,
---  meaning there is no know algorithm to solve this in polynomial time, although algorithms exist to solve it in exponential time
---Source : lua/ge/extensions/util/procTrack.lua:368
---@param graph any
function util_procTrack.makePath(graph) end

--- makes a pylon (Cube) with parameters.
---Source : lua/ge/extensions/util/procTrack.lua:1269
---@param pos any
---@param size any
---@param rot any
---@param skin any
function util_procTrack.makePylon(pos, size, rot, skin) end

--- this function regenerates the whole track. a new seed can be set.
---Source : lua/ge/extensions/util/procTrack.lua:109
---@param seed any
function util_procTrack.reGenerate(seed) end

---Source : lua/ge/extensions/util/procTrack.lua:1437
---@param word any
function util_procTrack.wordsToInt(word) end

