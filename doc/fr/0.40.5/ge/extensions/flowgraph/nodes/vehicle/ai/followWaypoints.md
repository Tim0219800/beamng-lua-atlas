# `flowgraph_nodes_vehicle_ai_followWaypoints`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua` · VM : Game Engine (GE) · 122 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/followWaypoints")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Follow Waypoints » (couleur ai, once_f_duration). Fait suivre à un véhicule une liste de waypoints du navgraph avec ai.driveUsingPath et détecte la fin des tours. Entrées : navgraphPath (table, ou aiPath dedans), vehId (sans valeur = joueur), lapCount (caché, 1), stopAtFinish (caché, true : s'arrête précisément au dernier waypoint). Sortie : finalWp (caché, nom du dernier waypoint). Pin hérité : waypointData devenu navgraphPath. Tags : ai, path, route, waypoint, race.

## Remarques

- Dans drawMiddle, finalWp.value est concaténé sans tostring : une valeur nil provoquerait une erreur.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 34 |
| `C:drawMiddle(builder, style)` | Affiche l'état, le nombre de waypoints et la cible finale. | 108 |
| `C:getVeh()` | Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée. | 47 |
| `C:init()` | Appelle onNodeReset. | 30 |
| `C:onNodeReset()` | Vide le chemin, remet les compteurs de tours à zéro, efface finalWp et passe à l'état « inactive ». | 38 |
| `C:work()` | Pendant « started », compte un tour quand le véhicule passe dans le rayon du dernier waypoint, réarme quand il est plus proche du premier ; passe à « finished » quand lapsDone == lapCount. | 85 |
| `C:workOnce()` | Lit le chemin, calcule lapCount, finalWp (dernier waypoint) et envoie ai.driveUsingPath({wpTargetList, wpSpeeds, noOfLaps, aggression = 1}) ; en multi-tours, ajoute le premier waypoint à la fin ; sans stopAtFinish, fixe la vitesse du dernier waypoint à 100. Passe l'état à « started ». | 57 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua`.*
