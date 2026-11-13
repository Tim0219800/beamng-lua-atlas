# `flowgraph_modules_trafficModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/trafficModule.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/trafficModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:activateParkedCars(vehList)` |  | 45 |
| `C:activateTraffic(vehList)` |  | 33 |
| `C:deactivateParkedCars()` |  | 50 |
| `C:deactivateTraffic()` |  | 38 |
| `C:executionStopped()` |  | 57 |
| `C:init()` |  | 8 |
| `C:insertTraffic(id)` |  | 23 |
| `C:removeTraffic(id)` |  | 28 |
| `C:updateParkedCarsState()` |  | 19 |
| `C:updateTrafficState()` | trafficActive and parkedCarsActive should only get updated if the flowgraph itself alters the traffic state | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/trafficModule.lua`.*
