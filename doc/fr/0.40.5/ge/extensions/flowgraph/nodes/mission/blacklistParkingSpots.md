# `flowgraph_nodes_mission_blacklistParkingSpots`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/blacklistParkingSpots")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Blacklist Parking Spots' (categorie once_instant). Marque comme 'banned' les places de parking (gameplay_parking) situees dans un rayon autour de positions donnees, pour que des voitures garees ne les utilisent pas, et teleporte les vehicules deja garees dessus. Positions : liste posList, pins pos_i (nombre reglable) et, si 'auto', les vehicules actifs de la mission (hors trafic/garees). Les marques sont retirees a l'arret ou au reset.

## Remarques

- workOnce ajoute les positions dans la table posList du pin d'entree (si fournie), donc modifie la table de l'appelant.
- updatePins teste lnk.sourcePin alors que les pins pos_i sont des entrees : les liens ne sont pas supprimes.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset(). | 33 |
| `C:_onDeserialized(res)` | Relit count et recree les pins. | 148 |
| `C:_onSerialize(res)` | Sauvegarde count. | 144 |
| `C:drawCustomProperties()` | Panneau : nombre de pins de position (Count). | 56 |
| `C:init()` | count=1, bannedSpots vide. | 24 |
| `C:onNodeReset()` | Appelle reset(). | 37 |
| `C:postInit()` | Cree les pins pos_1..pos_count. | 29 |
| `C:reset()` | Retire le tag 'banned' des places bannies par ce noeud et vide la liste. | 41 |
| `C:updatePins(old, new)` | Cree ou supprime les pins pos_i. | 73 |
| `C:workOnce()` | Rassemble les positions, cherche les places dans le rayon (defaut 5 m) avec gameplay_parking.findParkingSpots, ajoute le tag 'banned' et force la teleportation des vehicules qui les occupent. | 94 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua`.*
