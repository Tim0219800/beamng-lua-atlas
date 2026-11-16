---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/rdp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Optimized implementation of the Ramer-Douglas-Peucker (RDP) algorithm to simplify polylines with too many points. Uses the distance to the segment (not to the infinite line), an explicit stack instead of recursion and reused tables. The simplifyNodes* variants compact the arrays in place, including parallel arrays (widths, normals, velocities, speed limits).
--- Access: extension `editor_toolUtilities_rdp`: `extensions.load("editor_toolUtilities_rdp")`, then the global `editor_toolUtilities_rdp`
---@class editor_toolUtilities_rdp
editor_toolUtilities_rdp = {}

--- Computes the indices to keep by RDP between startIdx and endIdx. The output table is emptied then filled; the order is not strictly increasing because of the stack, but the first index is startIdx.
---Source: lua/ge/extensions/editor/toolUtilities/rdp.lua:24
---@param nodes table List of vec3.
---@param startIdx integer Start index (1 for the whole path).
---@param endIdx integer End index.
---@param tol number Maximum tolerated distance to the segment.
---@param retListP table|nil Reusable output table; created if nil.
---@return table  List of kept indices.
function editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP) end

--- Simplifies nodes in place and removes the excess points.
---Source: lua/ge/extensions/editor/toolUtilities/rdp.lua:69
---@param nodes table List of vec3, modified.
---@param tol number|nil Tolerance (default 6.0).
---@return integer  Number of remaining points.
function editor_toolUtilities_rdp.simplifyNodes(nodes, tol) end

--- Like simplifyNodes, keeping velocities aligned with nodes.
---Source: lua/ge/extensions/editor/toolUtilities/rdp.lua:140
---@param nodes table Points.
---@param velocities table Associated velocities.
---@param tol number|nil Tolerance (default 6.0).
---@return integer  Number of remaining points.
function editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol) end

--- Like simplifyNodes, keeping the widths array aligned with nodes.
---Source: lua/ge/extensions/editor/toolUtilities/rdp.lua:92
---@param nodes table Points, modified in place.
---@param widths table Associated widths, modified in place.
---@param tol number|nil Tolerance (default 6.0).
---@return integer  Number of remaining points.
function editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol) end

--- Like simplifyNodes, keeping widths and normals aligned with nodes.
---Source: lua/ge/extensions/editor/toolUtilities/rdp.lua:116
---@param nodes table Points.
---@param widths table Widths.
---@param normals table Normals.
---@param tol number|nil Tolerance (default 6.0).
---@return integer  Number of remaining points.
function editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol) end

--- Like simplifyNodes, keeping widths, velocities and velLimits aligned with nodes.
---Source: lua/ge/extensions/editor/toolUtilities/rdp.lua:164
---@param nodes table Points.
---@param widths table Widths.
---@param velocities table Speeds.
---@param velLimits table Speed limits.
---@param tol number|nil Tolerance (default 6.0).
---@return integer  Number of remaining points.
function editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol) end

