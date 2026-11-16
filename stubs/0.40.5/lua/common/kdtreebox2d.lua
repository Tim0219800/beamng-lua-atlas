---@meta
-- tim19Atlas stub generated from lua/common/kdtreebox2d.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- K-d tree for 2D boxes (xmin, ymin, xmax, ymax), hence 4 dimensions, allowing quick retrieval of all the elements whose box intersects a query area. Typically used for road segments, zones or obstacles. Flow: new -> preLoad (for each element) -> build -> query / queryNotNested. Queries are Lua iterators usable in a for loop.
--- Access: `require("kdtreebox2d")`
---@class kdtreebox2d
local kdtreebox2d = {}

--- Creates an empty 2D box k-d tree.
---Source: lua/common/kdtreebox2d.lua:106
---@param itemCount integer|nil expected number of elements, to preallocate (optional)
---@return kdTree  empty tree
function kdtreebox2d.new(itemCount) end

--- Object returned by new(). Fields: tree, items, itemCount, nonLeafLimIdx and internal query states.
---@class kdtreebox2d_kdTree
local kdtreebox2d_kdTree = {}

--- Internal: recursive construction of a node; returns the bounding box of the subtree.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/kdtreebox2d.lua:160
---@param axis integer current axis (1 to 4)
---@param left integer start index in items
---@param right integer end index in items
---@param treeIdx integer node index in tree
---@return number  xmin
---@return number  ymin
---@return number  xmax
---@return number  ymax
function kdtreebox2d_kdTree:_build(axis, left, right, treeIdx) end

--- Prints (print) tree statistics: depth, number of nodes, leaves, elements.
---Source: lua/common/kdtreebox2d.lua:275
function kdtreebox2d_kdTree:analytics() end

--- Builds the tree from the loaded elements (recursive median selection alternating the 4 axes).
---Source: lua/common/kdtreebox2d.lua:187
function kdtreebox2d_kdTree:build() end

--- Empties an existing tree to reuse it (useful for frequently updated trees). No effect before build.
---Source: lua/common/kdtreebox2d.lua:122
function kdtreebox2d_kdTree:clear() end

--- Returns a table {tree, nonLeafLimIdx, items, itemCount} (references, no copy) to serialize or reuse it.
---Source: lua/common/kdtreebox2d.lua:138
---@return table  exported data
function kdtreebox2d_kdTree:export() end

--- Replaces the content with data produced by export().
---Source: lua/common/kdtreebox2d.lua:147
---@param kdTreeData table export table
function kdtreebox2d_kdTree:import(kdTreeData) end

--- Adds an element (before build).
---Source: lua/common/kdtreebox2d.lua:154
---@param id any element id returned by the queries
---@param xmin number xmin
---@param ymin number ymin
---@param xmax number xmax
---@param ymax number ymax
function kdtreebox2d_kdTree:preLoad(id, xmin, ymin, xmax, ymax) end

--- Iterator (to use in for) over the ids of the elements intersecting the given box; supports nested queries.
---Source: lua/common/kdtreebox2d.lua:247
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  iterator returning the ids
---@return table  iteration state
function kdtreebox2d_kdTree:query(query_xmin, query_ymin, query_xmax, query_ymax) end

--- Like query but without allocation (reuses the tree's state): do not nest.
---Source: lua/common/kdtreebox2d.lua:261
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  iterator returning the ids
---@return table  iteration state (the tree itself)
function kdtreebox2d_kdTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax) end

return kdtreebox2d
