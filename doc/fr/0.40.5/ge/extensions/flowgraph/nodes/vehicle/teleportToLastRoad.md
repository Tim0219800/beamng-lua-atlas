# `flowgraph_nodes_vehicle_teleportToLastRoad`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/teleportToLastRoad.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/teleportToLastRoad")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Teleport To Last Road » (catégorie `repeat_instant`). Téléporte le véhicule sur la dernière route valide (`spawn.teleportToLastRoad`) et déclenche le hook `onVehicleTeleportedToLastRoad(vehId)`. Pins d'entrée : `vehId`, `resetVehicle` (bool), `destinationPos` (vec3, optionnel : position vers laquelle regarder, sinon 15 m devant le véhicule).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 21 |
| `C:work()` | Calcule la position visée puis appelle `spawn.teleportToLastRoad` et le hook. | 25 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleTeleportedToLastRoad`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/teleportToLastRoad.lua`.*
