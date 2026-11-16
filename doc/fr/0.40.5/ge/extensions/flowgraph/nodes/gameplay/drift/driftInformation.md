# `flowgraph_nodes_gameplay_drift_driftInformation`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftInformation.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftInformation")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Information » (catégorie repeat_instant, drift). Donne l'état du drift du véhicule : drifting/notDrifting, impulsions spinout, tapped, crashed, donutDetected, tightDriftDetected, driftCompleted (avec driftCompletedAddedScore, driftCompletedCachedScore, driftCompletedCombo), et les mesures closestWallDistance, driftAngle, driftVelocity, totalDriftDeg, totalDriftDistance, totalDriftTime, driftUniformity. Source : gameplay_drift_drift.getDriftActiveData et callbacks du module drift du flowgraph.

## Remarques

- Hors drift, les mesures valent -1.
- driftUniformity est déclaré mais jamais renseigné dans work.
- Aucune sortie « flow » générale n'est écrite en dehors de drifting/notDrifting.
- todo du code : régler driftCleanliness, nettoyer le raycast.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Copie les callbacks (ttl > 0) et les données actives de drift vers les pins de sortie. | 46 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftInformation.lua`.*
