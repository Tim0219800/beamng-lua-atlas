# `flowgraph_nodes_mission_selectGarage2GarageZones`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua` · VM : Game Engine (GE) · 265 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/selectGarage2GarageZones")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Select Garage Sites' (categorie once_instant, auteur BeamNG). Choisit une place de depart dans les zones initiales de la mission et une place d'arrivee dans les zones de destination (mission.initialZones et destinationZones, generees par mission:generateZoneLists si besoin), a partir de sitesData.parkingSpots. Evite les places deja utilisees, impose une distance entre minDist et maxDist (sinon prend le meilleur candidat). Sorties : impulsion 'loaded', startSpot, endSpot, startLocation, endLocation (noms des zones).

## Remarques

- Le meilleur candidat est celui dont (distance - maxDist) est le plus petit, ce qui peut etre une valeur negative (trop proche).
- Les places sont comparees par nom et marquees utilisees dans usedStartSpots / usedEndSpots.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet la selection et les sorties a zero. | 41 |
| `C:findEndSpotForStartingSpot(startSpot, possibleEndSpots)` | Melange les places d'arrivee possibles et renvoie la premiere dont la distance a la place de depart est dans [minDist, maxDist] ; sinon la plus proche de maxDist par le bas (meilleur candidat). | 95 |
| `C:init()` | Initialise l'etat, les places utilisees et les sorties. | 28 |
| `C:resetData()` | Remet la selection, state=1 et les sorties a zero. | 53 |
| `C:work()` | state 1 : calcule les places possibles, vide les listes d'utilisation quand elles sont epuisees, choisit depart et arrivee, trie les zones par prio, ecrit les sorties et loaded=true, passe a state 2. state 2 : loaded=false. | 138 |
| `C:workOnce()` | Appelle resetData. | 65 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua`.*
