# `flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua` · VM : Game Engine (GE) · 358 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 59 |
| `C:drawDebugVisualization()` |  | 262 |
| `C:drawMiddle(builder, style)` |  | 87 |
| `C:getRallyLoopManager()` |  | 250 |
| `C:init(mgr, ...)` |  | 33 |
| `C:isNearPlane()` |  | 258 |
| `C:shouldDrawDebug()` |  | 245 |
| `C:updateProximityState()` |  | 179 |
| `C:updateTimer()` |  | 78 |
| `C:updateVehicleData()` | uses vehicle bounding box front center point | 99 |
| `C:work(args)` |  | 272 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua`.*
