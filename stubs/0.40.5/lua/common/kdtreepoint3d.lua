---@meta
-- tim19Atlas stub generated from lua/common/kdtreepoint3d.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- K-d tree for 3D points. Offers two kinds of queries: the points in a box (query / queryNotNested, iterators) and the nearest point to a given point (findNearest). Typical for finding the road node or object nearest to a position. Flow: new -> preLoad -> build -> queries.
--- Access: `require("kdtreepoint3d")`
---@class kdtreepoint3d
local kdtreepoint3d = {}

--- Creates an empty 3D point k-d tree.
---Source: lua/common/kdtreepoint3d.lua:105
---@param itemCount integer|nil expected number of points (preallocation, optional)
---@return kdTree  empty tree
function kdtreepoint3d.new(itemCount) end

--- Object returned by new().
---@class kdtreepoint3d_kdTree
local kdtreepoint3d_kdTree = {}

--- Internal: recursive construction of a node.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/kdtreepoint3d.lua:143
---@param axis integer current axis
---@param left integer start in items
---@param right integer end in items
---@param treeIdx integer node index
function kdtreepoint3d_kdTree:_build(axis, left, right, treeIdx) end

--- Prints (print) tree statistics.
---Source: lua/common/kdtreepoint3d.lua:309
function kdtreepoint3d_kdTree:analytics() end

--- Builds the tree from the loaded points.
---Source: lua/common/kdtreepoint3d.lua:175
function kdtreepoint3d_kdTree:build() end

--- Returns the tree data (references) for reuse.
---Source: lua/common/kdtreepoint3d.lua:121
---@return table  exported data
function kdtreepoint3d_kdTree:export() end

--- Finds the point nearest to (x, y, z) and returns its id and the Euclidean distance.
---Source: lua/common/kdtreepoint3d.lua:262
---@param x number x
---@param y number y
---@param z number z
---@return any  id of the nearest point
---@return number  distance
function kdtreepoint3d_kdTree:findNearest(x, y, z) end

--- Loads data produced by export().
---Source: lua/common/kdtreepoint3d.lua:130
---@param kdTreeData table export table
function kdtreepoint3d_kdTree:import(kdTreeData) end

--- Adds a point (before build).
---Source: lua/common/kdtreepoint3d.lua:137
---@param id any id returned by the queries
---@param x number x
---@param y number y
---@param z number z
function kdtreepoint3d_kdTree:preLoad(id, x, y, z) end

--- Iterator over the ids of the points located in the query box; nesting possible.
---Source: lua/common/kdtreepoint3d.lua:233
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  iterator returning the ids
---@return table  iteration state
function kdtreepoint3d_kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

--- Like query without allocation; do not nest.
---Source: lua/common/kdtreepoint3d.lua:247
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  iterator returning the ids
---@return table  iteration state (the tree)
function kdtreepoint3d_kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

return kdtreepoint3d
