# `flowgraph_nodes_vehicle_generateLicensePlate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/generateLicensePlate.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/generateLicensePlate")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Generate License Plate » (catégorie `once_instant`, tags plate/license). Génère une plaque d'immatriculation aléatoire pour un véhicule : `core_vehicles.regenerateVehicleLicenseText(veh)` puis `core_vehicles.setPlateText(texte, vehId)`. Pin d'entrée : `vehId` (défaut : joueur).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Génère un texte de plaque aléatoire et l'applique au véhicule. | 21 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/generateLicensePlate.lua`.*
