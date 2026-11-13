# `flowgraph_nodes_vehicle_vehicleWheels`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleWheels.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/vehicleWheels")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Vehicle Wheel Center » (catégorie `repeat_instant`, tags telemetry/wheel). Calcule la moyenne des positions des roues (premier nœud d'axe de chaque roue) plus la position du véhicule. Pin d'entrée : `vehId` (défaut 0, sinon joueur). Sortie : `wheelCenter` (vec3).

## Remarques

- Si le véhicule n'a qu'une roue (`getWheelCount() - 1` vaut 0), le centre reste à la position du véhicule.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Constructeur vide. | 22 |
| `C:work(args)` | Calcule le centre des roues et l'écrit sur `wheelCenter`. | 27 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleWheels.lua`.*
