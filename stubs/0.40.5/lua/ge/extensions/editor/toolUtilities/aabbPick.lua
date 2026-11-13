---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/aabbPick.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_aabbPick` : `extensions.load("editor_toolUtilities_aabbPick")`, puis la globale `editor_toolUtilities_aabbPick`
---@class editor_toolUtilities_aabbPick
editor_toolUtilities_aabbPick = {}

--- Nearest box the ray (origin o*, dir d*) enters, chosen by entry distance. `provider(visit)` must call
---  visit(id, minx, miny, minz, maxx, maxy, maxz) once per candidate box. Returns the winning id (or nil) and its distance.
---Source : lua/ge/extensions/editor/toolUtilities/aabbPick.lua:49
---@param ox any
---@param oy any
---@param oz any
---@param dx any
---@param dy any
---@param dz any
---@param provider any
function editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider) end

--- Ray (origin o*, direction d*, d need not be normalized) vs AABB [min*, max*]. Returns the entry distance t along the ray
---  (>= 0) if it hits, else nil. Standard slab method; a ray starting inside the box returns 0.
---Source : lua/ge/extensions/editor/toolUtilities/aabbPick.lua:16
---@param ox any
---@param oy any
---@param oz any
---@param dx any
---@param dy any
---@param dz any
---@param minx any
---@param miny any
---@param minz any
---@param maxx any
---@param maxy any
---@param maxz any
function editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz) end

