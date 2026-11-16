# `flowgraph_nodes_vehicle_shiftToGearIndex`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/shiftToGearIndex.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/shiftToGearIndex")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Shift to Gear Index » (catégorie `repeat_instant`). Passe un rapport précis sur une boîte manuelle : `core_vehicleBridge.executeAction(veh,'shiftToGearIndex', gear)`. `gear` : 0 point mort, -1 marche arrière, 1 première, etc. Pins d'entrée : `vehId`, `gear`.

## Remarques

- Comportement indéfini selon le code (description du nœud) pour une boîte automatique ou un rapport hors plage.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Envoie `shiftToGearIndex` au véhicule. | 25 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/shiftToGearIndex.lua`.*
