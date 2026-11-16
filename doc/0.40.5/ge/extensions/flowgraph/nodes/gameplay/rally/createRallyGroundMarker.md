# `flowgraph_nodes_gameplay_rally_createRallyGroundMarker`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker.lua` · VM: Game Engine (GE) · 118 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Create Ground Marker Route" (category once_instant, tag rally). Creates the ground marker route (core_groundMarkers.setPath) to a named position of a pathData: the sorted pathnodes (if includePathnodes, true by default) then the named start position, moved back by routeEndOffsetMeters (10 m by default) along its local -Y axis and projected onto the terrain. Waypoints less than 1 m from the previous one are ignored. Then triggers the onCreatedRallyGroundMarkerRoute hook. Inputs: pathData, name, includePathnodes, routeEndOffsetMeters.

## Notes

- If pathData is absent or the named position cannot be found, a warning is logged and nothing is created.
- The ground projection uses core_terrain.getTerrainHeight, otherwise a 150 m static raycast from 50 m above.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Builds the waypoint list, calls core_groundMarkers.setPath then extensions.hook('onCreatedRallyGroundMarkerRoute'). | 91 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCreatedRallyGroundMarkerRoute` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker.lua`.*
