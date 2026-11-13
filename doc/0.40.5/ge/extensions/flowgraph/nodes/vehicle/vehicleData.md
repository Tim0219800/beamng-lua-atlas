# `flowgraph_nodes_vehicle_vehicleData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleData.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/vehicleData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Vehicle Data » (catégorie `repeat_instant`), obsolète : « remplacé par Get Vehicle Data, Vehicle OOBB et Vehicle Wheels ». Lit `map.objects[vehId]` et la géométrie du véhicule. Sorties : `active`, `damage`, `dirVec`, `dirVecUp`, `rotation`, `position` (refnode), `corner_FR/FL/BR/BL`, `wheelCenter`, `velocityVector`, `velocity` (m/s). Pin d'entrée : `vehId` (défaut 0).

## Remarques

- Le code final (`extractVehicleData`, sorties `model`/`config`) est dans un bloc commenté.
- Plante si le véhicule joueur n'existe pas (`veh:getId()` n'est pas atteint grâce au `return`).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Constructeur vide. | 45 |
| `C:work(args)` | Remplit toutes les sorties depuis `map.objects` et la boîte englobante. | 53 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleData.lua`.*
