# `editor_heroRoadEditor_heatmap`

*File: `lua/ge/extensions/editor/heroRoadEditor/heatmap.lua` · VM: Game Engine (GE) · 188 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_heatmap`: `extensions.load("editor_heroRoadEditor_heatmap")`, then the global `editor_heroRoadEditor_heatmap`

Compliance heat map (slope and corner radius) of the Hero Road Editor. compute() scores each station of the group's centerline from 0 (compliant) to 1 (total violation) according to the chosen road class (group.roadClass) and stores the result in group.heatGrade / group.heatRadius. draw() paints a blue-to-red colored ribbon on the roadway of the selected road.

## Notes

- Road classes (minRadiusM / maxGradePct): highway 200 m / 6 %, rural 90 m / 8 %, urban 40 m / 12 %, mountain 15 m / 15 %, rally 8 m / 20 %. Default class: rural if group.roadClass is unknown.
- Radius score: 0 above 2*minR, linear ramp from 2*minR to minR, 1 below minR. It is weighted by the deflection of the nearest node (0 below 1 degree, 1 from 5 degrees, smoothing in between) to ignore mere tangent kinks.
- Slope score: 0 up to the class limit, 1 from 2 times the limit.
- Curvature and slope are smoothed twice over a half-window of 4 m (smoothByDistance). The exact curvature comes from group.divCurv (engineered mode, clothoids), otherwise from a finite difference.
- compute() does nothing if group.divPoints has fewer than 3 points (emptied tables); draw() requires heatGrade, heatRadius, divWidths and binormals.
- The ribbon is raised by 0.10 m and drawn in both winding directions to be visible from all angles.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_heatmap.compute(group)` | Fills group.heatGrade[i] and group.heatRadius[i] (0 compliant to 1 total violation) for each station of group.divPoints. To be called when the geometry changes or every display frame. | 40 |
| `editor_heroRoadEditor_heatmap.draw(group, metric)` | Draws the solid violation ribbon for the selected road: two half-panels per segment (left edge to crown, crown to right edge), colored by util.getHueBasedColour255 (alpha 210) according to the metric. | 159 |

### Parameter details

#### `editor_heroRoadEditor_heatmap.compute(group)`

Fills group.heatGrade[i] and group.heatRadius[i] (0 compliant to 1 total violation) for each station of group.divPoints. To be called when the geometry changes or every display frame.

- `group` (*table*) : Hero Road group (divPoints, divCurv, divWidths, nodes, discMap, roadClass).

#### `editor_heroRoadEditor_heatmap.draw(group, metric)`

Draws the solid violation ribbon for the selected road: two half-panels per segment (left edge to crown, crown to right edge), colored by util.getHueBasedColour255 (alpha 210) according to the metric.

- `group` (*table*) : Hero Road group after compute().
- `metric` (*string*) : 'grade' or 'radius'; any other value is treated as 'grade'.

## Fields

| Field | Type | Description |
|---|---|---|
| `classOrder` | string[] | Display order of the classes: highway, rural, urban, mountain, rally. |
| `classes` | table<string, table> | Road classes keyed by id ('highway', 'rural', 'urban', 'mountain', 'rally'), each with label, minRadiusM (m), maxGradePct (%) and desc. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/heatmap.lua`.*
