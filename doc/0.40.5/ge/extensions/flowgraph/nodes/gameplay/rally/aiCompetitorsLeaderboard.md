# `flowgraph_nodes_gameplay_rally_aiCompetitorsLeaderboard`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally AI Competitors Leaderboard » (catégorie once_instant, tag rally). Simule les temps de spéciale de concurrents IA à partir de la config aiCompetitors (module gameplay/rally/aiCompetitors) et produit un classement pour l'écran de fin dans la pin leaderboard ({rows, playerRowIndex} ; multiStage et stageCount si plusieurs spéciales). Entrées : playerTime, silverTime (repli ancien), playerTimes et silverTimes (tables, un temps par spéciale, de même longueur), stageLabels (libellés), playerTotalTimeSec (total officiel de la boucle rally, utilisé pour classer le joueur). Exécuté une seule fois (workOnce).

## Remarques

- En mode multi-spéciales, si les libellés ne sont ni fournis ni récupérables via gameplay_rallyLoop.getManager():getStageLabels(), une erreur est loggée et le classement est vide ({rows = {}}).
- En mode simple, le temps de référence vient d'aiCompetitors.getReferenceTime(missionTypeData), sinon de la pin silverTime.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Calcule le classement via aiCompetitors.computeLeaderboard et l'écrit dans la pin leaderboard. | 64 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard.lua`.*
