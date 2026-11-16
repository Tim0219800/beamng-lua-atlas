---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/occupancy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Coarse 2D occupancy grid (1 m cells) shared by bridge pier clearance and vegetation clearance. Roads (groups with divPoints/binormals) and junctions are supplied to rebuild; the Rail Network posts its tracks and junctions via setRail; everything is stamped together, along with static obstacles (rivers, buildings, fences, lakes), terrain claimed by other tools (groundClaims) and a layer specific to plants (setPlantKeepOut). Each cell keeps an owner (string), or false if several share it. The queries (occupiedAt, transportAt, blocked, overhangAt...) answer "is there something here".
--- Access: extension `editor_toolUtilities_occupancy`: `extensions.load("editor_toolUtilities_occupancy")`, then the global `editor_toolUtilities_occupancy`
---@class editor_toolUtilities_occupancy
editor_toolUtilities_occupancy = {}

--- True if a cell of the axis-aligned footprint belongs to an owner outside the cluster. pass(owner), if provided, lets other owners through.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:629
---@param cluster table Cluster (with _pierAllow cached); see railCluster.
---@param x number x of the center.
---@param y number y of the center.
---@param halfX number Half-extent in x.
---@param halfY number Half-extent in y.
---@param pass function|nil pass(owner) returns true to tolerate this owner.
---@return boolean  true if the footprint is blocked.
function editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass) end

--- True if a BUILDING cell (owner 'b', stamped footprint + 1 m) lies within the radius.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:852
---@param x number x.
---@param y number y.
---@param radius number|nil Radius (0 if nil).
---@return boolean  true if a building is present.
function editor_toolUtilities_occupancy.buildingAt(x, y, radius) end

--- Clears the set of allowed owners cached in a cluster (_pierAllow), to be called when the cluster changes.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:870
---@param cluster table|nil Cluster concerned.
function editor_toolUtilities_occupancy.clearClusterCache(cluster) end

--- Clears all static obstacles (rivers, buildings, fences, lakes).
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:894
function editor_toolUtilities_occupancy.clearStatics() end

--- Height of the road (at its point closest to x, y) or of the junction stamped under this owner; nil for any other owner.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:651
---@param owner string Owner string.
---@param x number x.
---@param y number y.
---@return number|nil  Height z.
function editor_toolUtilities_occupancy.heightAt(owner, x, y) end

--- True if something is stamped within the radius (all owners, plant layer included) other than underground: a tree stands on the hill above a tunnel. Used for vegetation clearance.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:701
---@param x number x.
---@param y number y.
---@param radius number|nil Radius (0 if nil).
---@return boolean  true if occupied.
function editor_toolUtilities_occupancy.occupiedAt(x, y, radius) end

--- Like occupiedAt but IGNORES the cells belonging only to ownerId (the caller's ribbon, deck and tunnel sections included). Does not take the plant layer into account.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:725
---@param x number x.
---@param y number y.
---@param radius number|nil Radius (0 if nil).
---@param ownerId string|nil Owner to ignore, see ownerFor.
---@return boolean  true if something else occupies the area.
function editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId) end

--- True if the center of a road, rail or junction cell, or a BUILT cell of the plant layer, lies within the radius: what a crown of this width would overhang or cross as it grows. A disc (not the box of roadRailAt), exact on shared cells. Blocks with no road or construction are skipped in one go, so a distant point costs a few reads whatever the radius. The filled middle of a junction marks no block, but nothing from outside reaches it without crossing the edge skin, which does mark.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:814
---@param x number x.
---@param y number y.
---@param radius number Crown radius in meters.
---@return boolean  true if a crown of this radius would overhang something.
function editor_toolUtilities_occupancy.overhangAt(x, y, radius) end

--- Owner string of a group ("g" followed by its id), to pass to occupiedAtExcluding.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:745
---@param g table Group (road) with an id field.
---@return string  Owner.
function editor_toolUtilities_occupancy.ownerFor(g) end

--- 2D point-in-polygon test (ray casting, even-odd rule).
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:248
---@param px number x of the point.
---@param py number y of the point.
---@param poly table List of {x,y} vertices.
---@return boolean  true if the point is inside.
function editor_toolUtilities_occupancy.pointInPoly(px, py, poly) end

--- Builds the cluster of these under which the piers of a rail bridge may stand, for blocked: the bridge sections of these tracks and these junctions.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:881
---@param trackIds table Track ids.
---@param jctIds table Junction ids.
---@return table  Cluster { _pierAllow = set of owners }.
function editor_toolUtilities_occupancy.railCluster(trackIds, jctIds) end

--- Rail revision (0 if not registered). Roads restamp the grid themselves once stabilized; rail changes are detected from this revision.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:90
---@return integer  Rail revision.
function editor_toolUtilities_occupancy.railRev() end

--- Restamps the grid from the roads and junctions. Remembers the inputs so that claimed terrain can be stamped later without remeshing the network.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:472
---@param groups table List of groups (roads) with id, divPoints, binormals, divWidths, leftExtM, rightExtM, isEnabled.
---@param jcts table List of junctions.
---@param clearSegs function|nil clearSegs(g, kind) returns the per-segment mask of a link (false over its spans of this kind, 'bridge' or 'tunnel'), or nil if it has none. Supplied by the network that owns the spans.
function editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs) end

--- Counter that changes whenever the grid changes: a tool that keeps things off the grid compares this value instead of querying again for each point.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:719
---@return integer  Grid revision.
function editor_toolUtilities_occupancy.revision() end

--- True if a road or junction other than skip's (its ownerFor, deck sections included) is stamped within the radius around (x, y) at a height strictly between zLo and zHi.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:663
---@param x number x.
---@param y number y.
---@param radius number Search radius in meters.
---@param zLo number Minimum height.
---@param zHi number Maximum height.
---@param skip string|nil Owner to ignore (as well as its b and t suffixes).
---@return boolean  true if a road lies between these heights.
function editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip) end

--- Like transportAt but PATHS are ignored: true only for a road or rail ribbon 'g' or a junction 'j' (or a multi-owner cell, kept as a precaution because its owners are lost).
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:774
---@param x number x.
---@param y number y.
---@param radius number|nil Radius (0 if nil).
---@return boolean  true if a road, rail or junction is present.
function editor_toolUtilities_occupancy.roadRailAt(x, y, radius) end

--- Registers buildings (filled polygons) as static obstacles.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:891
---@param list table|nil List of {x,y} rings.
function editor_toolUtilities_occupancy.setBuildings(list) end

--- Registers fences, walls and hedges (thin polylines) as static obstacles.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:892
---@param list table|nil List of {x,y} polylines.
function editor_toolUtilities_occupancy.setFences(list) end

--- Registers lakes (filled shoreline polygons) as static obstacles.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:893
---@param list table|nil List of {x,y} rings.
function editor_toolUtilities_occupancy.setLakes(list) end

--- Source of the terrain that plants avoid in addition to the rest: get() returns `paved, built` where paved = { { ring = r, holes = { r, ... } }, ... } (a trunk cannot stand there) and built = { r, ... } (a crown cannot reach it either). rev() changes when either changes. Single source; see occupiedAt and overhangAt.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:847
---@param get function Returns paved, built.
---@param rev function Returns the source's revision.
function editor_toolUtilities_occupancy.setPlantKeepOut(get, rev) end

--- Rail Network side: get() returns its tracks (read as road groups), its junction platforms ({ id, pos, lines = { { pts, halfW } } }) and the clearSegs of its tracks; rev() is incremented on each change.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:876
---@param get function Provides tracks, junctions and clearSegs.
---@param rev function Returns the rail revision.
function editor_toolUtilities_occupancy.setRail(get, rev) end

--- Registers rivers as static obstacles (importer). Replaces the previous list; the list survives rebuild().
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:890
---@param list table|nil List of { pts = {{x,y},...}, halfW = n }.
function editor_toolUtilities_occupancy.setRivers(list) end

--- True if a TRANSPORT cell (road 'g', path 'p', junction 'j', or multi-owner cell) lies within the radius.
---Source: lua/ge/extensions/editor/toolUtilities/occupancy.lua:750
---@param x number x.
---@param y number y.
---@param radius number|nil Radius (0 if nil).
---@return boolean  true if transport is present.
function editor_toolUtilities_occupancy.transportAt(x, y, radius) end

