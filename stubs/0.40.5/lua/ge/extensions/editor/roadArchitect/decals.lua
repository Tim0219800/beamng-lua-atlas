---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/decals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_decals` : `extensions.load("editor_roadArchitect_decals")`, puis la globale `editor_roadArchitect_decals`
---@class editor_roadArchitect_decals
editor_roadArchitect_decals = {}

--- Creates a decal set for the given road.
---  [A decal set contains the main road decal, the centerline decal, road edge decals, lane division decals, and start/end junction line decals].
---  [The user can control the combination of these which will be rendered for the road, using the appropriate Imgui buttons].
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:91
---@param road any
---@param folder any
function editor_roadArchitect_decals.createDecal(road, folder) end

--- Remove all the templates (all instances should be removed first).
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:477
function editor_roadArchitect_decals.removeTemplates() end

--- Attempts to removes the decal set with the given name, from the scene (if it exists).
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:447
---@param name any
function editor_roadArchitect_decals.tryRemove(name) end

--- Attemps to remove all decal sets from the scene.
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:488
function editor_roadArchitect_decals.tryRemoveAll() end

