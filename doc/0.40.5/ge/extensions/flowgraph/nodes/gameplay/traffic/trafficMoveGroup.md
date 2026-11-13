# `flowgraph_nodes_gameplay_traffic_trafficMoveGroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua` · VM : Game Engine (GE) · 93 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Move Vehicle Group » (catégorie par défaut). Téléporte tous les véhicules d'un groupe (vehicleIds) vers une nouvelle position, rotation et formation avec core_multiSpawn.placeGroup. Pins : shuffle, spawnMode (roadAhead, roadBehind, traffic, lineAhead, lineBehind, lineLeft, lineRight, lineAbove, raceGrid, raceGridAlt ; défaut road), spawnGap (15), startPos, startRot ; option data.instantTeleport. Sorties : flow (après déplacement) et impulsion moved.

## Remarques

- Le défaut de spawnMode est 'road', qui ne figure pas dans la liste des modes proposés (déduit du code).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 37 |
| `C:init()` | Appelle onNodeReset() et définit data.instantTeleport=false. | 32 |
| `C:onNodeReset()` | Remet l'état à 0 et oublie les ids. | 41 |
| `C:onVehicleGroupRespawned(vehIds)` | Hook appelé quand un groupe a été replacé ; passe à l'état 2 si le premier id correspond. | 54 |
| `C:postInit()` | Définit les valeurs prédéfinies du pin spawnMode. | 46 |
| `C:work()` | Machine à états : 0 lance placeGroup, 1 attend onVehicleGroupRespawned, 2 émet moved, 3 laisse passer le flux. | 60 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua`.*
