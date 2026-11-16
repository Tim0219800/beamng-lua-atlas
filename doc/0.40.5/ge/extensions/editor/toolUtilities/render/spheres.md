# `editor_toolUtilities_render_spheres`

*File: `lua/ge/extensions/editor/toolUtilities/render/spheres.lua` · VM: Game Engine (GE) · 228 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_spheres`: `extensions.load("editor_toolUtilities_render_spheres")`, then the global `editor_toolUtilities_render_spheres`

Drawing of debug spheres and handles for the spline editing tools (from the old render.lua). Leaf module: depends on utils/debugDraw and the shared style. The radius is proportional to the distance to the camera (constant apparent size up to 60 m, then fixed world size), via getSphereScale which the render/spline, transport and graph modules reuse. Contains nodes, junctions, bar and curve handles, highlights (hover, selection, pulsing over time) and "X-ray" ghosts without depth test.

## Notes

- The "Culled" variants (and most node drawings) only draw within 600 m of the camera; drawSphereCursor and drawSphereImmediate are not filtered.
- The highlights pulse with os.clock() according to the style frequencies (highlightPulseHz, highlightHoverPulseHz).
- The "Fixed" functions take a fixed world radius instead of the distance-linked scale.
- Ghosts (Ghost) and highlights are drawn without depth test: visible through the terrain.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p)` | Pulsing halo of a hovered navGraph node. | 122 |
| `editor_toolUtilities_render_spheres.drawPathNode(p)` | Path node (colourPathNode). | 112 |
| `editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p)` | Large pulsing node of the selected navigation graph. | 113 |
| `editor_toolUtilities_render_spheres.drawSphereBar(p)` | Bar handle (halo then core). | 43 |
| `editor_toolUtilities_render_spheres.drawSphereBarGhost(p)` | X-ray ghost of the bar handle. | 191 |
| `editor_toolUtilities_render_spheres.drawSphereBarHover(p)` | Hovered bar handle: larger pulsing halo. | 49 |
| `editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p)` | X-ray ghost of the corner handle. | 188 |
| `editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col)` | Sphere at the distance-linked scale, if the point is within 600 m. | 31 |
| `editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive)` | Mouse cursor sphere on the map; distance capped at 100 m for the size. Not filtered. | 154 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandle(p)` | Curve apex handle (edge bending, corner radius), green by default. | 76 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol)` | Curve handle with core and halo colors chosen by the tool: stable point with soft halo. | 61 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p)` | Hovered curve handle (pulsing halo). | 77 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol)` | Hovered version of drawSphereCurveHandleCol: larger, brighter, pulsing halo. | 66 |
| `editor_toolUtilities_render_spheres.drawSphereHighlight(p)` | Node highlight (colourHighlight, no depth test), filtered at 600 m. | 163 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p)` | Node highlight without distance filtering. | 177 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightHover(p)` | Pulsing hover highlight, at the distance-linked scale. | 78 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius)` | Pulsing hover highlight with fixed world radius. | 88 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p)` | Pulsing selection highlight, at the distance-linked scale. | 95 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius)` | Pulsing selection highlight with fixed world radius. | 105 |
| `editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col)` | Sphere at the distance-linked scale, without distance filtering. | 153 |
| `editor_toolUtilities_render_spheres.drawSphereJunction(p)` | Junction center (halo then core). | 144 |
| `editor_toolUtilities_render_spheres.drawSphereJunctionDull(p)` | Dimmed junction center. | 150 |
| `editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p)` | X-ray ghost of a junction. | 185 |
| `editor_toolUtilities_render_spheres.drawSphereNode(p)` | Standard node: halo then core. | 131 |
| `editor_toolUtilities_render_spheres.drawSphereNodeDull(p)` | Dimmed node. | 162 |
| `editor_toolUtilities_render_spheres.drawSphereNodeForeground(p)` | Node (halo then core) drawn without depth test. | 170 |
| `editor_toolUtilities_render_spheres.drawSphereNodeGhost(p)` | X-ray ghost of a node: only the part buried in the terrain or a mesh is visible. | 182 |
| `editor_toolUtilities_render_spheres.drawSphereNodeLocked(p)` | Locked node (colourNodeLocked colors). | 137 |
| `editor_toolUtilities_render_spheres.drawSphereRib(p)` | Rib handle: halo then core. | 37 |
| `editor_toolUtilities_render_spheres.getSphereScale(d)` | Sphere scale factor for a distance d to the camera: d capped at 60 m, multiplied by a slope (1/sqrt(30) * 0.8). | 26 |

### Parameter details

#### `editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p)`

Pulsing halo of a hovered navGraph node.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawPathNode(p)`

Path node (colourPathNode).

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p)`

Large pulsing node of the selected navigation graph.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereBar(p)`

Bar handle (halo then core).

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereBarGhost(p)`

X-ray ghost of the bar handle.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereBarHover(p)`

Hovered bar handle: larger pulsing halo.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p)`

X-ray ghost of the corner handle.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col)`

Sphere at the distance-linked scale, if the point is within 600 m.

- `p` (*vec3*) : Center.
- `scale` (*number*) : Scale multiplier.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive)`

Mouse cursor sphere on the map; distance capped at 100 m for the size. Not filtered.

- `p` (*vec3*) : Position.
- `isActive` (*boolean|nil*) : true for the active color, otherwise inactive color.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandle(p)`

Curve apex handle (edge bending, corner radius), green by default.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol)`

Curve handle with core and halo colors chosen by the tool: stable point with soft halo.

- `p` (*vec3*) : Center.
- `coreCol` (*integer*) : Core color.
- `glowCol` (*integer*) : Halo color.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p)`

Hovered curve handle (pulsing halo).

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol)`

Hovered version of drawSphereCurveHandleCol: larger, brighter, pulsing halo.

- `p` (*vec3*) : Center.
- `coreCol` (*integer*) : Core color.
- `glowCol` (*integer*) : Halo color.

#### `editor_toolUtilities_render_spheres.drawSphereHighlight(p)`

Node highlight (colourHighlight, no depth test), filtered at 600 m.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p)`

Node highlight without distance filtering.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightHover(p)`

Pulsing hover highlight, at the distance-linked scale.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius)`

Pulsing hover highlight with fixed world radius.

- `p` (*vec3*) : Center.
- `radius` (*number*) : Base radius in meters.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p)`

Pulsing selection highlight, at the distance-linked scale.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius)`

Pulsing selection highlight with fixed world radius.

- `p` (*vec3*) : Center.
- `radius` (*number*) : Base radius in meters.

#### `editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col)`

Sphere at the distance-linked scale, without distance filtering.

- `p` (*vec3*) : Center.
- `scale` (*number*) : Scale multiplier.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_spheres.drawSphereJunction(p)`

Junction center (halo then core).

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereJunctionDull(p)`

Dimmed junction center.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p)`

X-ray ghost of a junction.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereNode(p)`

Standard node: halo then core.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereNodeDull(p)`

Dimmed node.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereNodeForeground(p)`

Node (halo then core) drawn without depth test.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereNodeGhost(p)`

X-ray ghost of a node: only the part buried in the terrain or a mesh is visible.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereNodeLocked(p)`

Locked node (colourNodeLocked colors).

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.drawSphereRib(p)`

Rib handle: halo then core.

- `p` (*vec3*) : Center.

#### `editor_toolUtilities_render_spheres.getSphereScale(d)`

Sphere scale factor for a distance d to the camera: d capped at 60 m, multiplied by a slope (1/sqrt(30) * 0.8).

- `d` (*number*) : Camera-to-point distance in meters.
- **returns**: number Base scale.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/spheres.lua`.*
