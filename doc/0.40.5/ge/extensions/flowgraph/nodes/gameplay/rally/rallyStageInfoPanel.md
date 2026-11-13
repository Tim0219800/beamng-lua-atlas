# `flowgraph_nodes_gameplay_rally_rallyStageInfoPanel`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildLoopStages()` | For loops: one entry per filled special stage, in run order, with the stage's<br> title + its own distance/surfaces (read from that stage's driveline spline). | 96 |
| `C:buildLoopStats()` |  | 78 |
| `C:buildRules(repairEnabled)` |  | 132 |
| `C:buildStats()` |  | 74 |
| `C:formatStats(stats)` | Shape a raw stats table into UI-ready distance + sorted surface percentages. | 49 |
| `C:getServiceParkSpeedLimit()` |  | 123 |
| `C:readStats()` | Read the authored stats. Prefer the loaded driveline (drivelineV3.stats); fall back to<br> reading the spline file directly so the panel works regardless of driveline load timing. | 27 |
| `C:readStatsForFolder(folder)` | Read the stats for a specific mission folder's driveline spline. | 41 |
| `C:work()` |  | 168 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua`.*
