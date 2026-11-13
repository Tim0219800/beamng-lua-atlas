# `flowgraph_nodes_mission_postClean`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/postClean.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/postClean")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Mission Post Clean' (categorie once_p_duration). Nettoie apres une mission : si keepVeh, garde le vehicule vehId (ou le vehicule joueur), supprime le vehicule joueur mis de cote (stashed) si ce n'est pas l'original, le degele et peut le recuperer sur place (recoverInPlace, avec reparation sauf en mode carriere avec vehicule d'inventaire). resetStartPos demande de replacer le vehicule d'origine a son point de depart (mission.restoreStartingInfoSetup). Si la mission utilisait le trafic precedent, garde l'etat du trafic.

## Remarques

- Plante si keepVeh est vrai et qu'aucun vehicule n'est trouve (veh nil).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Execute le nettoyage une seule fois (voir description du module). | 22 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/postClean.lua`.*
