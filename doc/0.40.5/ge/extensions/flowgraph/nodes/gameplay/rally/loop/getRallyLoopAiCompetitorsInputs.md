# `flowgraph_nodes_gameplay_rally_loop_getRallyLoopAiCompetitorsInputs`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs.lua` · VM : Game Engine (GE) · 155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop AI Competitors Inputs » (catégorie once_instant, tag rally). Prépare les entrées du nœud Rally AI Competitors Leaderboard à partir de la boucle rally : playerTimes (temps bruts des spéciales en secondes, sans pénalités, tirés de l'event log ; nil à partir du premier temps manquant), silverTimes (temps de référence configurés des missions rallyStage liées, jusqu'à 4 via stage1..4_rallyStage), stageLabels (libellés alignés) et playerTotalTimeSec (total officiel de la boucle = temps + pénalités). Pins flow en entrée et sortie (chainFlow).

## Remarques

- Si une spéciale n'a pas de temps de référence utilisable (AiCompetitors.getReferenceTime), un avertissement est loggé et la liste des temps de référence est vide.
- Si le nombre de libellés ne correspond pas au nombre de temps de référence, les libellés restent vides (avertissement).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Initialise les sorties à vide puis remplit silverTimes, stageLabels, playerTotalTimeSec et playerTimes depuis le gestionnaire de boucle rally. | 95 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs.lua`.*
