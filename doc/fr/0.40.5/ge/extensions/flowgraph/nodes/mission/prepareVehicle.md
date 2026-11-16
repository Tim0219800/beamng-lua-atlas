# `flowgraph_nodes_mission_prepareVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/prepareVehicle.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/prepareVehicle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Prepare Vehicle' (categorie once_instant). Prepare un ou plusieurs vehicules pour le gameplay (electrique et valeurs) via self.mgr.modules.mission:prepareVehicle. Pins optionnels : vehId (defaut vehicule joueur) et vehicleIds (table d'ids supplementaires).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Prepare vehId (ou le vehicule joueur) avec le second argument false, puis chaque id de vehicleIds avec le second argument true sauf s'il s'agit du vehicule principal ou du joueur. | 19 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/prepareVehicle.lua`.*
