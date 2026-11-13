# `flowgraph_nodes_mission_removeStashedPlayerVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle.lua` · VM : Game Engine (GE) · 22 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Remove Stashed Player Vehicle' (categorie once_p_duration). Supprime le vehicule joueur mis de cote par le noeud de nettoyage de mission (module mission du gestionnaire). Aucun pin.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle self.mgr.modules.mission:removeStashedPlayerVehicle(). | 18 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle.lua`.*
