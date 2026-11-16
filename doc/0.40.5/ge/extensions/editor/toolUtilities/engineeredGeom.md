# `editor_toolUtilities_engineeredGeom`

*File: `lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua` · VM: Game Engine (GE) · 699 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_engineeredGeom`: `extensions.load("editor_toolUtilities_engineeredGeom")`, then the global `editor_toolUtilities_engineeredGeom`

'Engineer' road geometry for the editor's spline editing tools: transforms the polyline of a spline's nodes into a line - clothoid - arc - clothoid - line axis (rounded turns with adaptive radius, smoothed vertical profile, widening in tight turns). The tools call it via sampleInto according to group.geometryMode ('engineered' or 'spline'). It fills the spline's divPoints, divWidths, normals, divCurv and discMap, then computes the Frenet frame via geom.computeFrenetFrame.

## Example

```lua
local eng = require('editor/toolUtilities/engineeredGeom')
eng.applyDefaults(group)
if not eng.sampleInto(group, {zMode = 'free', lonRes = 1.5}) then
  -- spline mode: the tool samples itself with geom.catmullRom*
end
```

## Notes

- Units: meters and radians. Default constants: radius 40 m, transition (clothoid) 15 m, minimum radius 8 m, minimum angle 0.75 degree (below it, the node is passed through without rounding), max widening 2.5 m, vertical smoothing length 40 m.
- Loops (spline.isLoop) and splines with fewer than 3 nodes have no inner turn: buildCenterline falls back to geom.catmullRomRaycast / catmullRomConformToTerrain / catmullRomFree depending on zMode, and sets divCurv to nil.
- The radius is fitted on hard arcs (Ls = 0) and the spirals are added afterwards: the transition therefore never influences the retained radius. Per-node overrides exist in spline.corners[i] ({ radiusM, taperM }).
- sampleInto does not pass minAngleDeg or stepM to buildCenterline; only minR, lonRes, deckZ, maxStep, zMode, levelStart and levelFinish are carried over.
- The module relies on editor/toolUtilities/geom, util and style.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_engineeredGeom.applyDefaults(group)` | Completes a group with the engineered mode fields only if they are nil (geometryMode = 'spline', engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners = {}). To be called when a group is created and when deserializing old sessions. | 574 |
| `editor_toolUtilities_engineeredGeom.buildCenterline(spline, p)` | Builds the spline's plan axis from its nodes (turns with clothoids), then the vertical profile according to zMode, and updates spline.divPoints, divWidths, normals, divCurv, discMap before calling geom.computeFrenetFrame. Returns nothing (except for the Catmull-Rom fallback). | 290 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p)` | Wrapper of buildCenterline with zMode = 'conform' (axis conforming to the terrain). | 556 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p)` | Wrapper of buildCenterline with zMode = 'free' (free node heights). | 548 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p)` | Wrapper of buildCenterline with zMode = 'raycast' (axis placed on the terrain by raycast). | 552 |
| `editor_toolUtilities_engineeredGeom.drawControlPolygon(group)` | Draws in debugDrawer, for a group in engineered mode: the node polygon (thin guide), a sphere on each inner node and the resulting axis colored by curvature (turquoise on a straight line, amber at the tightest turn). Fades with camera distance (full below 90 m, invisible beyond 550 m). No effect outside 'engineered' mode or with fewer than 2 nodes. | 603 |
| `editor_toolUtilities_engineeredGeom.sampleInto(group, opts)` | Single sampling entry point according to group.geometryMode. In 'engineered' mode, calls buildCenterline with the group's eng* fields and returns true. Otherwise, sets group.divCurv to nil and returns false so that the tool runs its own geom.catmullRom* sampler. | 591 |
| `editor_toolUtilities_engineeredGeom.selfTest()` | Manual self-test: builds a 90 degree turn (R 30, Ls 20) and logs the number of points, the max gap between points and the max bend per step. | 657 |
| `editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle)` | Resolves the geometry of a turn at node pI: signed deviation, radius, spiral length (reduced to R*\|delta\| if too long), spiral angle, arc angle and tangent distance T absorbed on each neighboring straight line. Works in plan (x, y). Returns { through = true, T = 0 } if a segment is nearly zero or if the deviation is below minAngle. | 62 |

### Parameter details

#### `editor_toolUtilities_engineeredGeom.applyDefaults(group)`

Completes a group with the engineered mode fields only if they are nil (geometryMode = 'spline', engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners = {}). To be called when a group is created and when deserializing old sessions.

- `group` (*table*) : Group modified in place.

#### `editor_toolUtilities_engineeredGeom.buildCenterline(spline, p)`

Builds the spline's plan axis from its nodes (turns with clothoids), then the vertical profile according to zMode, and updates spline.divPoints, divWidths, normals, divCurv, discMap before calling geom.computeFrenetFrame. Returns nothing (except for the Catmull-Rom fallback).

- `spline` (*table*) : Spline with nodes, widths, nmls, divPoints, divWidths, normals, discMap (and optionally isLoop, corners).
- `p` (*table|nil*) : { R, Ls, minR, minAngleDeg, stepM, lonRes, vertLen, deckZ, maxStep, levelStart, levelFinish, zMode = 'free'|'raycast'|'conform' }.

#### `editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p)`

Wrapper of buildCenterline with zMode = 'conform' (axis conforming to the terrain).

- `spline` (*table*) : Spline.
- `p` (*table|nil*) : Parameters (see buildCenterline); p.zMode is overwritten.

#### `editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p)`

Wrapper of buildCenterline with zMode = 'free' (free node heights).

- `spline` (*table*) : Spline.
- `p` (*table|nil*) : Parameters (see buildCenterline); p.zMode is overwritten.

#### `editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p)`

Wrapper of buildCenterline with zMode = 'raycast' (axis placed on the terrain by raycast).

- `spline` (*table*) : Spline.
- `p` (*table|nil*) : Parameters (see buildCenterline); p.zMode is overwritten.

#### `editor_toolUtilities_engineeredGeom.drawControlPolygon(group)`

Draws in debugDrawer, for a group in engineered mode: the node polygon (thin guide), a sphere on each inner node and the resulting axis colored by curvature (turquoise on a straight line, amber at the tightest turn). Fades with camera distance (full below 90 m, invisible beyond 550 m). No effect outside 'engineered' mode or with fewer than 2 nodes.

- `group` (*table|nil*) : Group/spline to draw.

#### `editor_toolUtilities_engineeredGeom.sampleInto(group, opts)`

Single sampling entry point according to group.geometryMode. In 'engineered' mode, calls buildCenterline with the group's eng* fields and returns true. Otherwise, sets group.divCurv to nil and returns false so that the tool runs its own geom.catmullRom* sampler.

- `group` (*table*) : Group/spline with geometryMode, engRadiusM, engTransM, engVertLenM.
- `opts` (*table|nil*) : { zMode = 'free'|'raycast'|'conform' (default 'free'), lonRes, deckZ, maxStep, minR, levelStart, levelFinish }. levelStart/levelFinish: in free mode, this end joins a flat platform, the profile arrives flat.
- **returns**: boolean true if the engineered mode sampled, false if the caller must do it.

#### `editor_toolUtilities_engineeredGeom.selfTest()`

Manual self-test: builds a 90 degree turn (R 30, Ls 20) and logs the number of points, the max gap between points and the max bend per step.

- **returns**: integer Number of generated axis points.

#### `editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle)`

Resolves the geometry of a turn at node pI: signed deviation, radius, spiral length (reduced to R*|delta| if too long), spiral angle, arc angle and tangent distance T absorbed on each neighboring straight line. Works in plan (x, y). Returns { through = true, T = 0 } if a segment is nearly zero or if the deviation is below minAngle.

- `pPrev` (*vec3*) : Previous node.
- `pI` (*vec3*) : Turn node (intersection point).
- `pNext` (*vec3*) : Next node.
- `R` (*number*) : Desired arc radius (m).
- `Ls` (*number*) : Desired spiral length (m).
- `minAngle` (*number*) : Minimum deviation (rad) below which no rounding is done.
- **returns**: table { through, delta, absD, turn (+1 left, -1 right), R, Ls, thetaS, arc, T }.

## Fields

| Field | Type | Description |
|---|---|---|
| `CONTROLS` | table | Metadata for the inspector, so that all tools display the same sliders: radius, transition, vertical, widthTaper, widenAmount (each with key, default, min, max, fmt, label, tooltip) and the tooltips toggleTooltip, modeEngTip, modeSmoothTip. |
| `DEFAULT_MIN_R` | number | Floor radius of a turn (8.0 m). |

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua`.*
