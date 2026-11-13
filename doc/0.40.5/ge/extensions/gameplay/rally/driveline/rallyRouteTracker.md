# `gameplay_rally_driveline_rallyRouteTracker`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua` · VM : Game Engine (GE) · 378 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/rallyRouteTracker")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_rallyRouteTracker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_acceptProjection(projection, allowJump)` |  | 202 |
| `C:_computeDebugWindow(segmentIdx, forceFullSearch)` | Diagnostic-only: mirrors projectLocal's window math for debug capture. | 238 |
| `C:_snapshotDeparture(pos, projection)` |  | 220 |
| `C:_updateRecoveryCandidate(pos, projection)` |  | 212 |
| `C:getCorridorWidth()` |  | 186 |
| `C:getOptions()` |  | 190 |
| `C:getRecoveryDistToTarget(backoffDistance)` |  | 334 |
| `C:getState()` |  | 347 |
| `C:init(path, options)` |  | 134 |
| `C:project(pos, options)` |  | 194 |
| `C:reset(pos)` |  | 142 |
| `C:setCorridorWidth(width)` |  | 178 |
| `C:setDebugCapture(enabled)` |  | 169 |
| `C:setPath(path)` |  | 173 |
| `C:update(pos, updateOptions)` |  | 249 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua`.*
