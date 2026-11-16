# `editor_toolUtilities_render_markup`

*File: `lua/ge/extensions/editor/toolUtilities/render/markup.lua` · VM: Game Engine (GE) · 150 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_markup`: `extensions.load("editor_toolUtilities_render_markup")`, then the global `editor_toolUtilities_render_markup`

3D text labels for the spline editing tools (from the old render.lua). Provides the text primitives (filtered or not by distance, normal or inverted colors, via debugDraw.drawTextAdvanced) and all the ready-made labels: cursor prompts ("Click To Add Node"), names, lengths, widths, elevations, speeds, obstacle distances. The texts are in English in the code.

## Notes

- The repetitive labels (names, lengths, per-node values) are filtered at 250 m from the camera; the cursor prompts and a few important labels (elevation, selected name) are not, to stay readable from afar.
- drawMarkupCulledAlwaysShow is identical to drawMarkupCulled in the code (same 250 m threshold): the name does not reflect a different behavior.
- All functions take pos (vec3) as the world position of the text.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_markup.drawMarkupCulled(pos, text)` | Text at pos, displayed only within 250 m of the camera. | 22 |
| `editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text)` | Same behavior as drawMarkupCulled (250 m filter). | 27 |
| `editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text)` | Text filtered at 250 m with inverted text and background colors. | 36 |
| `editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text)` | Text without distance filter, for labels to keep readable at any distance. | 33 |
| `editor_toolUtilities_render_markup.markupActiveSurf(pos)` | Label "[Active Surface (2D)]". | 79 |
| `editor_toolUtilities_render_markup.markupAddNode(pos)` | Prompt "[Click To Add Node]". | 59 |
| `editor_toolUtilities_render_markup.markupAddPairLeft(pos)` | Prompt "[Add Pair: Click 1st Node]". | 70 |
| `editor_toolUtilities_render_markup.markupAddPolygonNode(pos)` | Prompt "[Click To Add Node. Double-Click To Finish]". | 67 |
| `editor_toolUtilities_render_markup.markupAdjustBar(pos)` | Height adjustment prompt (drag, SHIFT for precision). | 63 |
| `editor_toolUtilities_render_markup.markupAdjustDepth(pos)` | Depth adjustment prompt (drag, SHIFT for precision). | 64 |
| `editor_toolUtilities_render_markup.markupAdjustWidth(pos)` | Width adjustment prompt (drag, SHIFT for precision). | 62 |
| `editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad)` | Displays distance (m) and angle (converted from radians to degrees). | 96 |
| `editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff)` | Displays distance, angle (degrees) and altitude difference dZ. | 97 |
| `editor_toolUtilities_render_markup.markupDepthDisplay(pos, d)` | Displays "[d = x.xx m]". | 66 |
| `editor_toolUtilities_render_markup.markupDrag(pos)` | Prompt "[Click To Select, Drag To Move]". | 54 |
| `editor_toolUtilities_render_markup.markupElevation(pos, elev)` | Displays "[Elevation = x.xx m]" without distance filter (only one, on the selected node). | 82 |
| `editor_toolUtilities_render_markup.markupEnd(pos)` | Label "[End]" in inverted colors. | 69 |
| `editor_toolUtilities_render_markup.markupGraphFreeSpace(pos)` | Prompt "[Click NavGraph Node To Add To Path]". | 86 |
| `editor_toolUtilities_render_markup.markupGraphNodeHover(pos)` | Prompt "[Click To Add/Remove From Path]". | 85 |
| `editor_toolUtilities_render_markup.markupInsertNode(pos)` | Prompt "[Click To Insert Node]". | 60 |
| `editor_toolUtilities_render_markup.markupJoin(pos)` | Prompt "[Hold CTRL + Drop To Join]". | 91 |
| `editor_toolUtilities_render_markup.markupLines(pos, lines)` | Several lines joined by line breaks into a single filtered label. No effect if the list is empty. | 44 |
| `editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos)` | Message "[Linked Spline - Cannot Add Nodes]". | 92 |
| `editor_toolUtilities_render_markup.markupLinkedTip(pos)` | Prompt "[Linked — Drag Away Or Use Detach Button]". | 55 |
| `editor_toolUtilities_render_markup.markupLoop(pos)` | Prompt "[Hold CTRL + Drop To Form Loop]". The masterSpline sequence conditions junctions and loops on CTRL: the preview appears as soon as a candidate exists, but releasing only validates with CTRL held. | 90 |
| `editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos)` | Message "[Looped Spline - Cannot Add Here]". | 93 |
| `editor_toolUtilities_render_markup.markupNode1(pos)` | Label "Node [1]". | 73 |
| `editor_toolUtilities_render_markup.markupNode2(pos)` | Label "Node [2]". | 74 |
| `editor_toolUtilities_render_markup.markupNode3(pos)` | Label "Node [3]". | 75 |
| `editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist)` | Displays "[Obstacle: x.x m]". | 94 |
| `editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff)` | Displays the distance to the obstacle and the altitude difference dZ. | 95 |
| `editor_toolUtilities_render_markup.markupPairFirstNode(pos)` | Label "[Pair: First Node]". | 71 |
| `editor_toolUtilities_render_markup.markupPairSecondNode(pos)` | Prompt: left click adds the 2nd node, right click cancels the pair. | 72 |
| `editor_toolUtilities_render_markup.markupPathNode(pos, i)` | Label "Path Node [i]". | 87 |
| `editor_toolUtilities_render_markup.markupPrompt(pos, text)` | Cursor prompt: unfiltered text. | 43 |
| `editor_toolUtilities_render_markup.markupRoadLength(pos, l)` | Label "[Length = x.xx m]" in inverted colors. | 61 |
| `editor_toolUtilities_render_markup.markupSelectOrAdd(pos)` | Prompt "[Select A Spline Or Click 'Add']". | 58 |
| `editor_toolUtilities_render_markup.markupSelectSpline(pos)` | Prompt "[Click To Select Spline]". | 56 |
| `editor_toolUtilities_render_markup.markupSelectedName(pos, str)` | Same label for the item being edited, unfiltered. | 78 |
| `editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos)` | Prompt "[Spline Disabled. Cannot Edit]". | 57 |
| `editor_toolUtilities_render_markup.markupSplineName(pos, str)` | Spline name in brackets, filtered at 250 m. | 76 |
| `editor_toolUtilities_render_markup.markupStack(pos, lines)` | Draws each line as a separate label at the same position (they overlap). | 48 |
| `editor_toolUtilities_render_markup.markupStart(pos)` | Label "[Start]" in inverted colors. | 68 |
| `editor_toolUtilities_render_markup.markupText(pos, text)` | Simple filtered text. | 42 |
| `editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg)` | Displays "[Twist Angle = x.xx deg]". | 83 |
| `editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr)` | Displays "[Limit\|Velocity = x.xx unit]". | 84 |
| `editor_toolUtilities_render_markup.markupVolume(pos)` | Label "[Active Volume (3D)]". | 80 |
| `editor_toolUtilities_render_markup.markupWidthDisplay(pos, w)` | Displays "[Width = x.xx m]". | 65 |

### Parameter details

#### `editor_toolUtilities_render_markup.drawMarkupCulled(pos, text)`

Text at pos, displayed only within 250 m of the camera.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Text.

#### `editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text)`

Same behavior as drawMarkupCulled (250 m filter).

- `pos` (*vec3*) : Position.
- `text` (*string*) : Text.

#### `editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text)`

Text filtered at 250 m with inverted text and background colors.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Text.

#### `editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text)`

Text without distance filter, for labels to keep readable at any distance.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Text.

#### `editor_toolUtilities_render_markup.markupActiveSurf(pos)`

Label "[Active Surface (2D)]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAddNode(pos)`

Prompt "[Click To Add Node]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAddPairLeft(pos)`

Prompt "[Add Pair: Click 1st Node]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAddPolygonNode(pos)`

Prompt "[Click To Add Node. Double-Click To Finish]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAdjustBar(pos)`

Height adjustment prompt (drag, SHIFT for precision).

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAdjustDepth(pos)`

Depth adjustment prompt (drag, SHIFT for precision).

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAdjustWidth(pos)`

Width adjustment prompt (drag, SHIFT for precision).

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad)`

Displays distance (m) and angle (converted from radians to degrees).

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance in meters.
- `angleRad` (*number*) : Angle in radians.

#### `editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff)`

Displays distance, angle (degrees) and altitude difference dZ.

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance in meters.
- `angleRad` (*number*) : Angle in radians.
- `elevDiff` (*number*) : Altitude difference in meters.

#### `editor_toolUtilities_render_markup.markupDepthDisplay(pos, d)`

Displays "[d = x.xx m]".

- `pos` (*vec3*) : Position.
- `d` (*number*) : Depth in meters.

#### `editor_toolUtilities_render_markup.markupDrag(pos)`

Prompt "[Click To Select, Drag To Move]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupElevation(pos, elev)`

Displays "[Elevation = x.xx m]" without distance filter (only one, on the selected node).

- `pos` (*vec3*) : Position.
- `elev` (*number*) : Elevation in meters.

#### `editor_toolUtilities_render_markup.markupEnd(pos)`

Label "[End]" in inverted colors.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupGraphFreeSpace(pos)`

Prompt "[Click NavGraph Node To Add To Path]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupGraphNodeHover(pos)`

Prompt "[Click To Add/Remove From Path]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupInsertNode(pos)`

Prompt "[Click To Insert Node]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupJoin(pos)`

Prompt "[Hold CTRL + Drop To Join]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLines(pos, lines)`

Several lines joined by line breaks into a single filtered label. No effect if the list is empty.

- `pos` (*vec3*) : Position.
- `lines` (*string[]*) : Lines of text.

#### `editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos)`

Message "[Linked Spline - Cannot Add Nodes]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLinkedTip(pos)`

Prompt "[Linked — Drag Away Or Use Detach Button]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLoop(pos)`

Prompt "[Hold CTRL + Drop To Form Loop]". The masterSpline sequence conditions junctions and loops on CTRL: the preview appears as soon as a candidate exists, but releasing only validates with CTRL held.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos)`

Message "[Looped Spline - Cannot Add Here]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupNode1(pos)`

Label "Node [1]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupNode2(pos)`

Label "Node [2]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupNode3(pos)`

Label "Node [3]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist)`

Displays "[Obstacle: x.x m]".

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance in meters.

#### `editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff)`

Displays the distance to the obstacle and the altitude difference dZ.

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance in meters.
- `elevDiff` (*number*) : Altitude difference in meters.

#### `editor_toolUtilities_render_markup.markupPairFirstNode(pos)`

Label "[Pair: First Node]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupPairSecondNode(pos)`

Prompt: left click adds the 2nd node, right click cancels the pair.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupPathNode(pos, i)`

Label "Path Node [i]".

- `pos` (*vec3*) : Position.
- `i` (*integer*) : Node number.

#### `editor_toolUtilities_render_markup.markupPrompt(pos, text)`

Cursor prompt: unfiltered text.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Text.

#### `editor_toolUtilities_render_markup.markupRoadLength(pos, l)`

Label "[Length = x.xx m]" in inverted colors.

- `pos` (*vec3*) : Position.
- `l` (*number*) : Length in meters.

#### `editor_toolUtilities_render_markup.markupSelectOrAdd(pos)`

Prompt "[Select A Spline Or Click 'Add']".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupSelectSpline(pos)`

Prompt "[Click To Select Spline]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupSelectedName(pos, str)`

Same label for the item being edited, unfiltered.

- `pos` (*vec3*) : Position.
- `str` (*string*) : Name.

#### `editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos)`

Prompt "[Spline Disabled. Cannot Edit]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupSplineName(pos, str)`

Spline name in brackets, filtered at 250 m.

- `pos` (*vec3*) : Position.
- `str` (*string*) : Name.

#### `editor_toolUtilities_render_markup.markupStack(pos, lines)`

Draws each line as a separate label at the same position (they overlap).

- `pos` (*vec3*) : Position.
- `lines` (*string[]*) : Lines of text.

#### `editor_toolUtilities_render_markup.markupStart(pos)`

Label "[Start]" in inverted colors.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupText(pos, text)`

Simple filtered text.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Text.

#### `editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg)`

Displays "[Twist Angle = x.xx deg]".

- `pos` (*vec3*) : Position.
- `angleDeg` (*number*) : Angle in degrees.

#### `editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr)`

Displays "[Limit|Velocity = x.xx unit]".

- `pos` (*vec3*) : Position.
- `vel` (*number*) : Value.
- `isBarsLimit` (*boolean*) : true: Limit label, false: Velocity.
- `unitsStr` (*string*) : Displayed unit.

#### `editor_toolUtilities_render_markup.markupVolume(pos)`

Label "[Active Volume (3D)]".

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupWidthDisplay(pos, w)`

Displays "[Width = x.xx m]".

- `pos` (*vec3*) : Position.
- `w` (*number*) : Width in meters.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/markup.lua`.*
