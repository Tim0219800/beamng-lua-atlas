---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/rectangleGen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Graph generator by rectangle splitting, used for procedural circuit generation (see procTrack). From starting rectangles, it successively cuts the largest splittable rectangle (vertically or horizontally) until the desired number of zones is reached, then computes the neighborhoods between adjacent rectangles. Each rectangle becomes a node (its rounded center) of the returned graph.
--- Access: extension `util_rectangleGen`: `extensions.load("util_rectangleGen")`, then the global `util_rectangleGen`
---@class util_rectangleGen
util_rectangleGen = {}

--- 2D Euclidean distance between points (a, b) and (x, y).
---Source: lua/ge/extensions/util/rectangleGen.lua:196
---@param a number X of the first point
---@param b number Y of the first point
---@param x number X of the second point
---@param y number Y of the second point
---@return number  Distance
function util_rectangleGen.dist(a, b, x, y) end

--- Recursively splits the starting rectangles, computes the neighbors (adjacent rectangles sharing an edge) and builds the node graph.
---Source: lua/ge/extensions/util/rectangleGen.lua:8
---@param params table Parameters: startingRects, rectModeParams, path (see notes)
---@return table  {nodes = list of {x, y, neighbours = list of {index, dist}, name = 'rect_<i>', force, closestNeighbourDist}, start = node or nil, finish = node or nil}
function util_rectangleGen.getGraph(params) end

