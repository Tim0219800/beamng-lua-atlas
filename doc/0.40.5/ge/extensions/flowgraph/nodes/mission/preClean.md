# `flowgraph_nodes_mission_preClean`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/preClean.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/preClean")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Mission Cleanup' (categorie once_p_duration). Nettoie l'etat du monde avant une mission via le module mission du gestionnaire (processVehicles) avec les options keepPlayer et keepTraffic (le vehicule joueur / le trafic restent actifs au lieu d'etre mis de cote). Sortie : vehId, l'id du vehicule joueur d'origine.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle self.mgr.modules.mission:processVehicles{keepPlayer, keepTraffic} puis ecrit vehId (id d'origine ou be:getPlayerVehicleID(0)). | 21 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/preClean.lua`.*
