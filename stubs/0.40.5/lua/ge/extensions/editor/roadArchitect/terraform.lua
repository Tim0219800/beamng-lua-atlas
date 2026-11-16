---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/terraform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modifies the terrain (TerrainBlock) to fit the Road Architect roads: flattens the terrain under a road or road network (with a domain of influence and a margin), computes road masks, and imports/exports the heightmap as a 16-bit PNG. Used by the Road Architect UI and by road network imports. All functions return without doing anything if the scene has no TerrainBlock (e.g. smallgrid).
--- Access: extension `editor_roadArchitect_terraform`: `extensions.load("editor_roadArchitect_terraform")`, then the global `editor_roadArchitect_terraform`
---@class editor_roadArchitect_terraform
editor_roadArchitect_terraform = {}

--- Flattens the local terrain so that it hugs a road: computes the road's quads, a mask and fixed heights, averages with the neighbors then writes the terrain. The extent is the road's 2D box enlarged by the DOI.
---Source: lua/ge/extensions/editor/roadArchitect/terraform.lua:303
---@param rIdx integer Index of the road in roads.
---@param DOI number Domain of influence (fade distance), in meters, minimum 5.
---@param margin number Margin around the road (inferred from code: mask dilation).
function editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin) end

--- Computes two masks on the terrain grid: a mask of the roads alone (value 65535 where a road covers the point, dilated by 1 cell) and a roads + margin mask (dilation by margin).
---Source: lua/ge/extensions/editor/roadArchitect/terraform.lua:672
---@param DOI number Domain of influence, in meters (minimum 5); used to extend the search box.
---@param margin integer Number of dilation cells of the margin mask (inferred from code).
---@param group table|nil Placed group, or nil for all roads.
---@return table<integer, table<integer, number>>|nil  Road mask indexed [x][y] (0 or 65535); nil if there is no terrain.
---@return table<integer, table<integer, number>>  Roads + margin mask.
function editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group) end

--- Applies a PNG heightmap to the terrain (cell by cell) then updates the TerrainBlock grid.
---Source: lua/ge/extensions/editor/roadArchitect/terraform.lua:632
---@param path string Path of the PNG.
function editor_roadArchitect_terraform.setHeightmapFromPng(path) end

--- Shapes the terrain over the whole road network, or over the indicated group. First recomputes all renderData. Includes neither overlays nor bridges.
---Source: lua/ge/extensions/editor/roadArchitect/terraform.lua:451
---@param DOI number Domain of influence, in meters (minimum 5).
---@param margin number Margin around the roads (inferred from code).
---@param group table|nil Placed group, or nil for the whole network.
function editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group) end

--- Saves the terrain heightmap to a 16-bit PNG file (negative heights clamped to 0).
---Source: lua/ge/extensions/editor/roadArchitect/terraform.lua:604
---@param path string Path of the .png file to write.
---@return table|nil  {} if there is no terrain, otherwise nil.
function editor_roadArchitect_terraform.writeHeightmapToPng(path) end

