---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/terraform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_terraform` : `extensions.load("editor_roadArchitect_terraform")`, puis la globale `editor_roadArchitect_terraform`
---@class editor_roadArchitect_terraform
editor_roadArchitect_terraform = {}

--- Conforms the local terrain to the road.
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:303
---@param rIdx any
---@param DOI any
---@param margin any
function editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin) end

--- Returns the road masks for the given road group (roads only and roads + margins).
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:672
---@param DOI any
---@param margin any
---@param group any
function editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group) end

--- Imports a terrain from the given path.
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:632
---@param path any
function editor_roadArchitect_terraform.setHeightmapFromPng(path) end

--- Terraforms the whole terrain block to the existing road network (or the group with the given index).
---  [Does not include overlays or bridges].
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:451
---@param DOI any
---@param margin any
---@param group any
function editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group) end

--- Saves the heightmap to the given .png file.
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:604
---@param path any
function editor_roadArchitect_terraform.writeHeightmapToPng(path) end

