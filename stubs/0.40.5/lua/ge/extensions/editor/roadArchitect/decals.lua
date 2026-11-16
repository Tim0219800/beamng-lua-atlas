---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/decals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road Architect decal management. For a given road, creates a "decal set": invisible DecalRoads (road_invisible material) per section of road_lane type lanes, used for the navigation graph, plus the visual layers (road, centerline, edges, lane dividers, start/end junction lines) placed as DecalRoads or decal instances via the editor. It keeps the asphalt sections, decals and templates in memory by road name, and can remove everything from the scene.
--- Access: extension `editor_roadArchitect_decals`: `extensions.load("editor_roadArchitect_decals")`, then the global `editor_roadArchitect_decals`
---@class editor_roadArchitect_decals
editor_roadArchitect_decals = {}

--- Creates the decal set of a road: computes the road_lane sections, creates a DecalRoad for each (if road.isDrivable) with left/right lanes, one-way and drivability 1, then the visual layers enabled by the user. The created objects are added to the given folder.
---Source: lua/ge/extensions/editor/roadArchitect/decals.lua:91
---@param road table Road Architect road (name, profile, renderData, isDrivable, isOverObject...).
---@param folder any Folder object (SimGroup) in the scene receiving the created DecalRoads (inferred from code: calls folder:addObject).
function editor_roadArchitect_decals.createDecal(road, folder) end

--- Deletes all decal templates (the instances must already have been deleted) and empties the template tables.
---Source: lua/ge/extensions/editor/roadArchitect/decals.lua:477
function editor_roadArchitect_decals.removeTemplates() end

--- Tries to remove the decal set with this name from the scene: deletes the main DecalRoads, the DecalRoad layers and the decal instances, then empties the associated tables. No effect if the name is unknown.
---Source: lua/ge/extensions/editor/roadArchitect/decals.lua:447
---@param name string Name of the road whose decals are removed.
function editor_roadArchitect_decals.tryRemove(name) end

--- Removes all known decal sets from the scene (asphalt, then decals), empties the tables, then deletes the templates.
---Source: lua/ge/extensions/editor/roadArchitect/decals.lua:488
function editor_roadArchitect_decals.tryRemoveAll() end

