---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/rdp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_rdp` : `extensions.load("editor_toolUtilities_rdp")`, puis la globale `editor_toolUtilities_rdp`
---@class editor_toolUtilities_rdp
editor_toolUtilities_rdp = {}

--- Performs a Ramer-Douglas-Peucker (RDP) simplification of the given polyline.
---  [Uses line segment instead of infinite line].
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:24
---@param nodes any
---@param startIdx any
---@param endIdx any
---@param tol any
---@param retListP any
function editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP) end

--- Simplifies the given nodes, in place.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:69
---@param nodes any
---@param tol any
function editor_toolUtilities_rdp.simplifyNodes(nodes, tol) end

--- Simplifies the given nodes (and their corresponding velocities), in place.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:140
---@param nodes any
---@param velocities any
---@param tol any
function editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol) end

--- Simplifies the given nodes (and their corresponding widths), in place.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:92
---@param nodes any
---@param widths any
---@param tol any
function editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol) end

--- Simplifies the given nodes (and their corresponding widths and normal vectors), in place.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:116
---@param nodes any
---@param widths any
---@param normals any
---@param tol any
function editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol) end

--- Simplifies the given nodes (and their corresponding widths, velocities and velocity limits), in place.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:164
---@param nodes any
---@param widths any
---@param velocities any
---@param velLimits any
---@param tol any
function editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol) end

