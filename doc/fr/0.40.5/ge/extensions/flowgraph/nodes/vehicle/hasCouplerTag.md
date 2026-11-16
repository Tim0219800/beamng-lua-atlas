# `flowgraph_nodes_vehicle_hasCouplerTag`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/hasCouplerTag.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/hasCouplerTag")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Has Coupler Tag » (catégorie `repeat_instant`, tags event/attach/detach). Indique si un véhicule possède des attelages portant certains tags : `tow_hitch`, `fifthwheel`, `gooseneck_hitch`, `fifthwheel_v2`, `pintle` (liste dans le fichier). Pin d'entrée : `vehA`. Une sortie bool par tag (pins créés dynamiquement à partir de la liste).

## Remarques

- Plante si `vehA` ne correspond à aucun véhicule connu du module vehicle (`getVehicle` renvoie nil) : pas de test.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Met toutes les sorties de tags à false. | 32 |
| `C:work(args)` | Lit `couplerTags` du véhicule dans le module vehicle du manager et remplit chaque sortie. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/hasCouplerTag.lua`.*
