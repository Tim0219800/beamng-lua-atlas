# `editor_heroRoadEditor_meshRefine`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_meshRefine` : `extensions.load("editor_heroRoadEditor_meshRefine")`, puis la globale `editor_heroRoadEditor_meshRefine`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m)` | Lateral column decimation. ptsA[s] is station s's cross-section ({o,dz} per column); bandMat has one material per band<br> (between columns c and c+1). Force-keeps col 1, col numCols and every material-band boundary, then RDPs the interior<br> columns using the MAX (o,dz) deviation ACROSS ALL stations -- so a column stays if the profile bends at ANY station<br> (e.g. a crown that fades in bends still keeps its apex columns). Returns a sorted array of kept column indices. | 129 |
| `editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM)` | Multi-channel RDP over stations 1..m. With tolZM, tolM bounds the plan deviation only and tolZM the vertical one (a plan chord<br> just moves an edge sideways, while a vertical one is a bump under the wheels). | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua`.*
