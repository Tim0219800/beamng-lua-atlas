# `flowgraph_nodes_gameplay_rally_rallyRouteData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyRouteData.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyRouteData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Route Data » (catégorie repeat_instant, tag rally). Lit le gestionnaire rally (gameplay_rally.getRallyManager()) et publie dans nextRoutePointPos (vec3) la position de destination de recovery (rm:getRecoveryDestinationPos()). Recopie aussi flow en sortie.

## Remarques

- La description de la pin parle du « prochain point de route devant le véhicule » mais le code renvoie getRecoveryDestinationPos().

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame : met à jour nextRoutePointPos depuis le rally manager et recopie le flux. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyRouteData.lua`.*
