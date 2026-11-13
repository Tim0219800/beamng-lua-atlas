# `flowgraph_nodes_vehicle_trackVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/trackVehicle.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/trackVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Track Vehicle » (catégorie `repeat_instant`). Permet au flowgraph de suivre un véhicule créé en dehors de lui (`mgr.modules.vehicle:addVehicle(veh, {dontDelete})`). Pins d'entrée : `flow`, `vehId` (défaut 0), `dontDelete` (caché, défaut true : ne pas supprimer à l'arrêt).

## Remarques

- Pas de repli sur le véhicule joueur malgré la description du pin ; `vehId` nil provoque `findObjectById(nil)`.
- Appelé à chaque frame tant que le flux est actif.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Fonction vide. | 36 |
| `C:init()` | Constructeur vide. | 25 |
| `C:work()` | Ajoute le véhicule au module vehicle du manager. | 29 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/trackVehicle.lua`.*
