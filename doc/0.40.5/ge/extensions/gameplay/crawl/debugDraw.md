# `gameplay_crawl_debugDraw`

*Fichier : `lua/ge/extensions/gameplay/crawl/debugDraw.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_debugDraw` : `extensions.load("gameplay_crawl_debugDraw")`, puis la globale `gameplay_crawl_debugDraw`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode)` | Draws the boundary zone (fence + planes). zone:drawDebug already does camera culling. | 99 |
| `gameplay_crawl_debugDraw.drawPath(nodes, opts)` | Draws waypoints (spheres + facing arrows + labels) and the segments between them.<br> opts: { maxDist = number, showSegmentDistance = bool, showLabels = bool } | 53 |
| `gameplay_crawl_debugDraw.drawStartingPosition(startingPosition)` | Draws the starting position area sphere, icon marker and facing arrow. | 105 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/debugDraw.lua`.*
