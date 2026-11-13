# `flowgraph_nodes_mission_knockAwayCheck`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/knockAwayCheck")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 35 |
| `C:_executionStopped()` |  | 44 |
| `C:getOriginalVehicleTransforms(data)` |  | 51 |
| `C:init()` |  | 39 |
| `C:onDrawOnMinimap(td)` |  | 168 |
| `C:onPreRender(dt, dtSim)` |  | 161 |
| `C:work()` |  | 68 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua`.*
