# `ui_apps_minimap_utils`

*Fichier : `lua/ge/extensions/ui/apps/minimap/utils.lua` · VM : Game Engine (GE) · 391 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_utils` : `extensions.load("ui_apps_minimap_utils")`, puis la globale `ui_apps_minimap_utils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer)` |  | 152 |
| `ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance)` | Edge pointer function: returns false if the position is inside of the minimap (nothing drawn)<br> the border color is always clrNavBg and the stroke is always white, strikeClr is unused | 213 |
| `ui_apps_minimap_utils.drawGrid()` | Grid drawing function | 251 |
| `ui_apps_minimap_utils.getCurrentStyleColors()` | Getter for current style colors | 385 |
| `ui_apps_minimap_utils.getDefaultStyleColorSet()` | Getter for default style color set index | 380 |
| `ui_apps_minimap_utils.getStyleColorSet()` | Getter for StyleColorSet | 375 |
| `ui_apps_minimap_utils.getWorldToMapTransform()` |  | 108 |
| `ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer)` | Utility functions | 144 |
| `ui_apps_minimap_utils.mapToWorld(p)` |  | 135 |
| `ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance)` | Returns the clamped position and a flag indicating whether clamping happened | 159 |
| `ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi)` | Setter function to update state from main minimap | 37 |
| `ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius)` |  | 203 |
| `ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius)` |  | 217 |
| `ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr)` |  | 207 |
| `ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr)` |  | 224 |
| `ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2)` |  | 101 |
| `ui_apps_minimap_utils.worldToMap(p)` | Transform functions | 73 |
| `ui_apps_minimap_utils.worldToMapXY(x, y)` |  | 96 |
| `ui_apps_minimap_utils.worldToMapXYZ(target, source)` | local x = (source.x - camPos.x) * scaleInverse * camFwd.x + (source.y - camPos.y) * scaleInverse * camRight.x<br>local y = (source.x - camPos.x) * scaleInverse * camFwd.y + (source.y - camPos.y) * scaleInverse * camRight.y | 87 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `centerPointer` | any |  ⚠ référence `centerPointer` non définie dans le fichier (vaut probablement nil) |
| `colors` | table | Expose colors |
| `dpi` | number |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/utils.lua`.*
