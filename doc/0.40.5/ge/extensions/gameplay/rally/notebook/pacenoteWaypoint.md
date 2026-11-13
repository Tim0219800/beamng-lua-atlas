# `gameplay_rally_notebook_pacenoteWaypoint`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua` · VM : Game Engine (GE) · 369 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/pacenoteWaypoint")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_notebook_pacenoteWaypoint")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:colorForWpType(pn_drawMode)` |  | 135 |
| `C:drawDebug(hover, text, clr_shape, alpha_shape, alpha_text, clr_text_fg, clr_text_bg, radius_factor, globalOpacity)` |  | 155 |
| `C:drawDebugRecce(i, noteText)` |  | 225 |
| `C:getOriginalDistToTarget()` |  | 349 |
| `C:getRoutePoint()` |  | 336 |
| `C:getStaticOriginalDistToTarget()` |  | 353 |
| `C:getStaticRoutePoint()` |  | 345 |
| `C:init(pacenote, name, pos, forceId)` |  | 17 |
| `C:isCe()` |  | 324 |
| `C:isCs()` |  | 320 |
| `C:isLockable()` |  | 307 |
| `C:isLocked()` |  | 311 |
| `C:nameWithPacenote()` |  | 357 |
| `C:onDeserialized(data, oldIdMap)` |  | 90 |
| `C:onSerialize()` |  | 79 |
| `C:setManual(pos, radius, normal)` |  | 59 |
| `C:setNormal(normal)` |  | 70 |
| `C:setPos(newpos)` |  | 66 |
| `C:setRoutePoint(rp)` |  | 328 |
| `C:setStaticRoutePoint(rp)` |  | 340 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua`.*
