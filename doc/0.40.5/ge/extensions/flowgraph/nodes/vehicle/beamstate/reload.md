# `flowgraph_nodes_vehicle_beamstate_reload`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reload.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/beamstate/reload")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Reload Vehicle » (catégorie `repeat_p_duration`, tag reset). Recharge le véhicule (`veh:reload()`), c'est-à-dire un rechargement complet de l'objet véhicule. Pin d'entrée : `vehId`. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- Appelé à chaque frame tant que le flux est actif : relier à une impulsion pour ne recharger qu'une fois.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle `veh:reload()` sur le véhicule trouvé. | 25 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reload.lua`.*
