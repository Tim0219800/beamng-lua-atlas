# `flowgraph_nodes_vehicle_applyVelocity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/applyVelocity.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/applyVelocity")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Apply Velocity to Vehicle » (catégorie `repeat_p_duration`, tags boost/thrust/move). Donne instantanément une vitesse à un véhicule en appelant `thrusters.applyVelocity(vec)` dans la VM véhicule. Pins d'entrée : `vehId` (number), `dirVec` (vec3, sinon direction du véhicule), `coefficient` (number, défaut 1, multiplicateur du vecteur). Aucune sortie. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- `work` s'exécute à chaque frame tant que le flux est actif : la vitesse est ré-appliquée à chaque frame.
- Le vecteur est sérialisé tel quel en commande Lua ; unité = m/s (déduit du nom de la fonction de thrusters, non vérifié ici).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Cherche le véhicule, construit le vecteur (dirVec ou direction du véhicule) multiplié par `coefficient`, puis envoie `thrusters.applyVelocity(...)` à la VM véhicule. | 26 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/applyVelocity.lua`.*
