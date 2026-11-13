# `editor_toolUtilities_render_markup`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/markup.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_markup` : `extensions.load("editor_toolUtilities_render_markup")`, puis la globale `editor_toolUtilities_render_markup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_markup.drawMarkupCulled(pos, text)` | Labels that repeat (names, lengths, per-node values) cull at a shorter distance (250 m; 250*250 squared) than<br> geometry, so a zoomed-out view doesn't flood. Cursor prompts are only ever one at a time and draw unculled, so they<br> still read from high above while planning. | 22 |
| `editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text)` |  | 27 |
| `editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text)` |  | 36 |
| `editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text)` | Drawn WITHOUT the distance cull, for the one or two labels that must stay readable however far the camera pulls back. | 33 |
| `editor_toolUtilities_render_markup.markupActiveSurf(pos)` |  | 79 |
| `editor_toolUtilities_render_markup.markupAddNode(pos)` |  | 59 |
| `editor_toolUtilities_render_markup.markupAddPairLeft(pos)` |  | 70 |
| `editor_toolUtilities_render_markup.markupAddPolygonNode(pos)` |  | 67 |
| `editor_toolUtilities_render_markup.markupAdjustBar(pos)` |  | 63 |
| `editor_toolUtilities_render_markup.markupAdjustDepth(pos)` |  | 64 |
| `editor_toolUtilities_render_markup.markupAdjustWidth(pos)` |  | 62 |
| `editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad)` |  | 96 |
| `editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff)` |  | 97 |
| `editor_toolUtilities_render_markup.markupDepthDisplay(pos, d)` |  | 66 |
| `editor_toolUtilities_render_markup.markupDrag(pos)` |  | 54 |
| `editor_toolUtilities_render_markup.markupElevation(pos, elev)` | Elevation is drawn WITHOUT the distance cull (there's only ever one, on the selected node) so it stays readable when zoomed out. | 82 |
| `editor_toolUtilities_render_markup.markupEnd(pos)` |  | 69 |
| `editor_toolUtilities_render_markup.markupGraphFreeSpace(pos)` |  | 86 |
| `editor_toolUtilities_render_markup.markupGraphNodeHover(pos)` |  | 85 |
| `editor_toolUtilities_render_markup.markupInsertNode(pos)` |  | 60 |
| `editor_toolUtilities_render_markup.markupJoin(pos)` |  | 91 |
| `editor_toolUtilities_render_markup.markupLines(pos, lines)` |  | 44 |
| `editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos)` |  | 92 |
| `editor_toolUtilities_render_markup.markupLinkedTip(pos)` |  | 55 |
| `editor_toolUtilities_render_markup.markupLoop(pos)` | The whole masterSpline suite gates joins/loops on CTRL (see splineInput): the preview shows whenever a candidate<br> exists, and the release only commits while CTRL is held. | 90 |
| `editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos)` |  | 93 |
| `editor_toolUtilities_render_markup.markupNode1(pos)` |  | 73 |
| `editor_toolUtilities_render_markup.markupNode2(pos)` |  | 74 |
| `editor_toolUtilities_render_markup.markupNode3(pos)` |  | 75 |
| `editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist)` |  | 94 |
| `editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff)` |  | 95 |
| `editor_toolUtilities_render_markup.markupPairFirstNode(pos)` |  | 71 |
| `editor_toolUtilities_render_markup.markupPairSecondNode(pos)` |  | 72 |
| `editor_toolUtilities_render_markup.markupPathNode(pos, i)` |  | 87 |
| `editor_toolUtilities_render_markup.markupPrompt(pos, text)` |  | 43 |
| `editor_toolUtilities_render_markup.markupRoadLength(pos, l)` |  | 61 |
| `editor_toolUtilities_render_markup.markupSelectOrAdd(pos)` |  | 58 |
| `editor_toolUtilities_render_markup.markupSelectSpline(pos)` |  | 56 |
| `editor_toolUtilities_render_markup.markupSelectedName(pos, str)` | The same label for the one thing being worked on, which stays legible from any distance. | 78 |
| `editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos)` |  | 57 |
| `editor_toolUtilities_render_markup.markupSplineName(pos, str)` |  | 76 |
| `editor_toolUtilities_render_markup.markupStack(pos, lines)` |  | 48 |
| `editor_toolUtilities_render_markup.markupStart(pos)` |  | 68 |
| `editor_toolUtilities_render_markup.markupText(pos, text)` |  | 42 |
| `editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg)` |  | 83 |
| `editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr)` |  | 84 |
| `editor_toolUtilities_render_markup.markupVolume(pos)` |  | 80 |
| `editor_toolUtilities_render_markup.markupWidthDisplay(pos, w)` |  | 65 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/markup.lua`.*
