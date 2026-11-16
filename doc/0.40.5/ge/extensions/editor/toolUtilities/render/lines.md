# `editor_toolUtilities_render_lines`

*File: `lua/ge/extensions/editor/toolUtilities/render/lines.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_lines`: `extensions.load("editor_toolUtilities_render_lines")`, then the global `editor_toolUtilities_render_lines`

Debug line drawing for the editor's spline editing tools (from the old monolithic render.lua). Each function draws a segment p0-p1 with the style (color, thickness) matching a use: spline, wireframe, elevation drop line, normal, navigation, etc. Leaf module: depends on utils/debugDraw, the shared style and util (blue-to-red color ramp).

## Example

```lua
local rLines = require('editor/toolUtilities/render/lines')
rLines.drawSplineLine(vec3(0,0,10), vec3(5,0,10))
```

## Notes

- The "culled" variants only draw if BOTH endpoints are within 600 m of the camera; drawSplineLine, drawArcSegment, drawJoinLine and drawLineImmediate are not filtered.
- Colors are packed integers (color() function) coming from editor/toolUtilities/style.
- drawWireFrameLine modifies p0.z and p1.z by +0.05 (side effect on the arguments) while its copies offsetP0/offsetP1 are drawn without the offset: the intended offset is not applied to the drawing.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1)` | Active segment (colourLayerWire, thickness 2). | 62 |
| `editor_toolUtilities_render_lines.drawArcSegment(p0, p1)` | Arc segment (colourArcSeg, thickness arcSegThickness). Not filtered by distance. | 98 |
| `editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim)` | Bar ceiling line, colored according to v on the blue-to-red ramp. | 86 |
| `editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim)` | Elevation drop line colored according to value v on the blue-to-red ramp between 0 and lim. | 71 |
| `editor_toolUtilities_render_lines.drawDropLineDull(p0, p1)` | Dimmed drop line (colourDropDull). | 73 |
| `editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim)` | Like drawDropLine with thickness dropThicknessThicker. | 72 |
| `editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim)` | Soft, thin, translucent drop line (alpha 110), for selected nodes or junction centers. Hue according to \|v\| / lim (lim is 100 by default). | 75 |
| `editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col)` | Draws a line over the geometry (no depth test) via debugDrawer:drawLine. | 34 |
| `editor_toolUtilities_render_lines.drawGroundLine(p0, p1)` | Ground line (colourGround). | 65 |
| `editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1)` | Dimmed ground line (colourGroundDull). | 68 |
| `editor_toolUtilities_render_lines.drawJoinLine(p0, p1)` | Junction/loop line with thickness pulsing over time (os.clock, loopPulseHz). Not filtered by distance. | 99 |
| `editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col)` | Draws a line only if both endpoints are within 600 m of the camera. | 27 |
| `editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col)` | Draws a line without distance filtering (debugDraw.drawLineInstance_MinArg). | 25 |
| `editor_toolUtilities_render_lines.drawNavLine(p0, p1)` | Navigation graph line (colourNav). | 84 |
| `editor_toolUtilities_render_lines.drawNormalLine(p0, p1)` | Normal line (colourNormal). | 82 |
| `editor_toolUtilities_render_lines.drawPathLine(p0, p1)` | Path line (colourPath). | 85 |
| `editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1)` | Preview wireframe (colourPreviewWire). | 55 |
| `editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1)` | Reference normal line (colourRefNormal). | 83 |
| `editor_toolUtilities_render_lines.drawRibLine(p0, p1)` | Rib line: halo pass (colourRibGlow) then core pass (colourRibLine). | 58 |
| `editor_toolUtilities_render_lines.drawSplineLine(p0, p1)` | Selected spline line: halo (thickness 4) then core (thickness 2). Not filtered by distance. | 94 |
| `editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1)` | Dimmed spline line (colourSplineDull). | 88 |
| `editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1)` | Foreground spline line (color colourSplineForegroundF). | 38 |
| `editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1)` | Spline line linked to another (colourSplineLinked). | 87 |
| `editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1)` | Unselected spline line (colourSplineDull, thickness 2). | 91 |
| `editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1)` | Right-angle mark line (colourSquareCorner). | 80 |
| `editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1)` | Foreground right-angle mark (colourSquareCornerF). | 81 |
| `editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1)` | Layer wireframe (colourLayerWire, thickness 2). | 42 |
| `editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1)` | Second layer wireframe (colourLayerWire2). | 49 |
| `editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1)` | Third layer wireframe (colourLayerWire3). | 52 |

### Parameter details

#### `editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1)`

Active segment (colourLayerWire, thickness 2).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawArcSegment(p0, p1)`

Arc segment (colourArcSeg, thickness arcSegThickness). Not filtered by distance.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim)`

Bar ceiling line, colored according to v on the blue-to-red ramp.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `v` (*number*) : Value.
- `lim` (*number*) : Maximum of the ramp.

#### `editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim)`

Elevation drop line colored according to value v on the blue-to-red ramp between 0 and lim.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `v` (*number*) : Value to represent.
- `lim` (*number*) : Maximum value of the ramp.

#### `editor_toolUtilities_render_lines.drawDropLineDull(p0, p1)`

Dimmed drop line (colourDropDull).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim)`

Like drawDropLine with thickness dropThicknessThicker.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `v` (*number*) : Value.
- `lim` (*number*) : Maximum of the ramp.

#### `editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim)`

Soft, thin, translucent drop line (alpha 110), for selected nodes or junction centers. Hue according to |v| / lim (lim is 100 by default).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `v` (*number*) : Value (absolute value used).
- `lim` (*number|nil*) : Maximum of the ramp, default 100.

#### `editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col)`

Draws a line over the geometry (no depth test) via debugDrawer:drawLine.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_lines.drawGroundLine(p0, p1)`

Ground line (colourGround).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1)`

Dimmed ground line (colourGroundDull).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawJoinLine(p0, p1)`

Junction/loop line with thickness pulsing over time (os.clock, loopPulseHz). Not filtered by distance.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col)`

Draws a line only if both endpoints are within 600 m of the camera.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `thickness` (*number*) : Thickness.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col)`

Draws a line without distance filtering (debugDraw.drawLineInstance_MinArg).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.
- `thickness` (*number*) : Thickness.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_lines.drawNavLine(p0, p1)`

Navigation graph line (colourNav).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawNormalLine(p0, p1)`

Normal line (colourNormal).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawPathLine(p0, p1)`

Path line (colourPath).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1)`

Preview wireframe (colourPreviewWire).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1)`

Reference normal line (colourRefNormal).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawRibLine(p0, p1)`

Rib line: halo pass (colourRibGlow) then core pass (colourRibLine).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSplineLine(p0, p1)`

Selected spline line: halo (thickness 4) then core (thickness 2). Not filtered by distance.

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1)`

Dimmed spline line (colourSplineDull).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1)`

Foreground spline line (color colourSplineForegroundF).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1)`

Spline line linked to another (colourSplineLinked).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1)`

Unselected spline line (colourSplineDull, thickness 2).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1)`

Right-angle mark line (colourSquareCorner).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1)`

Foreground right-angle mark (colourSquareCornerF).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1)`

Layer wireframe (colourLayerWire, thickness 2).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1)`

Second layer wireframe (colourLayerWire2).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

#### `editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1)`

Third layer wireframe (colourLayerWire3).

- `p0` (*vec3*) : Start.
- `p1` (*vec3*) : End.

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/lines.lua`.*
