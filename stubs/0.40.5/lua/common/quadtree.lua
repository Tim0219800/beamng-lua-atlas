---@meta
-- tim19Atlas stub generated from lua/common/quadtree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 2D quadtree for boxes (insertion, removal, query, compression). Unlike k-d trees, elements can be inserted and removed after construction, and an ongoing query is not disturbed by a removal. Each element is (id, xmin, ymin, xmax, ymax). Flow: newQuadtree -> preLoad (to size the canvas) -> build(maxDepth) -> [compress] -> insert/remove/query.
--- Access: `require("quadtree")`
---@class quadtree
---@field lineBBox function Alias of lineBB2d (mathlib): bounding box of a segment expanded by a radius.
---@field pointBBox function Alias of pointBB2d (mathlib): bounding box of a point expanded by a radius.
local quadtree = {}

--- Creates an empty quadtree. Default max depth 10 (the root is depth 1).
---Source: lua/common/quadtree.lua:81
---@param numOfItems integer|nil number of expected elements for preallocation (optional)
---@return quadTree  empty quadtree
function quadtree.newQuadtree(numOfItems) end

--- Object returned by newQuadtree().
---@class quadtree_quadTree
local quadtree_quadTree = {}

--- Prints (print) the depth, the number of nodes and of occupied elements.
---Source: lua/common/quadtree.lua:361
function quadtree_quadTree:analytics() end

--- Inserts all the preloaded elements into the tree. maxDepth (default 10) bounds the depth.
---Source: lua/common/quadtree.lua:244
---@param maxDepth integer|nil maximum depth
function quadtree_quadTree:build(maxDepth) end

--- Reduces memory by copying the node tables to their exact size. Optional after build.
---Source: lua/common/quadtree.lua:347
function quadtree_quadTree:compress() end

--- Returns the tree data {tree, children, nodeCount, maxDepth, xmin, xmax, ymin, ymax} (references).
---Source: lua/common/quadtree.lua:101
---@return table  exported data
function quadtree_quadTree:export() end

--- Loads data produced by export() (and discards the preloaded list).
---Source: lua/common/quadtree.lua:114
---@param quadTreeData table export table
function quadtree_quadTree:import(quadTreeData) end

--- Inserts an element (after build or during use) into the deepest node that fully contains it.
---Source: lua/common/quadtree.lua:144
---@param itm_id any identifier
---@param itm_xmin number xmin
---@param itm_ymin number ymin
---@param itm_xmax number xmax
---@param itm_ymax number ymax
function quadtree_quadTree:insert(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax) end

--- Stores an element and enlarges the tree's canvas; to be used before build().
---Source: lua/common/quadtree.lua:124
---@param itm_id any identifier
---@param itm_xmin number xmin
---@param itm_ymin number ymin
---@param itm_xmax number xmax
---@param itm_ymax number ymax
function quadtree_quadTree:preLoad(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax) end

--- Iterator over the ids of the elements intersecting the query box; supports nested queries and removals during iteration.
---Source: lua/common/quadtree.lua:310
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  iterator returning the ids
---@return table  iteration state
function quadtree_quadTree:query(query_xmin, query_ymin, query_xmax, query_ymax) end

--- Like query without allocation; do not nest.
---Source: lua/common/quadtree.lua:329
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  iterator returning the ids
---@return table  iteration state (the tree)
function quadtree_quadTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax) end

--- Removes the element with identifier itm_id by searching along the path leading to its center (itm_x, itm_y). No effect if it is not found.
---Source: lua/common/quadtree.lua:194
---@param itm_id any identifier
---@param itm_x number x of the element's center
---@param itm_y number y of the element's center
function quadtree_quadTree:remove(itm_id, itm_x, itm_y) end

return quadtree
