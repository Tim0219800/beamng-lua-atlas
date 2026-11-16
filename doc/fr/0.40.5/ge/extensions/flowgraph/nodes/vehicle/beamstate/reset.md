# `flowgraph_nodes_vehicle_beamstate_reset`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reset.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/beamstate/reset")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Reset Vehicle » (catégorie `repeat_p_duration`, tag reset). Remet le véhicule à son état initial : `veh:requestReset(RESET_PHYSICS)` puis `veh:resetBrokenFlexMesh()`. Pin d'entrée : `vehId`. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- Appelé à chaque frame tant que le flux est actif : utiliser une impulsion pour un seul reset.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Demande un reset physique du véhicule et remet à zéro ses flexmeshes cassés. | 26 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reset.lua`.*
