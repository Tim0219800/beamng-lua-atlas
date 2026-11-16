# `flowgraph_nodes_vehicle_vehicleMapData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleMapData.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/vehicleMapData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Vehicle Data » (catégorie `repeat_instant`). Fournit position, directions, rotation, vitesse, activité et dommages depuis `map.objects[vehId]`. Sorties : `position`, `dirVec`, `dirVecUp`, `rotation`, `velocity` (m/s), `velocityVector`, `active`, `damage`, `newAPIDamage` (`getSectionDamageSum`). Les sorties non branchées ne sont pas calculées (`isUsed`). Pin d'entrée : `vehId` (défaut 0, sinon joueur).

## Remarques

- Si `vehId` désigne un objet inexistant, `vehId` reste à -1 et rien n'est écrit.
- Le test `if not vehId` est inutile car `vehId` est toujours défini.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Constructeur vide. | 30 |
| `C:work(args)` | Lit `map.objects[vehId]` et remplit les sorties branchées. | 36 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleMapData.lua`.*
