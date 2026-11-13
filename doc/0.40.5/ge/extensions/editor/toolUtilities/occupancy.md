# `editor_toolUtilities_occupancy`

*Fichier : `lua/ge/extensions/editor/toolUtilities/occupancy.lua` · VM : Game Engine (GE) · 922 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_occupancy` : `extensions.load("editor_toolUtilities_occupancy")`, puis la globale `editor_toolUtilities_occupancy`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass)` | True if any cell in the axis-aligned footprint is owned outside the cluster. pass(owner), if given, lets more owners by. | 629 |
| `editor_toolUtilities_occupancy.buildingAt(x, y, radius)` | True if a BUILDING cell (owner 'b', stamped footprint + buildingPadM) lies within radius. | 852 |
| `editor_toolUtilities_occupancy.clearClusterCache(cluster)` |  | 870 |
| `editor_toolUtilities_occupancy.clearStatics()` |  | 894 |
| `editor_toolUtilities_occupancy.heightAt(owner, x, y)` | The height of the road (at its nearest point to x, y) or junction stamped as owner, or nil for any other owner. | 651 |
| `editor_toolUtilities_occupancy.occupiedAt(x, y, radius)` | True if anything is stamped within radius of the point (owner-agnostic), the plant layer included, but not what is under<br> ground: a tree stands on the hill over a tunnel. Used for vegetation keep-out. | 701 |
| `editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId)` | Like occupiedAt but IGNORES cells owned solely by ownerId (the caller's own ribbon, its deck and tunnel stretches included). | 725 |
| `editor_toolUtilities_occupancy.overhangAt(x, y, radius)` | True if a road, rail or junction cell centre, or a BUILT one of the plant layer, lies within radius of the point: what a<br> crown that wide would hang over or grow up through. A disc rather than roadRailAt's box, and exact about shared cells.<br> Blocks with neither in them are passed over whole, so a point far from both costs a handful of lookups whatever the<br> radius. A junction's filled middle marks no blocks, but nothing outside it can reach it without crossing the edge skin,<br> which does. | 814 |
| `editor_toolUtilities_occupancy.ownerFor(g)` | Occupancy owner string for a group, so callers can pass it to occupiedAtExcluding. | 745 |
| `editor_toolUtilities_occupancy.pointInPoly(px, py, poly)` |  | 248 |
| `editor_toolUtilities_occupancy.railCluster(trackIds, jctIds)` | What a rail bridge's piers may stand under, for blocked: the bridge stretches of these tracks and these junctions. | 881 |
| `editor_toolUtilities_occupancy.railRev()` | The roads restamp the grid themselves once they settle; the rail's changes are picked up from its revision. | 90 |
| `editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs)` | clearSegs(g, kind) gives a link's per-segment mask (false along its spans of that kind, 'bridge' or 'tunnel'), or nil when<br> it has none. It is handed in by the network that owns the spans. | 472 |
| `editor_toolUtilities_occupancy.revision()` | Changes whenever the grid does: a tool keeping things off it compares this rather than asking again of every point. | 719 |
| `editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip)` |  | 663 |
| `editor_toolUtilities_occupancy.roadRailAt(x, y, radius)` | Like transportAt but PATHS ARE IGNORED: true only for a road/rail ribbon 'g' or junction 'j' (or a multi-owner<br> cell, kept conservative since its owners are lost). | 774 |
| `editor_toolUtilities_occupancy.setBuildings(list)` |  | 891 |
| `editor_toolUtilities_occupancy.setFences(list)` |  | 892 |
| `editor_toolUtilities_occupancy.setLakes(list)` |  | 893 |
| `editor_toolUtilities_occupancy.setPlantKeepOut(get, rev)` | The ground plants keep off besides everything else here: `get()` returns `paved, built`, where paved is<br>{ { ring = r, holes = { r, ... } }, ... } a trunk may not stand on and built is { r, ... } a crown may not reach either.<br>`rev()` changes whenever either does. One source; see occupiedAt and overhangAt. | 847 |
| `editor_toolUtilities_occupancy.setRail(get, rev)` | The Rail Network's side: get() answers its tracks (as road groups are read), its junction pads ({ id, pos, lines = { { pts,<br> halfW } } }) and its tracks' clearSegs; rev() is bumped whenever any of that changes. | 876 |
| `editor_toolUtilities_occupancy.setRivers(list)` | Static obstacle registration (importer). Each setter replaces its own kind; the lists persist across<br> rebuild() so pier remeshing keeps avoiding them without the tool knowing about non-transport geometry. | 890 |
| `editor_toolUtilities_occupancy.transportAt(x, y, radius)` | True if a TRANSPORT cell (road group 'g', path 'p', or junction 'j', or a multi-owner cell) lies within radius. | 750 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/occupancy.lua`.*
