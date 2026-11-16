# `flowgraph_nodes_gameplay_groundmarkerDistance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkerDistance.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/groundmarkerDistance")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Groundmarker Remaining Distance » (catégorie repeat_instant, dépend de core_groundMarkers). Donne la distance restante (m) jusqu'à la cible des groundmarkers actifs. Sorties : active (flux, seulement si un chemin existe) et distance.

**Dépendances (chargées avant) :** `core_groundMarkers`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Lit core_groundMarkers.routePlanner.path[1].distToTarget ; active = faux si aucun chemin. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkerDistance.lua`.*
