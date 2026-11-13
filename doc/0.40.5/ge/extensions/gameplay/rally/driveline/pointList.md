# `gameplay_rally_driveline_pointList`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/pointList.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/pointList")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_pointList")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateLength()` | Calculate total length of the point list | 76 |
| `C:count()` | Get number of points | 91 |
| `C:createPoint(pos, quat, ts)` | Create a new point with the standard format | 17 |
| `C:downsample()` | Downsample stub (for compatibility with DrivelineRoute)<br> DrivelineV3 already performs simplification, so this just returns self | 134 |
| `C:drawDebug(drawLabels)` | Draw debug visualization of all points | 139 |
| `C:findNearestPoint(srcPos)` | Find nearest point to a given position | 113 |
| `C:get(index)` | Get point at index | 96 |
| `C:getAll()` | Get all points | 101 |
| `C:init(points)` | PointList represents a series of points along a path<br> Each point has: pos, quat, ts, normal, prev, next, id, pacenoteDistances, cachedPacenotes | 12 |
| `C:setAll(points)` | Set all points (and update relationships/normals) | 106 |
| `C:setupPointNormals()` | Calculate and set normals for all points | 56 |
| `C:setupPointRelationships()` | Set up prev/next relationships and IDs for all points | 39 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/pointList.lua`.*
