# `flowgraph_nodes_gameplay_rally_loop_rallyExcludeTraffic`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Exclude Traffic » (catégorie once_instant, tag rally). Applique (enable = true, valeur par défaut) ou efface (false) les zones d'exclusion de trafic de la boucle rally via rm:applyTrafficExclusion() / rm:clearTrafficExclusion().

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Applique ou efface l'exclusion de trafic selon la pin enable. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic.lua`.*
