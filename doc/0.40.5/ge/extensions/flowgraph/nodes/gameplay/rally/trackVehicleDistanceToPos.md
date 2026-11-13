# `flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 29 |
| `C:getDistanceSquared()` |  | 74 |
| `C:init(mgr, ...)` |  | 25 |
| `C:updateVehicleData2()` | uses vehicle bounding box leading point | 55 |
| `C:work(args)` |  | 89 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua`.*
