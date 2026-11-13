# `flowgraph_nodes_timetrials_onRaceCheckpoint`

*Fichier : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/timetrials/onRaceCheckpoint")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Race CP Reached » (repeat_instant). Laisse passer une impulsion quand le joueur franchit un checkpoint de course. Sorties : checked (impulsion), vehId (caché), index (checkpoint), lap (tour courant, compté avec data.lapDiff). Reçoit le hook onRaceWaypointReached.

## Remarques

- Ancien nom de pin : vehicleID -> vehId (legacyPins).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet lap = 1 et enterFlag = false. | 35 |
| `C:init(mgr, ...)` | Initialise enterFlag, lap = 1 et clearOutPinsOnStart = false. | 29 |
| `C:onRaceWaypointReached(data)` | Hook : mémorise vehId, index (data.cur) et met à jour le tour (data.lapDiff). | 40 |
| `C:onScenarioRestarted()` | Hook de redémarrage du scénario : réinitialise le noeud. | 53 |
| `C:work(args)` | Écrit checked = enterFlag puis le remet à false. | 48 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua`.*
