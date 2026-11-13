# `flowgraph_nodes_gameplay_drift_setDriftRacePath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Race Path » (catégorie repeat_instant, drift). Utilise un chemin de course (pin racePath) pour définir checkpoints, destination et position de départ via gameplay_drift_destination.setRacePath. Pin d'entrée supplémentaire : disableWrongWayAndDist (désactive les messages de mauvais sens et de distance restante). Sorties : pathData (données du chemin pour d'autres nœuds) et waypoints (table).

## Remarques

- Chemin résolu avec mgr:getRelativeAbsolutePath ; sorties inchangées s'il est invalide.
- Rappelle setRacePath à chaque frame tant que le nœud est atteint.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle setRacePath({filePath, disableWrongWayAndDist}) puis lit getWaypoints() et getPathData(file). | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath.lua`.*
