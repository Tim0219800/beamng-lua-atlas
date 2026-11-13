# `flowgraph_nodes_vehicle_states`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/states.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/states")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Vehicle States » (catégorie `repeat_instant`). Lit dans `map.objects[vehId].states` l'état du klaxon (`horn`) et de la barre lumineuse (`lightbar`). Sorties : flux `horn`, flux `lightbar`, bool `hornb`, bool `lightbarb` (cachés). Pin d'entrée : `vehId`.

## Remarques

- Si `map.objects[vehId]` n'existe pas, `horn` et `lightbar` sont à false mais `hornb`/`lightbarb` gardent leur ancienne valeur.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Met à jour les sorties de klaxon et de barre lumineuse depuis la table `map.objects`. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/states.lua`.*
