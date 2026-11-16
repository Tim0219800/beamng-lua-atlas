# `flowgraph_nodes_vehicle_moveTo`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/moveTo")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Move Vehicle To » (catégorie `repeat_instant`, tags rotation/position/teleport/move). Déplace un véhicule. Pins d'entrée : `vehId`, `pos` (vec3), `rot` (quat), et pins cachés `safeTeleport`, `centerVehicle`, `repairVehicle` (défaut true si nil). Déclenche ensuite le hook `trackVehReset`.

## Remarques

- Avec `repairVehicle` vrai/nil : `safeTeleport` → `spawn.safeTeleport` (rotation corrigée par `* quat(0,0,-1,0)`), sinon `vehicleSetPositionRotation` (non centré, quaternion brut). Avec `repairVehicle` faux : toujours `safeTeleport` sans réparation.
- Appelé à chaque frame tant que le flux est actif : le véhicule est replacé à chaque frame.
- Sort sans rien faire si `pos` n'a pas 3 composantes.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 31 |
| `C:resetVehicle()` | Déplace le véhicule selon `pos`/`rot` et les options, puis `extensions.hook('trackVehReset')`. | 39 |
| `C:work()` | Appelle `resetVehicle`. | 35 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `trackVehReset`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua`.*
