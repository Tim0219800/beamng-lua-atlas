# `flowgraph_nodes_scene_getPlayerVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/getPlayerVehicle.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/getPlayerVehicle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Get Player Vehicle ID » (categorie provider). Sorties : vehId (number) id du vehicule controle par le joueur (be:getPlayerVehicleID(0), -1 si aucun) et exist (bool, cache). Ancien nom de pin : objID -> vehId (legacyPins).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Rien a initialiser. | 28 |
| `C:work()` | Ecrit vehId = be:getPlayerVehicleID(0) or -1 et exist = (vehId ~= -1). | 31 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/getPlayerVehicle.lua`.*
