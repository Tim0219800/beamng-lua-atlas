---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/terrainPainter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Paints the terrain material under a spline (road) and allows undoing. Computes the road footprint (actual deck edge for mesh roads, otherwise centerline and widths per station), pushes this outline out by group.paintMargin, fills the polygon by scanlines and stores the original materials in the group so they can be restored. Goes through editor_terrainEditor (terrain block and terrain editor).
--- Access: extension `editor_toolUtilities_terrainPainter`: `extensions.load("editor_toolUtilities_terrainPainter")`, then the global `editor_toolUtilities_terrainPainter`
---@class editor_toolUtilities_terrainPainter
editor_toolUtilities_terrainPainter = {}

--- Paints the given spline: first computes its footprint then paints it, with the material group.paintMaterialIdx. Stores coordinates, old values and box in the group.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:143
---@param group table Spline group (nodes, divPoints, binormals, divWidths, meshEdgeL/R, paintMargin, paintMaterialIdx, paintedData*).
---@param runs table|nil Pairs of divPoints indices { i0, i1 }: only these sections, in a single record. Default is the whole road.
function editor_toolUtilities_terrainPainter.paint(group, runs) end

--- Paints a closed polygon in world XY with the given terrain material, recording in `store` what was there so it can be put back. Updates the terrain grid (updateGridMaterials, updateGrid).
---Source: lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:83
---@param store table Table that receives paintedDataX, paintedDataY, paintedDataVals and the paintedDataBox* bounds.
---@param poly table List of polygon points (x, y), at least 3.
---@param materialIdx integer|nil Terrain material index (1 by default).
---@param skip function|nil skip(x, y) is queried for each point; if true the ground is left as is.
function editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip) end

--- Puts back the state from before the paint: restores the material indices, updates the grid, clears the group's painted data.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:179
---@param group table Painted group.
function editor_toolUtilities_terrainPainter.revert(group) end

--- Undoes the terrain painting for all groups.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:207
---@param groups table List of groups.
function editor_toolUtilities_terrainPainter.revertAll(groups) end

