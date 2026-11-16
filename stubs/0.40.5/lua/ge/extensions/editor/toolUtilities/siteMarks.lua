---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteMarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road markings as a site carries them: parking space lines, hatching, give-way bars, aisle centerlines, tire wear tracks, cracks and zebra crossings. Each is a DecalRoad, that is, paint laid ON the ground and not geometry: nothing goes into a shell, so a baked parking lot carries what needs painting and repaints it where it is placed (same arrangement as for water). The module creates the DecalRoads, converts the plan to/from the manifest format and puts them back into the level.
--- Access: extension `editor_toolUtilities_siteMarks`: `extensions.load("editor_toolUtilities_siteMarks")`, then the global `editor_toolUtilities_siteMarks`
---@class editor_toolUtilities_siteMarks
editor_toolUtilities_siteMarks = {}

--- Paints a whole plan at once. Returns the objects created, so that the requester can put them back into the level or remove them. Empty list if plan or folder is missing.
---Source: lua/ge/extensions/editor/toolUtilities/siteMarks.lua:54
---@param plan table|nil List of mark records.
---@param folder userdata|nil Parent scene group.
---@param terrainZ function terrainZ(x, y) returns the terrain height.
---@return table  List of created DecalRoads.
function editor_toolUtilities_siteMarks.build(plan, folder, terrainZ) end

--- Puts the marks back into the level. Painted by the tool, they belonged to nothing and were not written; from then on they are the level's and the tool must no longer delete them.
---Source: lua/ge/extensions/editor/toolUtilities/siteMarks.lua:66
---@param objs table|nil DecalRoads returned by build.
function editor_toolUtilities_siteMarks.commit(objs) end

--- Creates a DecalRoad from its record and adds it to folder. Each node is at terrain height (or rec.z for a mark on a slab) plus lift; if closed, the first point is added again at the end. Returns nil if there are fewer than 2 points or if creation fails.
---Source: lua/ge/extensions/editor/toolUtilities/siteMarks.lua:20
---@param folder userdata Parent scene group.
---@param rec table Mark record.
---@param terrainZ function terrainZ(x, y) returns the terrain height.
---@return userdata|nil  DecalRoad object.
function editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ) end

--- The plan as a manifest carries it, local to the bake origin. Returns { styles, runs } or nil if nothing. Each run: { s = style index, pts = flat, closed, fade, w (per-node widths) }.
---Source: lua/ge/extensions/editor/toolUtilities/siteMarks.lua:82
---@param plan table|nil List of mark records.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@param oz number|nil z of the origin (for marks on a slab).
---@return table|nil  { styles = {...}, runs = {...} }.
function editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz) end

--- The inverse: the manifest's marks as a plan, placed where a placement is and rotated to its heading. (ox, oy) is the point of the site's frame around which the placement rotates (the middle of its footprint, not the bake origin in a corner). pz is the placement height, useful only for marks placed on one of its own slabs.
---Source: lua/ge/extensions/editor/toolUtilities/siteMarks.lua:129
---@param rec table|nil Manifest record { styles, runs }.
---@param px number x of the placement.
---@param py number y of the placement.
---@param yaw number|nil Heading in radians (default 0).
---@param ox number|nil x of the pivot (default 0).
---@param oy number|nil y of the pivot (default 0).
---@param pz number|nil Placement height (default 0).
---@return table|nil  Mark plan in world coordinates, nil if empty.
function editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz) end

