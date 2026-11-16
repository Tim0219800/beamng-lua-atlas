# `flowgraph_nodes_vehicle_enterVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/enterVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Enter Vehicle » (catégorie `dynamic_instant`, dépend de `gameplay_walk`). Fait entrer le joueur dans un véhicule (`gameplay_walk.getInVehicle(veh)`) puis remet la caméra de jeu (`commands.setGameCamera()`). Pin d'entrée : `vehId`. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- Catégorie dynamique : en mode `repeat`, `work` répète l'entrée à chaque frame ; sinon seul `workOnce` agit.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:enterVehicle()` | Trouve le véhicule (`vehId` ou joueur), appelle `gameplay_walk.getInVehicle` et `commands.setGameCamera`. | 37 |
| `C:work()` | Si `dynamicMode == 'repeat'`, répète l'entrée dans le véhicule à chaque frame. | 31 |
| `C:workOnce()` | Fait entrer le joueur dans le véhicule une fois. | 27 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua`.*
