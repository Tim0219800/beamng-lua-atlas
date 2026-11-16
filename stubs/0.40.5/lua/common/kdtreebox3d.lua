---@meta
-- tim19Atlas stub generated from lua/common/kdtreebox3d.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- K-d tree for 3D boxes (xmin, ymin, zmin, xmax, ymax, zmax), i.e. 6 dimensions. Allows quick retrieval of all the elements whose box intersects a query box. Same API as kdtreebox2d in 3D: new -> preLoad -> build -> query/queryNotNested; export/import to reuse a tree.
--- Access: `require("kdtreebox3d")`
---@class kdtreebox3d
local kdtreebox3d = {}

--- Creates an empty 3D box k-d tree.
---Source: lua/common/kdtreebox3d.lua:115
---@param itemCount integer|nil expected number of elements (preallocation, optional)
---@return kdTree  empty tree
function kdtreebox3d.new(itemCount) end

--- Object returned by new().
---@class kdtreebox3d_kdTree
local kdtreebox3d_kdTree = {}

--- Internal: recursive construction of a node.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/kdtreebox3d.lua:158
---@param axis integer current axis
---@param left integer start index in items
---@param right integer end index
---@param treeIdx integer node index
function kdtreebox3d_kdTree:_build(axis, left, right, treeIdx) end

--- Prints (print) tree statistics.
---Source: lua/common/kdtreebox3d.lua:284
function kdtreebox3d_kdTree:analytics() end

--- Builds the tree (recursive median alternating the axes) from the loaded elements.
---Source: lua/common/kdtreebox3d.lua:192
function kdtreebox3d_kdTree:build() end

--- Returns the tree data (references) for serialization/reuse.
---Source: lua/common/kdtreebox3d.lua:130
---@return table  exported data
function kdtreebox3d_kdTree:export() end

--- Loads data produced by export().
---Source: lua/common/kdtreebox3d.lua:139
---@param kdTreeData table export table
function kdtreebox3d_kdTree:import(kdTreeData) end

--- Adds an element (before build).
---Source: lua/common/kdtreebox3d.lua:146
---@param id any id returned by the queries
---@param xmin number xmin
---@param ymin number ymin
---@param zmin number zmin
---@param xmax number xmax
---@param ymax number ymax
---@param zmax number zmax
function kdtreebox3d_kdTree:preLoad(id, xmin, ymin, zmin, xmax, ymax, zmax) end

--- Iterator over the ids of the elements whose box intersects the query box; nesting possible.
---Source: lua/common/kdtreebox3d.lua:254
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  iterator returning the ids
---@return table  iteration state
function kdtreebox3d_kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

--- Like query without allocation; nesting forbidden.
---Source: lua/common/kdtreebox3d.lua:268
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  iterator returning the ids
---@return table  iteration state (the tree)
function kdtreebox3d_kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

return kdtreebox3d
