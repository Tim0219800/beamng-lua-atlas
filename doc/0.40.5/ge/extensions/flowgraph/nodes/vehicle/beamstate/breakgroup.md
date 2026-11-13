# `flowgraph_nodes_vehicle_beamstate_breakgroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/beamstate/breakgroup")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Breakgroup » (catégorie `repeat_p_duration`, tags destroy/damage). Casse un ou plusieurs breakgroups du véhicule. Pins d'entrée : `vehId` (number), `group` (string, défaut `*`). `*` appelle `beamstate.breakAllBreakgroups()`. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- Bug : `type(self.pinIn.group.value == 'string')` compare d'abord puis prend `type` d'un booléen : le résultat est toujours 'boolean' (donc vrai), la branche « table » n'est jamais utilisée malgré la description du pin (« table or string »).
- `beamstate.breakBreakGroup('nom')` : le nom est inséré tel quel entre apostrophes dans la commande Lua.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si `group` est `*`, casse tous les breakgroups ; sinon appelle `beamstate.breakBreakGroup('<group>')` sur le véhicule. Sort si `group` vaut nil ou si le véhicule est introuvable (log E). | 27 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua`.*
