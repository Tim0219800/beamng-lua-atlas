# `flowgraph_nodes_vehicle_removeVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/removeVehicle.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/removeVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Remove Vehicle » (catégorie `repeat_instant`, tags gameplay/utils). Supprime un véhicule : informe l'éditeur (`editor.onRemoveSceneTreeObjects`) si présent, puis `source:delete()`. Pin d'entrée : `vehId`.

## Remarques

- Appelé à chaque frame tant que le flux est actif ; une fois supprimé, `scenetree.findObjectById` renvoie nil.
- `vehId` nil ou 0 : aucune suppression ; le flux de sortie est mis à true.
- Le flux de sortie n'est mis à true que dans le cas « pas d'id ».

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Cherche le véhicule et le supprime de la scène. | 21 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/removeVehicle.lua`.*
