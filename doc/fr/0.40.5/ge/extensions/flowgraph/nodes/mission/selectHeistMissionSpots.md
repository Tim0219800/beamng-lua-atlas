# `flowgraph_nodes_mission_selectHeistMissionSpots`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/selectHeistMissionSpots")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Select Heist Spots' (categorie once_p_duration, auteur BeamNG). Choisit, parmi les places de sitesData.parkingSpots dont le premier tag contient 'start', 'hiest' (sic) ou 'escape', un point de depart, un point de braquage et un point d'evasion avec des contraintes de distance : depart a moins de 400 m de 'position', braquage a au moins 250 m du depart, evasion a au moins 300 m du braquage. Machine a etats (state 1 a 6), sorties start, hiest, escape, leurs zones (startLocation, hiestLocation, escapeLocation), flow et impulsion loaded.

## Remarques

- Le mot 'hiest' (pour heist) est utilise dans les noms de pins et de variables.
- Le pin d'entree reset contient la faute 'hindexStart den = true' (remplacement malheureux de 'hidden') : la cle 'hindexStartden' est sans effet.
- Etat 4 : la nouvelle evasion est prise dans self.names[self.indexStart] (liste de toutes les places) et non dans escapeLoc, ce qui est incoherent avec les etats 2 et 3.
- Les etats 2 a 4 appellent dump(...) a chaque frame (traces dans la console).
- Plante si une liste (start, hiest, escape) est vide.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle resetData. | 56 |
| `C:init()` | Initialise les listes de lieux et les sorties. | 36 |
| `C:resetData()` | Remet les listes, la machine a etats et les sorties a zero. | 60 |
| `C:work()` | Sur reset : resetData. Si flow, avance la machine a etats : 1 tri des places par tag et melange, 2 valide le depart, 3 valide le lieu de braquage, 4 valide l'evasion, 5 ecrit les zones et loaded=true, 6 loaded=false. | 80 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua`.*
