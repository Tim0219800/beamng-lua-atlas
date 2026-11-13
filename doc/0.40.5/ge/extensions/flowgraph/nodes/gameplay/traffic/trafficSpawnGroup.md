# `flowgraph_nodes_gameplay_traffic_trafficSpawnGroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua` · VM : Game Engine (GE) · 136 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Spawn Vehicle Group » (catégorie par défaut). Fait apparaître un groupe de véhicules avec core_multiSpawn.spawnGroup. Pins : group (sans groupe : groupe de trafic par défaut), quantity (-1 ou nil : valeur trafficAmount des réglages du jeu), shuffle, spawnMode (roadAhead, roadBehind, traffic, lineAhead, lineBehind, lineLeft, lineRight, lineAbove, raceGrid, raceGridAlt ; défaut road), spawnGap (15), startPos, startRot, randomColors, dontDelete ; reset supprime les véhicules créés. Sorties : flow, impulsion loaded, vehicleIds. Les véhicules sont ajoutés au module vehicle du flowgraph.

## Remarques

- Le défaut de spawnMode ('road') n'est pas dans la liste de modes proposés (déduit du code).
- Machine à états self.state : 0 attente, 1 apparition en cours, 2 chargé, 3 terminé.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle resetState(). | 44 |
| `C:init()` | Appelle resetState(). | 40 |
| `C:onNodeReset()` | Supprime les véhicules créés par ce nœud (scène et éditeur) puis réinitialise l'état. | 48 |
| `C:onVehicleGroupSpawned(vehIds, groupId)` | Hook appelé quand un groupe a été créé ; si groupId correspond, enregistre les véhicules, publie vehicleIds et passe à l'état 2. | 77 |
| `C:postInit()` | Définit les valeurs prédéfinies du pin spawnMode. | 69 |
| `C:resetState()` | Remet état, groupId, liste d'ids et sortie flow à zéro. | 62 |
| `C:work()` | Au premier flux, lance spawnGroup (ou termine directement si la quantité est 0), puis émet loaded et laisse passer le flux une fois chargé. | 90 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua`.*
