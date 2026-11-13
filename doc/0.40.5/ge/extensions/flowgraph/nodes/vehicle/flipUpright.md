# `flowgraph_nodes_vehicle_flipUpright`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/flipUpright")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Flip Upright » (catégorie `repeat_instant`, tags rotation/position/recover/move). Remet le véhicule d'aplomb sans le réparer : `spawn.safeTeleport` à la même position avec une rotation recalculée par `quatFromDir(direction)`, puis déclenche le hook `onVehicleFlippedUpright(vehId)`. Pin d'entrée : `vehId`. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- Appelé à chaque frame tant que le flux est actif.
- Le dernier argument `false` de safeTeleport désactive la réparation.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 24 |
| `C:resetVehicle()` | Téléporte le véhicule sur place, redressé, et appelle `extensions.hook('onVehicleFlippedUpright', vehId)`. | 33 |
| `C:work()` | Appelle `resetVehicle` et recopie le flux d'entrée sur la sortie. | 28 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleFlippedUpright` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua`.*
