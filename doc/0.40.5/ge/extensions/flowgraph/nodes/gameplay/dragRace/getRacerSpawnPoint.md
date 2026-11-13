# `flowgraph_nodes_gameplay_dragRace_getRacerSpawnPoint`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Drag Racer Spawn Point » (catégorie repeat_instant). Donne la position et la rotation de spawn de la voie d'un pilote (vehId), généralement utilisé une fois lors de la préparation. Sorties : spawnPos (vec3), spawnRot (quat), lane, available (faux si le pilote, la voie ou le waypoint spawn est introuvable).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide data et dragData. | 25 |
| `C:work()` | Lit dragData.strip.lanes[lane].waypoints.spawn.transform et écrit les pins utilisés. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint.lua`.*
