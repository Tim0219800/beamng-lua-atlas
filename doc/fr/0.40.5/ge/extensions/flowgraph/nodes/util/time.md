# `flowgraph_nodes_util_time`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/time.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/time")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Time » (catégorie provider, sans flow). Fournit le temps courant. Sorties : time (os.clockhp(), horloge haute précision), dtReal (temps réel entre frames en s, ignore la pause), dtSim (temps simulé en s, 0 en pause, réduit au ralenti).

## Remarques

- La description du pin time dit « Time since start of project » mais la valeur est l'horloge absolue os.clockhp(), pas le temps depuis le démarrage.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Corps vide. | 31 |
| `C:init(mgr, ...)` | Ne fait rien. | 22 |
| `C:work()` | Écrit os.clockhp() dans time et mgr.dtReal / mgr.dtSim dans les deux autres sorties. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/time.lua`.*
