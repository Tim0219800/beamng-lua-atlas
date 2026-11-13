# `flowgraph_nodes_vehicle_vehicleOOBB`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleOOBB.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/vehicleOOBB")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Vehicle Bounds » (catégorie `repeat_instant`, tags telemetry/bounds/corner). Donne les coins de la boîte englobante orientée du véhicule (`getSpawnWorldOOBB`) : sorties `corner_FR`, `corner_FL`, `corner_BR`, `corner_BL`, `center` (vec3). Pin d'entrée : `vehId` (défaut 0, sinon joueur).

## Remarques

- `center` est la moyenne des coins d'indices 0, 3, 4, 7 de l'OOBB.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Constructeur vide. | 28 |
| `C:work(args)` | Écrit les quatre coins et le centre sur les sorties. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleOOBB.lua`.*
