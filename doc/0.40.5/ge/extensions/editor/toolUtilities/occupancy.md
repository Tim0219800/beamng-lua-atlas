# `editor_toolUtilities_occupancy`

*File: `lua/ge/extensions/editor/toolUtilities/occupancy.lua` · VM: Game Engine (GE) · 922 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_occupancy`: `extensions.load("editor_toolUtilities_occupancy")`, then the global `editor_toolUtilities_occupancy`

Coarse 2D occupancy grid (1 m cells) shared by bridge pier clearance and vegetation clearance. Roads (groups with divPoints/binormals) and junctions are supplied to rebuild; the Rail Network posts its tracks and junctions via setRail; everything is stamped together, along with static obstacles (rivers, buildings, fences, lakes), terrain claimed by other tools (groundClaims) and a layer specific to plants (setPlantKeepOut). Each cell keeps an owner (string), or false if several share it. The queries (occupiedAt, transportAt, blocked, overhangAt...) answer "is there something here".

## Notes

- Owners (first character): 'g' road/rail, 'p' path, 'j' junction, 'b' building; suffix 'b' = bridge section of a link (a pier may stand under its own deck), suffix 't' = underground (tunnel, tunnel junction, terrain claimed for cover); rails are 'gr', 'jr'. Plants stand on what is buried, everything else avoids it.
- Margins: road ribbons 0.5 m, rivers +1 m beyond the half-width, buildings +1 m, fences 0.5 m, lakes +1 m, claimed terrain 0.5 m; stabilized shoulder counted at constant width.
- The queries refresh the grid on demand (freshen): it is restamped if the rail or claims revision has changed. revision() changes on each restamp.
- The radius values are 0 if nil. Outside the grid, all queries answer false.
- setRivers/setBuildings/setFences/setLakes each replace their list; the lists survive rebuild() so that pier remeshing keeps avoiding them.
- Expected structures: rivers { pts = {{x,y},...}, halfW = n }; buildings and lakes = lists of filled {x,y} rings; fences = {x,y} polylines.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass)` | True if a cell of the axis-aligned footprint belongs to an owner outside the cluster. pass(owner), if provided, lets other owners through. | 629 |
| `editor_toolUtilities_occupancy.buildingAt(x, y, radius)` | True if a BUILDING cell (owner 'b', stamped footprint + 1 m) lies within the radius. | 852 |
| `editor_toolUtilities_occupancy.clearClusterCache(cluster)` | Clears the set of allowed owners cached in a cluster (_pierAllow), to be called when the cluster changes. | 870 |
| `editor_toolUtilities_occupancy.clearStatics()` | Clears all static obstacles (rivers, buildings, fences, lakes). | 894 |
| `editor_toolUtilities_occupancy.heightAt(owner, x, y)` | Height of the road (at its point closest to x, y) or of the junction stamped under this owner; nil for any other owner. | 651 |
| `editor_toolUtilities_occupancy.occupiedAt(x, y, radius)` | True if something is stamped within the radius (all owners, plant layer included) other than underground: a tree stands on the hill above a tunnel. Used for vegetation clearance. | 701 |
| `editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId)` | Like occupiedAt but IGNORES the cells belonging only to ownerId (the caller's ribbon, deck and tunnel sections included). Does not take the plant layer into account. | 725 |
| `editor_toolUtilities_occupancy.overhangAt(x, y, radius)` | True if the center of a road, rail or junction cell, or a BUILT cell of the plant layer, lies within the radius: what a crown of this width would overhang or cross as it grows. A disc (not the box of roadRailAt), exact on shared cells. Blocks with no road or construction are skipped in one go, so a distant point costs a few reads whatever the radius. The filled middle of a junction marks no block, but nothing from outside reaches it without crossing the edge skin, which does mark. | 814 |
| `editor_toolUtilities_occupancy.ownerFor(g)` | Owner string of a group ("g" followed by its id), to pass to occupiedAtExcluding. | 745 |
| `editor_toolUtilities_occupancy.pointInPoly(px, py, poly)` | 2D point-in-polygon test (ray casting, even-odd rule). | 248 |
| `editor_toolUtilities_occupancy.railCluster(trackIds, jctIds)` | Builds the cluster of these under which the piers of a rail bridge may stand, for blocked: the bridge sections of these tracks and these junctions. | 881 |
| `editor_toolUtilities_occupancy.railRev()` | Rail revision (0 if not registered). Roads restamp the grid themselves once stabilized; rail changes are detected from this revision. | 90 |
| `editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs)` | Restamps the grid from the roads and junctions. Remembers the inputs so that claimed terrain can be stamped later without remeshing the network. | 472 |
| `editor_toolUtilities_occupancy.revision()` | Counter that changes whenever the grid changes: a tool that keeps things off the grid compares this value instead of querying again for each point. | 719 |
| `editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip)` | True if a road or junction other than skip's (its ownerFor, deck sections included) is stamped within the radius around (x, y) at a height strictly between zLo and zHi. | 663 |
| `editor_toolUtilities_occupancy.roadRailAt(x, y, radius)` | Like transportAt but PATHS are ignored: true only for a road or rail ribbon 'g' or a junction 'j' (or a multi-owner cell, kept as a precaution because its owners are lost). | 774 |
| `editor_toolUtilities_occupancy.setBuildings(list)` | Registers buildings (filled polygons) as static obstacles. | 891 |
| `editor_toolUtilities_occupancy.setFences(list)` | Registers fences, walls and hedges (thin polylines) as static obstacles. | 892 |
| `editor_toolUtilities_occupancy.setLakes(list)` | Registers lakes (filled shoreline polygons) as static obstacles. | 893 |
| `editor_toolUtilities_occupancy.setPlantKeepOut(get, rev)` | Source of the terrain that plants avoid in addition to the rest: get() returns `paved, built` where paved = { { ring = r, holes = { r, ... } }, ... } (a trunk cannot stand there) and built = { r, ... } (a crown cannot reach it either). rev() changes when either changes. Single source; see occupiedAt and overhangAt. | 847 |
| `editor_toolUtilities_occupancy.setRail(get, rev)` | Rail Network side: get() returns its tracks (read as road groups), its junction platforms ({ id, pos, lines = { { pts, halfW } } }) and the clearSegs of its tracks; rev() is incremented on each change. | 876 |
| `editor_toolUtilities_occupancy.setRivers(list)` | Registers rivers as static obstacles (importer). Replaces the previous list; the list survives rebuild(). | 890 |
| `editor_toolUtilities_occupancy.transportAt(x, y, radius)` | True if a TRANSPORT cell (road 'g', path 'p', junction 'j', or multi-owner cell) lies within the radius. | 750 |

### Parameter details

#### `editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass)`

True if a cell of the axis-aligned footprint belongs to an owner outside the cluster. pass(owner), if provided, lets other owners through.

- `cluster` (*table*) : Cluster (with _pierAllow cached); see railCluster.
- `x` (*number*) : x of the center.
- `y` (*number*) : y of the center.
- `halfX` (*number*) : Half-extent in x.
- `halfY` (*number*) : Half-extent in y.
- `pass` (*function|nil*) : pass(owner) returns true to tolerate this owner.
- **returns**: boolean true if the footprint is blocked.

#### `editor_toolUtilities_occupancy.buildingAt(x, y, radius)`

True if a BUILDING cell (owner 'b', stamped footprint + 1 m) lies within the radius.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Radius (0 if nil).
- **returns**: boolean true if a building is present.

#### `editor_toolUtilities_occupancy.clearClusterCache(cluster)`

Clears the set of allowed owners cached in a cluster (_pierAllow), to be called when the cluster changes.

- `cluster` (*table|nil*) : Cluster concerned.

#### `editor_toolUtilities_occupancy.heightAt(owner, x, y)`

Height of the road (at its point closest to x, y) or of the junction stamped under this owner; nil for any other owner.

- `owner` (*string*) : Owner string.
- `x` (*number*) : x.
- `y` (*number*) : y.
- **returns**: number|nil Height z.

#### `editor_toolUtilities_occupancy.occupiedAt(x, y, radius)`

True if something is stamped within the radius (all owners, plant layer included) other than underground: a tree stands on the hill above a tunnel. Used for vegetation clearance.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Radius (0 if nil).
- **returns**: boolean true if occupied.

#### `editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId)`

Like occupiedAt but IGNORES the cells belonging only to ownerId (the caller's ribbon, deck and tunnel sections included). Does not take the plant layer into account.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Radius (0 if nil).
- `ownerId` (*string|nil*) : Owner to ignore, see ownerFor.
- **returns**: boolean true if something else occupies the area.

#### `editor_toolUtilities_occupancy.overhangAt(x, y, radius)`

True if the center of a road, rail or junction cell, or a BUILT cell of the plant layer, lies within the radius: what a crown of this width would overhang or cross as it grows. A disc (not the box of roadRailAt), exact on shared cells. Blocks with no road or construction are skipped in one go, so a distant point costs a few reads whatever the radius. The filled middle of a junction marks no block, but nothing from outside reaches it without crossing the edge skin, which does mark.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number*) : Crown radius in meters.
- **returns**: boolean true if a crown of this radius would overhang something.

#### `editor_toolUtilities_occupancy.ownerFor(g)`

Owner string of a group ("g" followed by its id), to pass to occupiedAtExcluding.

- `g` (*table*) : Group (road) with an id field.
- **returns**: string Owner.

#### `editor_toolUtilities_occupancy.pointInPoly(px, py, poly)`

2D point-in-polygon test (ray casting, even-odd rule).

- `px` (*number*) : x of the point.
- `py` (*number*) : y of the point.
- `poly` (*table*) : List of {x,y} vertices.
- **returns**: boolean true if the point is inside.

#### `editor_toolUtilities_occupancy.railCluster(trackIds, jctIds)`

Builds the cluster of these under which the piers of a rail bridge may stand, for blocked: the bridge sections of these tracks and these junctions.

- `trackIds` (*table*) : Track ids.
- `jctIds` (*table*) : Junction ids.
- **returns**: table Cluster { _pierAllow = set of owners }.

#### `editor_toolUtilities_occupancy.railRev()`

Rail revision (0 if not registered). Roads restamp the grid themselves once stabilized; rail changes are detected from this revision.

- **returns**: integer Rail revision.

#### `editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs)`

Restamps the grid from the roads and junctions. Remembers the inputs so that claimed terrain can be stamped later without remeshing the network.

- `groups` (*table*) : List of groups (roads) with id, divPoints, binormals, divWidths, leftExtM, rightExtM, isEnabled.
- `jcts` (*table*) : List of junctions.
- `clearSegs` (*function|nil*) : clearSegs(g, kind) returns the per-segment mask of a link (false over its spans of this kind, 'bridge' or 'tunnel'), or nil if it has none. Supplied by the network that owns the spans.

#### `editor_toolUtilities_occupancy.revision()`

Counter that changes whenever the grid changes: a tool that keeps things off the grid compares this value instead of querying again for each point.

- **returns**: integer Grid revision.

#### `editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip)`

True if a road or junction other than skip's (its ownerFor, deck sections included) is stamped within the radius around (x, y) at a height strictly between zLo and zHi.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number*) : Search radius in meters.
- `zLo` (*number*) : Minimum height.
- `zHi` (*number*) : Maximum height.
- `skip` (*string|nil*) : Owner to ignore (as well as its b and t suffixes).
- **returns**: boolean true if a road lies between these heights.

#### `editor_toolUtilities_occupancy.roadRailAt(x, y, radius)`

Like transportAt but PATHS are ignored: true only for a road or rail ribbon 'g' or a junction 'j' (or a multi-owner cell, kept as a precaution because its owners are lost).

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Radius (0 if nil).
- **returns**: boolean true if a road, rail or junction is present.

#### `editor_toolUtilities_occupancy.setBuildings(list)`

Registers buildings (filled polygons) as static obstacles.

- `list` (*table|nil*) : List of {x,y} rings.

#### `editor_toolUtilities_occupancy.setFences(list)`

Registers fences, walls and hedges (thin polylines) as static obstacles.

- `list` (*table|nil*) : List of {x,y} polylines.

#### `editor_toolUtilities_occupancy.setLakes(list)`

Registers lakes (filled shoreline polygons) as static obstacles.

- `list` (*table|nil*) : List of {x,y} rings.

#### `editor_toolUtilities_occupancy.setPlantKeepOut(get, rev)`

Source of the terrain that plants avoid in addition to the rest: get() returns `paved, built` where paved = { { ring = r, holes = { r, ... } }, ... } (a trunk cannot stand there) and built = { r, ... } (a crown cannot reach it either). rev() changes when either changes. Single source; see occupiedAt and overhangAt.

- `get` (*function*) : Returns paved, built.
- `rev` (*function*) : Returns the source's revision.

#### `editor_toolUtilities_occupancy.setRail(get, rev)`

Rail Network side: get() returns its tracks (read as road groups), its junction platforms ({ id, pos, lines = { { pts, halfW } } }) and the clearSegs of its tracks; rev() is incremented on each change.

- `get` (*function*) : Provides tracks, junctions and clearSegs.
- `rev` (*function*) : Returns the rail revision.

#### `editor_toolUtilities_occupancy.setRivers(list)`

Registers rivers as static obstacles (importer). Replaces the previous list; the list survives rebuild().

- `list` (*table|nil*) : List of { pts = {{x,y},...}, halfW = n }.

#### `editor_toolUtilities_occupancy.transportAt(x, y, radius)`

True if a TRANSPORT cell (road 'g', path 'p', junction 'j', or multi-owner cell) lies within the radius.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Radius (0 if nil).
- **returns**: boolean true if transport is present.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/occupancy.lua`.*
