---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteSpots` : `extensions.load("editor_toolUtilities_siteSpots")`, puis la globale `editor_toolUtilities_siteSpots`
---@class editor_toolUtilities_siteSpots
---@field SPOT_H number
editor_toolUtilities_siteSpots = {}

--- The spots a site's own solver worked out, local to the bake origin.
--- Each one comes in as `{ x, y, yaw, w, d, n, dir }` in the frame the bake is being taken in: where its first bay's centre
--- is, which way a car parked in it faces, how wide and deep a bay is, how many bays the run holds, and which hand the run
--- steps along. Only the position is moved -- the heading stays as it was, and `place` adds the placement's own to it, the
--- same as every other list in a manifest.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:38
---@param list any
---@param ox any
---@param oy any
function editor_toolUtilities_siteSpots.localise(list, ox, oy) end

--- And back: the manifest's spots as `parkingSpot` records, stood where a placement is and turned onto its heading.
--- `ox, oy` is the point in the site's own frame the placement turns about -- the middle of its footprint rather than the
--- bake origin at a corner -- exactly as the marks and the kit are measured. `groundZ` answers the height at a point,
--- because a spot sits on the ground it is on and not at the placement's datum: a lot is graded flat, but its footway and
--- the street outside it are not, and the box has to sit where a car would.
--- No names here. Those have to be unique across the whole level file and are handed out by `write`.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:62
---@param rec any
---@param px any
---@param py any
---@param yaw any
---@param ox any
---@param oy any
---@param groundZ any
function editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ) end

--- Undo a write: put the array back exactly as it was.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:145
---@param undo any
function editor_toolUtilities_siteSpots.restore(undo) end

--- Add spots to the level's sites file, under names starting with `prefix`.
--- Added rather than replacing whatever was there: burning is a one-way handover, so a second burn has to stand beside the
--- first rather than on top of it. Names and ids carry on past whatever the file already holds, so two burns and a
--- hand-authored spot can share the file without colliding.
--- Answers what an undo needs -- the array exactly as it was -- or nothing when there was nothing to add.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:108
---@param spots any
---@param prefix any
function editor_toolUtilities_siteSpots.write(spots, prefix) end

