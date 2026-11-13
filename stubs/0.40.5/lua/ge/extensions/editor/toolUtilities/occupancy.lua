---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/occupancy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_occupancy` : `extensions.load("editor_toolUtilities_occupancy")`, puis la globale `editor_toolUtilities_occupancy`
---@class editor_toolUtilities_occupancy
editor_toolUtilities_occupancy = {}

--- True if any cell in the axis-aligned footprint is owned outside the cluster. pass(owner), if given, lets more owners by.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:629
---@param cluster any
---@param x any
---@param y any
---@param halfX any
---@param halfY any
---@param pass any
function editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass) end

--- True if a BUILDING cell (owner 'b', stamped footprint + buildingPadM) lies within radius.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:852
---@param x any
---@param y any
---@param radius any
function editor_toolUtilities_occupancy.buildingAt(x, y, radius) end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:870
---@param cluster any
function editor_toolUtilities_occupancy.clearClusterCache(cluster) end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:894
function editor_toolUtilities_occupancy.clearStatics() end

--- The height of the road (at its nearest point to x, y) or junction stamped as owner, or nil for any other owner.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:651
---@param owner any
---@param x any
---@param y any
function editor_toolUtilities_occupancy.heightAt(owner, x, y) end

--- True if anything is stamped within radius of the point (owner-agnostic), the plant layer included, but not what is under
---  ground: a tree stands on the hill over a tunnel. Used for vegetation keep-out.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:701
---@param x any
---@param y any
---@param radius any
function editor_toolUtilities_occupancy.occupiedAt(x, y, radius) end

--- Like occupiedAt but IGNORES cells owned solely by ownerId (the caller's own ribbon, its deck and tunnel stretches included).
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:725
---@param x any
---@param y any
---@param radius any
---@param ownerId any
function editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId) end

--- True if a road, rail or junction cell centre, or a BUILT one of the plant layer, lies within radius of the point: what a
---  crown that wide would hang over or grow up through. A disc rather than roadRailAt's box, and exact about shared cells.
---  Blocks with neither in them are passed over whole, so a point far from both costs a handful of lookups whatever the
---  radius. A junction's filled middle marks no blocks, but nothing outside it can reach it without crossing the edge skin,
---  which does.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:814
---@param x any
---@param y any
---@param radius any
function editor_toolUtilities_occupancy.overhangAt(x, y, radius) end

--- Occupancy owner string for a group, so callers can pass it to occupiedAtExcluding.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:745
---@param g any
function editor_toolUtilities_occupancy.ownerFor(g) end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:248
---@param px any
---@param py any
---@param poly any
function editor_toolUtilities_occupancy.pointInPoly(px, py, poly) end

--- What a rail bridge's piers may stand under, for blocked: the bridge stretches of these tracks and these junctions.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:881
---@param trackIds any
---@param jctIds any
function editor_toolUtilities_occupancy.railCluster(trackIds, jctIds) end

--- The roads restamp the grid themselves once they settle; the rail's changes are picked up from its revision.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:90
function editor_toolUtilities_occupancy.railRev() end

--- clearSegs(g, kind) gives a link's per-segment mask (false along its spans of that kind, 'bridge' or 'tunnel'), or nil when
---  it has none. It is handed in by the network that owns the spans.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:472
---@param groups any
---@param jcts any
---@param clearSegs any
function editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs) end

--- Changes whenever the grid does: a tool keeping things off it compares this rather than asking again of every point.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:719
function editor_toolUtilities_occupancy.revision() end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:663
---@param x any
---@param y any
---@param radius any
---@param zLo any
---@param zHi any
---@param skip any
function editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip) end

--- Like transportAt but PATHS ARE IGNORED: true only for a road/rail ribbon 'g' or junction 'j' (or a multi-owner
---  cell, kept conservative since its owners are lost).
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:774
---@param x any
---@param y any
---@param radius any
function editor_toolUtilities_occupancy.roadRailAt(x, y, radius) end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:891
---@param list any
function editor_toolUtilities_occupancy.setBuildings(list) end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:892
---@param list any
function editor_toolUtilities_occupancy.setFences(list) end

---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:893
---@param list any
function editor_toolUtilities_occupancy.setLakes(list) end

--- The ground plants keep off besides everything else here: `get()` returns `paved, built`, where paved is
--- { { ring = r, holes = { r, ... } }, ... } a trunk may not stand on and built is { r, ... } a crown may not reach either.
--- `rev()` changes whenever either does. One source; see occupiedAt and overhangAt.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:847
---@param get any
---@param rev any
function editor_toolUtilities_occupancy.setPlantKeepOut(get, rev) end

--- The Rail Network's side: get() answers its tracks (as road groups are read), its junction pads ({ id, pos, lines = { { pts,
---  halfW } } }) and its tracks' clearSegs; rev() is bumped whenever any of that changes.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:876
---@param get any
---@param rev any
function editor_toolUtilities_occupancy.setRail(get, rev) end

--- Static obstacle registration (importer). Each setter replaces its own kind; the lists persist across
---  rebuild() so pier remeshing keeps avoiding them without the tool knowing about non-transport geometry.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:890
---@param list any
function editor_toolUtilities_occupancy.setRivers(list) end

--- True if a TRANSPORT cell (road group 'g', path 'p', or junction 'j', or a multi-owner cell) lies within radius.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:750
---@param x any
---@param y any
---@param radius any
function editor_toolUtilities_occupancy.transportAt(x, y, radius) end

