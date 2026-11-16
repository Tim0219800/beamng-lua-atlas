# `flowgraph_nodes_gameplay_drift_driftDonut`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftDonut.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftDonut")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Donut Detected » (catégorie repeat_instant, drift). Détecte les zones de donut : émet une impulsion donutDrift et le score donutScore quand le callback donut du module drift du flowgraph est actif (ttl > 0).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Lit mgr.modules.drift:getCallBacks().donut et renseigne donutDrift et donutScore. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftDonut.lua`.*
