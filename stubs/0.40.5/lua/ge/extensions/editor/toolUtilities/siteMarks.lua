---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteMarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteMarks` : `extensions.load("editor_toolUtilities_siteMarks")`, puis la globale `editor_toolUtilities_siteMarks`
---@class editor_toolUtilities_siteMarks
editor_toolUtilities_siteMarks = {}

--- A whole plan painted at once. Answers the objects made, so whoever asked can hand them over or take them down again.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:54
---@param plan any
---@param folder any
---@param terrainZ any
function editor_toolUtilities_siteMarks.build(plan, folder, terrainZ) end

--- Hand the marks to the level. Painted by the tool they belong to nothing and are not written out; from here they are the
--- level's own, and the tool must not delete them.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:66
---@param objs any
function editor_toolUtilities_siteMarks.commit(objs) end

--- One DecalRoad, from the record that describes it.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:20
---@param folder any
---@param rec any
---@param terrainZ any
function editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ) end

--- The plan as a manifest carries it, local to the bake origin.
--- Grouped by style, because a lot paints a thousand marks in about four of them -- one for the white bay grid, one for the
--- yellow reserved boxes, one for the hatching, one for the give-way bars. Saying which of the four each run is in costs an
--- index where saying it in full would cost five fields a thousand times over.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:82
---@param plan any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz) end

--- And back: the manifest's marks as a plan, stood where a placement is and turned onto its heading.
--- `ox, oy` is the point in the site's own frame the placement turns about -- the middle of its footprint rather than the
--- bake origin at a corner. The same two numbers everything else a placement stands is measured off. `pz` is the height
--- the placement sits at, which only the marks laid on one of its own slabs need.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:129
---@param rec any
---@param px any
---@param py any
---@param yaw any
---@param ox any
---@param oy any
---@param pz any
function editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz) end

