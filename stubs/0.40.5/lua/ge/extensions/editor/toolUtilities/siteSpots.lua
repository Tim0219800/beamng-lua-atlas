---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parking spaces as a site carries them and as the level rereads them in its sites file. A space is neither geometry nor paint: it is a box the game looks for when it wants to park a car. It therefore does not go into a shell, but into the level's city.sites.json (parkingSpots field), the only output of a site bake that is not a file of its own. It waits for the "burn": baked locally and written at that time, the copies of a parking lot each have their spaces at their place and at their height.
--- Access: extension `editor_toolUtilities_siteSpots`: `extensions.load("editor_toolUtilities_siteSpots")`, then the global `editor_toolUtilities_siteSpots`
---@class editor_toolUtilities_siteSpots
---@field SPOT_H number Height of a space's box, in meters (3).
editor_toolUtilities_siteSpots = {}

--- The spaces computed by a site's solver, local to the bake origin. Each space enters in the form { x, y, yaw, w, d, n, dir } and comes out rounded to the millimeter, n and dir omitted for a simple right-hand space. Returns nil if the list is empty.
---Source: lua/ge/extensions/editor/toolUtilities/siteSpots.lua:38
---@param list table|nil List of spaces { x, y, yaw, w, d, n, dir }.
---@param ox number|nil x of the origin (default 0).
---@param oy number|nil y of the origin (default 0).
---@return table|nil  List of local spaces.
function editor_toolUtilities_siteSpots.localise(list, ox, oy) end

--- The inverse: the manifest's spaces as parkingSpot records (pos, rot, scl = {width, depth, SPOT_H}, isMultiSpot, spotAmount, spotOffset, spotDirection, spotRotation, color, customFields), placed where a placement is and rotated to its heading. (ox, oy) is the site's pivot (middle of its footprint). groundZ(x, y) gives the ground height, because a space rests on the ground where it is and not on the placement's frame. No name here: they must be unique across the whole level file and are assigned by write.
---Source: lua/ge/extensions/editor/toolUtilities/siteSpots.lua:62
---@param rec table|nil Manifest spaces.
---@param px number x of the placement.
---@param py number y of the placement.
---@param yaw number|nil Heading in radians (default 0).
---@param ox number|nil x of the pivot (default 0).
---@param oy number|nil y of the pivot (default 0).
---@param groundZ function|nil groundZ(x, y) returns the ground height (0 if absent).
---@return table|nil  List of parkingSpot records, nil if empty.
function editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ) end

--- Undoes a write: puts the parkingSpots array back exactly as it was.
---Source: lua/ge/extensions/editor/toolUtilities/siteSpots.lua:145
---@param undo table|nil Table returned by write.
function editor_toolUtilities_siteSpots.restore(undo) end

--- Adds spaces to the level's sites file, under names starting with prefix, keeping what exists. Writes the file with jsonWriteFile.
---Source: lua/ge/extensions/editor/toolUtilities/siteSpots.lua:108
---@param spots table|nil parkingSpot records returned by place; their name and oldId are filled in by this call.
---@param prefix string Prefix of the space names.
---@return table|nil  { path, prev }: what is needed to undo (the array as it was), or nil if there was nothing to add.
function editor_toolUtilities_siteSpots.write(spots, prefix) end

