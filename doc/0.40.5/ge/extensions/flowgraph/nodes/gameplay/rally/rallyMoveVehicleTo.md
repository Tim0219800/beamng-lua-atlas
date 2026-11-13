# `flowgraph_nodes_gameplay_rally_rallyMoveVehicleTo`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Move Vehicle To » (catégorie repeat_instant, tag rally). Déplace un véhicule pour que le milieu de son pare-chocs avant, au niveau du bas de sa boîte englobante de spawn (OOBB), soit à la position pos avec la rotation rot. Il calcule le décalage entre la position du véhicule et ce point avant-bas dans le repère du véhicule, le réapplique dans le repère cible, puis appelle veh:setPositionRotation. Entrées : vehId, pos (vec3), rot (quat).

## Remarques

- La coordonnée Z finale vaut pos.z + 0.25 (marge fixe), et non la valeur calculée par le décalage.
- Si le véhicule est introuvable, un avertissement est loggé.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Si vehId, pos et rot sont fournis, replace le véhicule selon la position avant-bas cible. | 22 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo.lua`.*
