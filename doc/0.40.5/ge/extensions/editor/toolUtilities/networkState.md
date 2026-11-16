# `editor_toolUtilities_networkState`

*File: `lua/ge/extensions/editor/toolUtilities/networkState.lua` · VM: Game Engine (GE) · 166 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_networkState`: `extensions.load("editor_toolUtilities_networkState")`, then the global `editor_toolUtilities_networkState`

Exchange table between the editor's road network and the tools that build against it (parcels, sidewalks, parking lots). The network publishes its data once with provide(t) when the road tool loads; the other tools read (roads, surfaces, overRoad...). In the other direction, a tool that has paved verges publishes them (publishFootway) and can request pedestrian crossings (crossingSites, applyCrossings). Neither side knows the other.

## Notes

- As long as the network has not called provide, each reader gets an honest empty answer: empty tables, 0, false; busy() returns true.
- busy(): true if the network is not loaded, has roads or junctions pending rebuild (long after a load or a Lua reload) or if a node is being moved; wait for it to be false before placing terrain against the roads.
- Fields expected by provide: roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged (plus busy, overRoad, crossingSites, applyCrossings used by the footbridges).
- overRoad calls net.overRoad without an existence test: with a network provided without this function, the call would fail (the code only guards against a nil 'net').

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_networkState.applyCrossings(owner, list)` | Places the crossings wanted by this owner (list of sites reduced to those retained) in place of its previous request. Empty list: removes its crossings. Crossings placed by hand or requested by another owner are left alone. | 114 |
| `editor_toolUtilities_networkState.busy()` | True if the network's answers are still stabilizing (see notes). | 76 |
| `editor_toolUtilities_networkState.crossingSites(density, depthM)` | Where the network would place a pedestrian crossing: one site on each approach of the junctions that count. Each site gives the road, the position along it and the two points its strip would reach. Sites that already have a crossing are omitted. | 106 |
| `editor_toolUtilities_networkState.features()` | What the network asked of the terrain: the ground it leveled and the structures it placed there. | 88 |
| `editor_toolUtilities_networkState.footwayFor(groupId)` | Everything paved on a road's verges, merged across owners. Returns nil if nobody has paved there (the network understands: paint the blend over the whole length). | 129 |
| `editor_toolUtilities_networkState.groundSegs(road)` | Indicates, per divPoint segment, which segments of a road rest on the ground (and not on a deck or in a tunnel); bridge abutments count as ground. Returns nil if all segments are on the ground. | 42 |
| `editor_toolUtilities_networkState.heldPastEdge(paved)` | Distance beyond the edge of a road's surface over which its slope still holds the terrain at the road's height, taking priority over what a site places there. | 96 |
| `editor_toolUtilities_networkState.invalidate()` | The surfaces are cached: this call tells the network that a tool has just moved something. | 63 |
| `editor_toolUtilities_networkState.overRoad(ring)` | Tells whether a ring falls on a network surface. Asked of the network rather than computed from surfaces, because a junction is partly bounded by lines. | 57 |
| `editor_toolUtilities_networkState.provide(t)` | Network side: registers the road network's function table. Called once when the road tool loads; everything else in the module refers back to it. *(internal)* | 29 |
| `editor_toolUtilities_networkState.publishFootway(owner, byGroup)` | Paving tool side: publishes the verges this owner has paved, { [groupId] = { left = spans, right = spans } }, replacing its previous publication. The network is notified immediately (footwayChanged) because the blend under the slabs is painted terrain that must be repainted. | 121 |
| `editor_toolUtilities_networkState.rev()` | Counter incremented on each rebuild of a road or junction (heights included), for tools that place something on a road's surface. | 82 |
| `editor_toolUtilities_networkState.roads()` | All placed roads, in plan geometry: id, divPoints, tangents, binormals. Junction nodes and the rest are excluded. | 35 |
| `editor_toolUtilities_networkState.sig()` | Counter incremented when the network's surfaces change, so that a tool notices that a road has moved under its terrain. | 68 |
| `editor_toolUtilities_networkState.surfaces()` | Everything the network has paved, in plan: the closed rings of roadway and sealed junction, then the edge lines that bound no area of their own. | 49 |

### Parameter details

#### `editor_toolUtilities_networkState.applyCrossings(owner, list)`

Places the crossings wanted by this owner (list of sites reduced to those retained) in place of its previous request. Empty list: removes its crossings. Crossings placed by hand or requested by another owner are left alone.

- `owner` (*any*) : Owner name (nil = nothing).
- `list` (*table[]*) : Retained sites.
- **returns**: integer Number placed.
- **returns**: integer Number removed (0, 0 without a network or without owner).

#### `editor_toolUtilities_networkState.busy()`

True if the network's answers are still stabilizing (see notes).

- **returns**: boolean true if the network is not ready.

#### `editor_toolUtilities_networkState.crossingSites(density, depthM)`

Where the network would place a pedestrian crossing: one site on each approach of the junctions that count. Each site gives the road, the position along it and the two points its strip would reach. Sites that already have a crossing are omitted.

- `density` (*number*) : Proportion of sites kept.
- `depthM` (*number*) : Depth of the strip (m).
- **returns**: table[] Crossing sites.

#### `editor_toolUtilities_networkState.features()`

What the network asked of the terrain: the ground it leveled and the structures it placed there.

- **returns**: table Leveled ground items.
- **returns**: table Structure items.

#### `editor_toolUtilities_networkState.footwayFor(groupId)`

Everything paved on a road's verges, merged across owners. Returns nil if nobody has paved there (the network understands: paint the blend over the whole length).

- `groupId` (*any*) : Road group id.
- **returns**: table|nil { left, right } lists of spans, or nil.

#### `editor_toolUtilities_networkState.groundSegs(road)`

Indicates, per divPoint segment, which segments of a road rest on the ground (and not on a deck or in a tunnel); bridge abutments count as ground. Returns nil if all segments are on the ground.

- `road` (*table*) : Road (element of roads()).
- **returns**: table|nil Per-segment markers, or nil.

#### `editor_toolUtilities_networkState.heldPastEdge(paved)`

Distance beyond the edge of a road's surface over which its slope still holds the terrain at the road's height, taking priority over what a site places there.

- `paved` (*boolean|nil*) : For a verge that another tool has declared a sidewalk: the road keeps no bare shoulder there.
- **returns**: number Distance in meters (0 without a network).

#### `editor_toolUtilities_networkState.overRoad(ring)`

Tells whether a ring falls on a network surface. Asked of the network rather than computed from surfaces, because a junction is partly bounded by lines.

- `ring` (*table*) : Ring of points.
- **returns**: boolean true if the ring overlaps the network (false if the network is not provided).

#### `editor_toolUtilities_networkState.provide(t)`

Network side: registers the road network's function table. Called once when the road tool loads; everything else in the module refers back to it.

- `t` (*table*) : Table with roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged, etc.

#### `editor_toolUtilities_networkState.publishFootway(owner, byGroup)`

Paving tool side: publishes the verges this owner has paved, { [groupId] = { left = spans, right = spans } }, replacing its previous publication. The network is notified immediately (footwayChanged) because the blend under the slabs is painted terrain that must be repainted.

- `owner` (*any*) : Owner name; nil = no effect.
- `byGroup` (*table*) : Left/right spans per road group id.

#### `editor_toolUtilities_networkState.rev()`

Counter incremented on each rebuild of a road or junction (heights included), for tools that place something on a road's surface.

- **returns**: number Revision (0 without a network).

#### `editor_toolUtilities_networkState.roads()`

All placed roads, in plan geometry: id, divPoints, tangents, binormals. Junction nodes and the rest are excluded.

- **returns**: table[] Roads (shared empty table if the network is not provided).

#### `editor_toolUtilities_networkState.sig()`

Counter incremented when the network's surfaces change, so that a tool notices that a road has moved under its terrain.

- **returns**: number Signature (0 without a network).

#### `editor_toolUtilities_networkState.surfaces()`

Everything the network has paved, in plan: the closed rings of roadway and sealed junction, then the edge lines that bound no area of their own.

- **returns**: table[] Closed rings.
- **returns**: table[] Edge lines.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/networkState.lua`.*
