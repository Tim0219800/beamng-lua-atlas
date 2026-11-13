---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteLights` : `extensions.load("editor_toolUtilities_siteLights")`, puis la globale `editor_toolUtilities_siteLights`
---@class editor_toolUtilities_siteLights
---@field TONES table
editor_toolUtilities_siteLights = {}

--- Point an existing light at a record. `lt` is { px, py, pz, glow or col, brightness, radius } for a bulb, plus
--- { dx, dy, dz, cone } for a flood; the class (PointLight / SpotLight) is fixed at creation, so it has to match.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:108
---@param obj any
---@param lt any
function editor_toolUtilities_siteLights.apply(obj, lt) end

--- Called every frame by each tool that spawns lights. Cheap until something is owed.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:57
function editor_toolUtilities_siteLights.flush() end

--- The environment switches night lights off a scan it caches, and that scan walks every static in the level: seconds, on a
--- built-up map. So a light just spawned (or a lit lens just marked) is not handed to it. Given the object, it is set to the
--- environment's day or night here, and kept in step with it until a rescan takes it in. Without one, the cache is
--- rescanned once the edits have settled -- which a light being deleted does not need: the environment skips one that has gone.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:49
---@param obj any
function editor_toolUtilities_siteLights.markDirty(obj) end

--- One light object for a record. A nil name leaves it unnamed, which registers ~3 ms faster; the environment's dusk pass
--- keys lights by id, so an unnamed one still switches. A record carrying a direction gets a SpotLight, one without gets a PointLight.
--- A record with `always` is lit day and night (a tunnel is dark at noon) and kept out of all day/night switching.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:135
---@param folder any
---@param name any
---@param lt any
function editor_toolUtilities_siteLights.spawn(folder, name, lt) end

