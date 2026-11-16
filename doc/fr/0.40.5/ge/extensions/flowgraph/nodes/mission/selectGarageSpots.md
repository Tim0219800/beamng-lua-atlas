# `flowgraph_nodes_mission_selectGarageSpots`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua` · VM : Game Engine (GE) · 193 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/selectGarageSpots")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Select Garage Spots' (categorie once_p_duration, auteur BeamNG). Choisit une place de depart et une place d'arrivee parmi sitesData.parkingSpots : en mode isLocal, la place de depart doit appartenir a la zone 'zone' (zone de plus faible prio) ; la place d'arrivee est choisie au hasard entre minDist et maxDist de distance. Sorties : flow (une fois trouve), impulsion loaded, startSpot, endSpot, startLocation, endLocation. Les descriptions des pins d'entree sont vides dans le code.

## Remarques

- Le message de journal parle de 'G2G Route' (reprise du noeud garage-to-garage).
- Le reset (pin) n'est pas lu dans work ; seul resetData via workOnce/_executionStarted remet a zero.
- Si possibleStartingSpots est vide (aucune place dans la zone), self.startSpot est nil et le noeud plante.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle resetData. | 52 |
| `C:findEndSpotForStartingSpot(startSpot)` | Choisit une place d'arrivee a distance acceptable de la place de depart (voir Select Garage Sites), sinon le meilleur candidat. | 77 |
| `C:init()` | Initialise les listes, state=1 et les sorties. | 37 |
| `C:resetData()` | Vide les places utilisees et remet tout a zero. | 56 |
| `C:work()` | Si flow : state 1 selectionne depart et arrivee, ecrit les sorties, flow et loaded a true ; state 2 garde flow=true et loaded=false. | 119 |
| `C:workOnce()` | Appelle resetData. | 72 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua`.*
