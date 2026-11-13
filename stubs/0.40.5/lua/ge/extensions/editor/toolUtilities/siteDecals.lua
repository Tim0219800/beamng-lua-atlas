---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteDecals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteDecals` : `extensions.load("editor_toolUtilities_siteDecals")`, puis la globale `editor_toolUtilities_siteDecals`
---@class editor_toolUtilities_siteDecals
editor_toolUtilities_siteDecals = {}

--- A whole plan stamped at once, making whatever templates it calls for. `tag` names them apart from every other site's.
--- Answers the instances and the template ids, which are two different things to clean up: an instance goes when the site
--- does, a template is shared by all of that site's stamps.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:90
---@param plan any
---@param tag any
---@param terrainZ any
function editor_toolUtilities_siteDecals.build(plan, tag, terrainZ) end

--- Hand the templates to the level, which is what makes the stamps off them survive a save. The persistence manager keeps
--- the instances against their template, so marking the few templates dirty writes out all the stamps -- there is nothing
--- per-stamp to flip. Per-site templates are what keeps this from writing out a neighbour's stamps too.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:119
---@param tplIds any
function editor_toolUtilities_siteDecals.commit(tplIds) end

--- One stamp, from the record that describes it.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:36
---@param tpl any
---@param rec any
---@param terrainZ any
function editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ) end

--- The facing of a stamp, as an angle, from the direction vector a builder already has.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:130
---@param tx any
---@param ty any
function editor_toolUtilities_siteDecals.facing(tx, ty) end

--- The stamps as a manifest carries them, local to the bake origin. Grouped by template for the same reason the marks are
--- grouped by style: a lot stamps a few dozen glyphs off two sheets.
--- The facing is written down as an angle rather than the direction vector it came in as, so standing the site on a new
--- heading is one addition instead of a rotation per stamp.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:49
---@param plan any
---@param ox any
---@param oy any
function editor_toolUtilities_siteDecals.localise(plan, ox, oy) end

--- And back: the manifest's stamps as a plan, stood where a placement is and turned onto its heading. `ox, oy` is the point
--- in the site's own frame the placement turns about, the same one everything else it stands is measured off.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:69
---@param rec any
---@param px any
---@param py any
---@param yaw any
---@param ox any
---@param oy any
function editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy) end

--- Take the stamps down again.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:110
---@param objs any
function editor_toolUtilities_siteDecals.remove(objs) end

--- Get, or make, the DecalData one group of stamps comes off. Named after the site standing it, because burning a site
--- flips its own templates to persistent and must not flip a neighbour's.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:20
---@param name any
---@param spec any
function editor_toolUtilities_siteDecals.template(name, spec) end

