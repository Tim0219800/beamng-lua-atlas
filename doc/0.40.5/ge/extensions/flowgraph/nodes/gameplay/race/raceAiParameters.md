# `flowgraph_nodes_gameplay_race_raceAiParameters`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceAiParameters")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race AI Parameters » (catégorie once_instant, tags ai et race, auteur BeamNG). Règle une fois les paramètres de pilotage de tous les véhicules IA (non contrôlés par un joueur) listés dans raceData.states, via veh:queueLuaCommand vers le module ai du véhicule : ai.setAggression, ai.setParameters (edgeDist, turnForceCoef, awarenessForceCoef), ai.setRacing(true), puis, si les pins sont définies, ai.setAvoidCars, ai.setAggressionMode (rubberBand/off) et driveStyle (offRoad/default). Entrées : raceData (doit être actif avec tous les états véhicules), aggression, racerSkill, randomizationScale, avoidCollisions, rubberband, offroad.

## Remarques

- Valeurs par défaut : aggression 0,9 (bornée 0,25 à 2), racerSkill 1 (bornée 0 à 1), randomizationScale 0 (bornée 0 à 2). Un bruit aléatoire est ajouté à chaque valeur selon randomizationScale.
- Formules dérivées de racerSkill : edgeDist = 1,5 - 1,5*skill (m, bornée 0 à 1,5), turnForceCoef = 4*skill^1,5, awarenessForceCoef = 0,25*skill^1,5.
- state.baseAggression reçoit l'agressivité calculée, pour un usage ultérieur.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getRandomNumber(scale)` | Renvoie un nombre aléatoire uniforme dans [-scale, scale]. | 27 |
| `C:workOnce()` | Applique les paramètres IA à chaque véhicule IA de la course (une seule fois, au premier flux). | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua`.*
