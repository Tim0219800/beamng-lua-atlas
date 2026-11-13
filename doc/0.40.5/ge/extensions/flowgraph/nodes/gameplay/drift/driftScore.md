# `flowgraph_nodes_gameplay_drift_driftScore`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftScore.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftScore")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Score » (catégorie repeat_instant, drift). Donne les scores de drift de gameplay_drift_scoring.getScore() : score (total), cachedScore (temporaire) et combo (courant).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Copie score, cachedScore et combo vers les pins de sortie. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftScore.lua`.*
