# `editor_roadArchitect_link`

*File: `lua/ge/extensions/editor/roadArchitect/link.lua` · VM: Game Engine (GE) · 1478 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_link`: `extensions.load("editor_roadArchitect_link")`, then the global `editor_roadArchitect_link`

Road Architect editor module that links roads together. It detects whether the end of a road can be connected to that of another (identical profile, sidewalk/no sidewalk, highway/urban, one-way/two-way road, lane flaring, overlay) and creates the corresponding junction road. It also computes T/Y junction candidates (a road ending in the middle of another) and builds the junction that cuts the trunk road. It relies on the Road Architect roads, profiles, junctions and utilities modules.

## Notes

- Links are described by a table { r1Name, r1Lie, r2Name, r2Lie, class } where r1Lie/r2Lie are 'start' or 'end' (end of the road concerned) and class is one of: 'Perfect', 'Overlay -> Overlay', '1Way Hwy -> Rural', '1Way Rural -> Hwy', 'Sidewalk -> No Sidewalk', 'No Sidewalk -> Sidewalk', 'Urban Taper Up', 'Urban Taper Down', 'Urban 1Way -> 2Way', 'Urban 2Way -> 1Way', 'Urban -> Highway', 'Highway -> Urban', 'Highway Taper Up', 'Highway Taper Down', 'Highway 1Way -> 2Way', 'Highway 2Way -> 1Way'.
- Probable bug in computePossibleLinks: the loop choosing the closest candidate starts at i = 2 with bestIdx = 1 by default. The first link found (links[1]) is therefore never compared by distance; as soon as there are at least two links, one of the following ones is always kept. If there is no link, the function returns nil.
- Junction roads (isJctRoad) are ignored as link targets. Bridges (isBridge) are not linked; overlays (isOverlay) only link with each other.
- Bridges and overlays are excluded from the junction computation (computePossibleJct returns nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs)` | Looks, among the candidate roads, for the road onto which the end nIdx of road rIdx can attach as a junction (type 'T' or 'Y'). Requires both roads to have or not have sidewalks, ignores bridges and overlays, and keeps the closest candidate. The type is 'T' if the road is roughly perpendicular to the trunk road (dot product < 0.4), 'Y' otherwise (identical profile case only). | 1071 |
| `editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs)` | Iterates over the candidate roads rIdxs and tests each possible connection case with road rIdx1 (profile identity, sidewalks, highway/rural, one-way/two-way, flaring). Returns the closest link as a table { r1Name, r1Lie, r2Name, r2Lie, class }, or nil if no connection is possible. nIdx1 == 1 means we look at the start of road 1, otherwise its end. | 371 |
| `editor_roadArchitect_link.createSplitJunction(candJct)` | Builds the proposed junction: saves the state of the roads, cuts the trunk road at node tNode into two roads, removes nearby nodes, pushes the ends back to the edge of the junction sphere, creates the junction (T) with the junction road then connects the three branches with 'Perfect' links. If one of the resulting trunk roads has fewer than 2 nodes, restores the original state and exits. | 1180 |
| `editor_roadArchitect_link.joinRoads(link)` | Creates the connecting road described by the link (merge into a single road for 'Perfect', transition or taper road for the other classes). The choice of the internal function depends on link.class. Does nothing if the class is unknown. | 1020 |

### Parameter details

#### `editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs)`

Looks, among the candidate roads, for the road onto which the end nIdx of road rIdx can attach as a junction (type 'T' or 'Y'). Requires both roads to have or not have sidewalks, ignores bridges and overlays, and keeps the closest candidate. The type is 'T' if the road is roughly perpendicular to the trunk road (dot product < 0.4), 'Y' otherwise (identical profile case only).

- `rIdx` (*integer*) : Index of the road that must connect.
- `nIdx` (*integer*) : Index of the end node of this road (1 = start, otherwise end).
- `rIdxs` (*integer[]*) : Indices of the candidate trunk roads.
- `nIdxs` (*integer[]*) : Index of the closest trunk road node, for each candidate.
- **returns**: table|nil Table { jName, jNode, tName, tNode, type, class } (junction road, its node, trunk road, its node, 'T' or 'Y', class description) or nil if no candidate.

#### `editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs)`

Iterates over the candidate roads rIdxs and tests each possible connection case with road rIdx1 (profile identity, sidewalks, highway/rural, one-way/two-way, flaring). Returns the closest link as a table { r1Name, r1Lie, r2Name, r2Lie, class }, or nil if no connection is possible. nIdx1 == 1 means we look at the start of road 1, otherwise its end.

- `rIdx1` (*integer*) : Index (in roadMgr.roads) of the starting road.
- `nIdx1` (*integer*) : Index of the end node of the starting road (1 = start, otherwise end).
- `rIdxs` (*integer[]*) : Indices of the candidate roads to test.
- `nIdxs` (*integer[]*) : Index of the end node for each candidate road (1 = start, otherwise end), aligned with rIdxs.
- **returns**: table|nil Table { r1Name, r1Lie, r2Name, r2Lie, class } describing the chosen connection, or nil.

#### `editor_roadArchitect_link.createSplitJunction(candJct)`

Builds the proposed junction: saves the state of the roads, cuts the trunk road at node tNode into two roads, removes nearby nodes, pushes the ends back to the edge of the junction sphere, creates the junction (T) with the junction road then connects the three branches with 'Perfect' links. If one of the resulting trunk roads has fewer than 2 nodes, restores the original state and exits.

- `candJct` (*table*) : Candidate returned by computePossibleJct ({ jName, jNode, tName, tNode, type, class }).

#### `editor_roadArchitect_link.joinRoads(link)`

Creates the connecting road described by the link (merge into a single road for 'Perfect', transition or taper road for the other classes). The choice of the internal function depends on link.class. Does nothing if the class is unknown.

- `link` (*table*) : Table { r1Name, r1Lie, r2Name, r2Lie, class } as returned by computePossibleLinks.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/link.lua`.*
