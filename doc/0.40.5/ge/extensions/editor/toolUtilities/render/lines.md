# `editor_toolUtilities_render_lines`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/lines.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_lines` : `extensions.load("editor_toolUtilities_render_lines")`, puis la globale `editor_toolUtilities_render_lines`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1)` |  | 62 |
| `editor_toolUtilities_render_lines.drawArcSegment(p0, p1)` | Not culled. | 98 |
| `editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim)` |  | 86 |
| `editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim)` |  | 71 |
| `editor_toolUtilities_render_lines.drawDropLineDull(p0, p1)` |  | 73 |
| `editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim)` |  | 72 |
| `editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim)` | Soft elev drop for selected nodes / junction centres (thin, translucent). | 75 |
| `editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col)` |  | 34 |
| `editor_toolUtilities_render_lines.drawGroundLine(p0, p1)` |  | 65 |
| `editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1)` |  | 68 |
| `editor_toolUtilities_render_lines.drawJoinLine(p0, p1)` | Not culled. | 99 |
| `editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col)` |  | 27 |
| `editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col)` | Public interface. | 25 |
| `editor_toolUtilities_render_lines.drawNavLine(p0, p1)` |  | 84 |
| `editor_toolUtilities_render_lines.drawNormalLine(p0, p1)` |  | 82 |
| `editor_toolUtilities_render_lines.drawPathLine(p0, p1)` |  | 85 |
| `editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1)` |  | 55 |
| `editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1)` |  | 83 |
| `editor_toolUtilities_render_lines.drawRibLine(p0, p1)` |  | 58 |
| `editor_toolUtilities_render_lines.drawSplineLine(p0, p1)` |  | 94 |
| `editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1)` |  | 88 |
| `editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1)` |  | 38 |
| `editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1)` |  | 87 |
| `editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1)` |  | 91 |
| `editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1)` |  | 80 |
| `editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1)` |  | 81 |
| `editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1)` |  | 42 |
| `editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1)` |  | 49 |
| `editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1)` |  | 52 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/lines.lua`.*
