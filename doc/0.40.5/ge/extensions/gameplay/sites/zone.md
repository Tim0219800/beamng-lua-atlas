# `gameplay_sites_zone`

*Fichier : `lua/ge/extensions/gameplay/sites/zone.lua` · VM : Game Engine (GE) · 501 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/zone")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_sites_zone")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:aabbCheck(point)` |  | 197 |
| `C:addVertex(pos, index)` |  | 72 |
| `C:autoPlanes(ignoreTop, ignoreBot)` | creates some automatically gnrated planes 5m above/below the highest/lowest vertex, aligned to the x/y plane. | 143 |
| `C:changedPlanes()` |  | 132 |
| `C:containsPoint2D(point)` |  | 252 |
| `C:containsVehicle(veh, basic)` |  | 275 |
| `C:drawDebug(drawMode, clr, customHeight, customDown, nearCam, drawDistance)` |  | 291 |
| `C:drawFence(from, to, clrI, down, up, usePlanes, nearCam, drawDistance, shapeAlpha)` |  | 393 |
| `C:drawMinimap(td)` |  | 380 |
| `C:drawPlane(plane, clrF)` |  | 369 |
| `C:init(sites, name, forceId)` |  | 7 |
| `C:makeHighResolutionFence(maxStep)` |  | 446 |
| `C:onDeserialized(data)` |  | 51 |
| `C:onSerialize()` |  | 26 |
| `C:pointBetweenPlanes(point)` | returns if a point is located between the planes. | 167 |
| `C:processVertices()` | this does some precomputations. | 83 |
| `C:rayIntersectsZone(rayPos, rayDir)` |  | 214 |
| `C:removeVertex(index)` |  | 77 |
| `C:validPlanes()` | test if both planes are valid. normals of the planes have to point up/down respectively. | 137 |
| `C:vertexPlaneIntersection(vertex, plane)` |  | 181 |
| `C:zoneArea()` |  | 476 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/zone.lua`.*
