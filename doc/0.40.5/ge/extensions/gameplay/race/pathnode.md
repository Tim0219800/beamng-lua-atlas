# `gameplay_race_pathnode`

*Fichier : `lua/ge/extensions/gameplay/race/pathnode.lua` · VM : Game Engine (GE) · 319 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/pathnode")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_race_pathnode")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:convertRayHitToTransform(hit, pRot, zOff, scl, side, alignMode)` |  | 248 |
| `C:drawDebug(drawMode, clr, extraText)` |  | 174 |
| `C:getPaddedCenter()` |  | 168 |
| `C:getRecovery()` |  | 87 |
| `C:getReverseRecovery()` |  | 90 |
| `C:getRoutePoint()` |  | 301 |
| `C:getSideTransforms(posOffset, rotOffset, sclOffset, alignMode)` |  | 269 |
| `C:getStaticRoutePoint()` |  | 309 |
| `C:init(path, name, forceId)` |  | 7 |
| `C:inside(pos)` |  | 78 |
| `C:intersectCorners(fromCorners, toCorners)` |  | 94 |
| `C:onDeserialized(data, oldIdMap)` |  | 148 |
| `C:onSerialize()` |  | 128 |
| `C:setManual(pos, radius, normal)` |  | 47 |
| `C:setNavRadiusScale(scl)` |  | 71 |
| `C:setNavgraph(navgraphName, fallback)` |  | 55 |
| `C:setNormal(normal)` |  | 33 |
| `C:setRoutePoint(rp)` |  | 294 |
| `C:setStaticRoutePoint(rp)` |  | 305 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/pathnode.lua`.*
