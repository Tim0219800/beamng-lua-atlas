# `flowgraph_nodes_ui_updatedUI_endScreenDriftStats`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats")` (fichier sous extensions/ mais pas une extension classique)

Nœud « EndScreen Drift Stats » (catégorie repeat_instant, couleur ui). Ajoute à l'écran de fin un panneau de statistiques de drift. Chaîne : flow en entrée, flow en sortie (chainFlow). À placer entre EndScreen Begin et Screen Finish.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Recopie flow en sortie, puis appelle modules.ui:addDriftStats avec gameplay_drift_scoreboard.getPerformanceStats(), getTiersStats() et getDriftEventStats(). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats.lua`.*
