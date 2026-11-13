# `flowgraph_nodes_environment_planet`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/planet.lua` · VM : Game Engine (GE) · 485 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/planet")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` |  | 37 |
| `C:createheightmapMesh(heightmap, uvScale, material)` | points: 2d array of points | 163 |
| `C:drawMiddle(builder, style)` |  | 123 |
| `C:getSquare(grid, size, identifier, dimensions)` |  | 378 |
| `C:heightmapFromPNG(path, scale, invertColors)` |  | 323 |
| `C:init()` | (m3,s-2,kg-1) | 32 |
| `C:normalFromPoints(p1, p3, p2)` |  | 289 |
| `C:onNodeReset()` |  | 41 |
| `C:placeObject(name, mesh, pos, rot)` |  | 301 |
| `C:warpSphere(sphereRadius, heightmap, surfaceHeight)` |  | 247 |
| `C:warpSphereCubic(sphereRadius, heightmap, cLength, surfaceHeight)` |  | 264 |
| `C:workOnce()` |  | 57 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawText`
- `obj:` `delete`, `getId`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/planet.lua`.*
