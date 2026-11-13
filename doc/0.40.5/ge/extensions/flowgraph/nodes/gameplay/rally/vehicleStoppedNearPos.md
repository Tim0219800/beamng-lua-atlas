# `flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 40 |
| `C:drawDebugStopZone()` |  | 130 |
| `C:drawDebugVehiclePoint(inside)` |  | 136 |
| `C:drawMiddle(builder, style)` |  | 56 |
| `C:init(mgr, ...)` |  | 31 |
| `C:isNearPosition()` |  | 111 |
| `C:isStopped()` |  | 103 |
| `C:updateTimer()` |  | 47 |
| `C:updateVehicleData2()` | uses vehicle bounding box leading point | 84 |
| `C:work(args)` |  | 144 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua`.*
