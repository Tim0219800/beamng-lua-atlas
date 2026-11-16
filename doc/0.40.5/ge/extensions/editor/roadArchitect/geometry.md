# `editor_roadArchitect_geometry`

*File: `lua/ge/extensions/editor/roadArchitect/geometry.lua` · VM: Game Engine (GE) · 753 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_geometry`: `extensions.load("editor_roadArchitect_geometry")`, then the global `editor_roadArchitect_geometry`

Geometry module of the Road Architect editor (GE). It turns a road's reference nodes into discretized points along a spline, then computes for each point and each lane the four corners of the cross section, the normal and lateral vectors, the banking, etc. The result is stored in road.renderData and is used for display and for creating DecalRoads/meshes. A modder only uses it to recompute or read this data from an editing tool.

## Notes

- Only one function is exported; the fitting functions (fitSplineStandardRoad, fitArc, fitCivEngAndFrame, identifyTunnelSections) are local.
- The road is modified in place: road.renderData is replaced, road.tunnels is emptied then recreated if road.isAllowTunnels[0] is true, and the nodes may change (p.z projected onto the terrain, rot recomputed by auto-banking).
- The road.* values such as isConformRoadToTerrain, isCivilEngRoads, isAllowTunnels, extraS, extraE are imgui pointers (accessed with [0]).
- The banking (index 12) is converted to radians (rad() of the degree stored on the node). Widths and heights are in meters.
- Tunnel computation is only done if extensions.editor_terrainEditor.getTerrainBlock() returns a terrain block.
- The hairpin widening (profile.isExtraWidth) adds 3 m spread over lanes wider than 2 m, then restores the original widths after fitting (there is no guard if numLanes is 0: division by zero possible, inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_geometry.computeRoadRenderData(road)` | Computes the render data of the given road and stores it in road.renderData. Chooses the fitting according to the road: civil engineering style (road.isCivilEngRoads[0]), circular arc (road.isArc, three nodes) or centripetal Catmull-Rom spline by default. Beforehand, applies terrain projection, auto-banking and hairpin widening if these options are active. | 533 |

### Parameter details

#### `editor_roadArchitect_geometry.computeRoadRenderData(road)`

Computes the render data of the given road and stores it in road.renderData. Chooses the fitting according to the road: civil engineering style (road.isCivilEngRoads[0]), circular arc (road.isArc, three nodes) or centripetal Catmull-Rom spline by default. Beforehand, applies terrain projection, auto-banking and hairpin widening if these options are active.

- `road` (*table*) : Road Architect road (nodes, profile, laneKeys, leftKeys, rightKeys, renderData, tunnels, imgui options...). Modified in place.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/geometry.lua`.*
