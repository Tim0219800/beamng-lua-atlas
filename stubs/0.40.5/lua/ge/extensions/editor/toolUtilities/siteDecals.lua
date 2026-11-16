---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteDecals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stamped decals as a site carries them: traffic arrows, painted EXIT text, asphalt repair patches. They are glyphs taken from a sheet (atlas) and placed at a point, oriented in a direction, and not paint traced along a line (which is what distinguishes them from siteMarks). The module creates the DecalData (templates), places the instances via the editor, converts them to/from the manifest format and makes them persistent.
--- Access: extension `editor_toolUtilities_siteDecals`: `extensions.load("editor_toolUtilities_siteDecals")`, then the global `editor_toolUtilities_siteDecals`
---@class editor_toolUtilities_siteDecals
editor_toolUtilities_siteDecals = {}

--- Stamps a whole plan at once, creating the required templates. tag distinguishes these templates from those of other sites. Returns the instances and the template identifiers, two things to clean up differently: an instance goes with the site, a template is shared by all the site's decals.
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:90
---@param plan table|nil List of decal records.
---@param tag string Site label.
---@param terrainZ function terrainZ(x, y) returns the terrain height.
---@return table  Decal instances.
---@return integer[]  Identifiers of the DecalData templates created.
function editor_toolUtilities_siteDecals.build(plan, tag, terrainZ) end

--- Gives the templates to the level, which makes the decals placed from them survive the save: the persistence manager keeps the instances against their template, so marking the few templates "dirty" writes all the decals. No effect if decalPersistMan does not exist.
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:119
---@param tplIds integer[]|nil Template identifiers returned by build.
function editor_toolUtilities_siteDecals.commit(tplIds) end

--- Places a decal from its record: position (x, y) at terrain height plus lift, normal pointing up, tangent directed according to angle a.
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:36
---@param tpl userdata DecalData template.
---@param rec table { x, y, a, size, frame, lift }.
---@param terrainZ function terrainZ(x, y) returns the terrain height.
---@return any  Decal instance returned by editor.addDecalInstanceWithTan.
function editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ) end

--- Heading angle of a decal (atan2(ty, tx)) from the direction vector a builder already has.
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:130
---@param tx number x component of the direction.
---@param ty number y component of the direction.
---@return number  Angle in radians.
function editor_toolUtilities_siteDecals.facing(tx, ty) end

--- Converts a decal plan to the manifest format, local to the bake origin (ox, oy). Grouped by template (same mat, rows, cols, prio). Returns nil if the plan is empty.
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:49
---@param plan table|nil List of decal records.
---@param ox number x of the bake origin.
---@param oy number y of the bake origin.
---@return table|nil  { tpls = { {mat, rows, cols, prio, size}, ... }, items = { {t, x, y, a, size, frame, lift}, ... } }.
function editor_toolUtilities_siteDecals.localise(plan, ox, oy) end

--- The inverse of localise: the manifest's decals as a plan, placed where a placement is and rotated to its heading. (ox, oy) is the point of the site's frame around which the placement rotates.
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:69
---@param rec table|nil Manifest record { tpls, items }.
---@param px number x of the placement.
---@param py number y of the placement.
---@param yaw number|nil Heading in radians (default 0).
---@param ox number|nil x of the pivot in the site's frame (default 0).
---@param oy number|nil y of the pivot (default 0).
---@return table|nil  Decal plan in world coordinates, or nil if empty.
function editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy) end

--- Removes placed decals (editor.deleteDecalInstance).
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:110
---@param objs table|nil Instances returned by build.
function editor_toolUtilities_siteDecals.remove(objs) end

--- Gets or creates the DecalData of a decal group, named after the site that stands it up. Fields set: material, frame, texRows, texCols, size, renderPriority (default 5).
---Source: lua/ge/extensions/editor/toolUtilities/siteDecals.lua:20
---@param name string Object name of the template.
---@param spec table { mat, frame, rows, cols, size, prio }.
---@return userdata|nil  DecalData object, or nil if creation fails.
function editor_toolUtilities_siteDecals.template(name, spec) end

