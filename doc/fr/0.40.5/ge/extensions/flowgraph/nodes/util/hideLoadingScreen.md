# `flowgraph_nodes_util_hideLoadingScreen`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/hideLoadingScreen")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Hide Loading Screen » (once_instant). Cache l'écran de chargement après le chargement d'un niveau (utile avec « Load Level » en mode customLoadingScreen). Sans effet si aucun niveau n'est en chargement. Sortie : finished (flow).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Désactive clearOutPinsOnStart. | 20 |
| `C:work()` | Met finished à true dès que modules.level n'est plus en chargement de niveau. | 34 |
| `C:workOnce()` | Met finished à false, appelle modules.level:finishedLevelLoading() et server.fadeoutLoadingScreen(true). | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua`.*
