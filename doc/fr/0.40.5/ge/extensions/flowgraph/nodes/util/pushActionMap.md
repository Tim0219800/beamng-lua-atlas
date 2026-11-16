# `flowgraph_nodes_util_pushActionMap`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/pushActionMap")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Push Action Map » (once_instant). Empile une action map (pushActionMap) pour activer ses entrées ; elle est retirée automatiquement à l'arrêt du projet. Entrée : name. Le champ todo signale un comportement étrange si plusieurs projets utilisent la même action map.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Retire l'action map poussée (popActionMap) et oublie son nom. | 25 |
| `C:drawMiddle(builder, style)` | Affiche « <nom> pushed. » dans le nœud. | 37 |
| `C:init(mgr, ...)` | Appelle _executionStopped. | 21 |
| `C:workOnce()` | Mémorise le nom et appelle pushActionMap(name). | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua`.*
