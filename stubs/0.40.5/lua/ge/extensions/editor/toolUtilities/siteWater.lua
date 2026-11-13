---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteWater.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteWater` : `extensions.load("editor_toolUtilities_siteWater")`, puis la globale `editor_toolUtilities_siteWater`
---@class editor_toolUtilities_siteWater
editor_toolUtilities_siteWater = {}

--- Flood whatever the centrepiece put down, then hang a sheet off each face of every bowl that spills. `tag` names the
--- site standing it, so two of the same square on one map do not fight over object names. Returns the ids and the names.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:305
---@param ca any
---@param folder any
---@param tag any
function editor_toolUtilities_siteWater.build(ca, folder, tag) end

--- Flip every pool to persistent and hand back its names, which is what a burn's undo deletes by.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:338
---@param ids any
function editor_toolUtilities_siteWater.commit(ids) end

--- The record a manifest carries, in the site's own frame. Only what `build` reads: the editor's centrepiece knows a
--- great deal more about itself -- its apron, its grab handles, its balustrade -- and none of that is water.
--- The one anchor and the one angle are the whole of the placement. Everything else is a radius, a half-width or a
--- height off that anchor, so a site turned on the ground turns its water simply by turning those two.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:356
---@param ca any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteWater.localise(ca, ox, oy, oz) end

--- And back the other way: a manifest record stood at a place, on a heading, ready for `build`. The turn is the site's,
--- so the anchor swings round the placement and the grain takes the yaw straight on top of its own.
--- `ox, oy` is the point in the site's own frame that the placement turns about -- the middle of its footprint rather than
--- the bake origin at a corner. Everything else a placement stands is measured off the same two numbers.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:391
---@param rec any
---@param px any
---@param py any
---@param pz any
---@param yaw any
---@param ox any
---@param oy any
function editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy) end

--- Everything wet under one folder, off. Swept by class rather than by a list of ids kept somewhere, because undo
--- restores a document whose ids belong to objects that have since been deleted: what is actually in the folder is the
--- only account of it that cannot go stale.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:293
---@param folder any
function editor_toolUtilities_siteWater.remove(folder) end

