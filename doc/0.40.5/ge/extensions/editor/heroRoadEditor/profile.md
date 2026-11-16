# `editor_heroRoadEditor_profile`

*File: `lua/ge/extensions/editor/heroRoadEditor/profile.lua` · VM: Game Engine (GE) · 375 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_profile`: `extensions.load("editor_heroRoadEditor_profile")`, then the global `editor_heroRoadEditor_profile`

Cross-section profile of a Hero Road Editor group. Turns the lane, crown and shoulder parameters into a 2D cut per station (lateral offset o, vertical deviation dz relative to the centerline plane) and a superelevation (bank) angle driven by curvature. mesh.lua sweeps these cuts along the road to build the surface. Also handles widening in curves, placed widenings (laybys, lanes, intersections), flat ends and an anti-fold cap on the inner edge.

## Notes

- Parameters read from the group (default): leftExtM/rightExtM 5.0 m, crownOn (true unless false), crossfallPct 2.5 %, shoulderWidthM 0, shoulderFallPct 6 %, superElevMaxDeg 6 degrees, superMinRadiusM 80 m (min 1), latRes 4 subdivisions per side, curveWidenMaxM, flatEnds / flatEndLenM, sideChamfers / chamferWidthM 0.6 m.
- The crown is parabolic (flat apex at the center, no central crease); it fades out in curves (factor 1 - |t|) and at flat ends.
- The superelevation reaches its maximum when the radius equals superMinRadiusM; it is smoothed over a half-window of 18 m. In group.geometryMode == 'engineered' mode, per-corner superElevDeg (group.corners) can override it.
- Anti-fold: the inner side is limited to 0.8 times the local corner radius (foldSafety), using the exact curvature divCurv if it is aligned with the stations, otherwise an estimate from a discrete frame; the constraint is eroded over 8 m.
- The number of columns is constant (shoulder + 2*latRes + shoulder): all stations have the same cross-section shape.
- build returns nil, nil if divPoints has fewer than 2 points or if tangents is absent.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_profile.build(group)` | Builds the per-station cuts and the superelevation for the group. Each cut is a list of points {o, dz} from left to right. | 283 |
| `editor_heroRoadEditor_profile.minSafeRadius(group)` | Smallest centerline radius (m) that the group can round before the inner-edge fold cap bites: inner half-width (max width + shoulder + chamfer + half of the max widening) divided by 0.8, plus 1.5 m margin. | 349 |
| `editor_heroRoadEditor_profile.previewCrossSection(group)` | Cut of a straight section (full crown, no superelevation or fold cap) for the interface's read-only preview. | 360 |

### Parameter details

#### `editor_heroRoadEditor_profile.build(group)`

Builds the per-station cuts and the superelevation for the group. Each cut is a list of points {o, dz} from left to right.

- `group` (*table*) : Hero Road group (divPoints, tangents, divCurv, discMap, corners, widenings, junctions, profile parameters).
- **returns**: table|nil Array over divPoints of { pts = {{o, dz}, ...}, bank = angle in radians }, or nil if the geometry is not ready.
- **returns**: string[]|nil Material key per band (MAT_ROAD or MAT_SHOULDER), one entry per cut segment.

#### `editor_heroRoadEditor_profile.minSafeRadius(group)`

Smallest centerline radius (m) that the group can round before the inner-edge fold cap bites: inner half-width (max width + shoulder + chamfer + half of the max widening) divided by 0.8, plus 1.5 m margin.

- `group` (*table*) : Hero Road group.
- **returns**: number Minimum safe radius in meters.

#### `editor_heroRoadEditor_profile.previewCrossSection(group)`

Cut of a straight section (full crown, no superelevation or fold cap) for the interface's read-only preview.

- `group` (*table*) : Hero Road group.
- **returns**: table List of points {o, dz}.
- **returns**: string[] Material per band.

## Fields

| Field | Type | Description |
|---|---|---|
| `MAT_ROAD` | string | Material key of the 'road' band (resolved to a real material in mesh.lua). |
| `MAT_SHOULDER` | string | Material key of the 'shoulder' band. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/profile.lua`.*
