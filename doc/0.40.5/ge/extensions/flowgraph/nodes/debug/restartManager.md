# `flowgraph_nodes_debug_restartManager`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/restartManager.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/restartManager")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Restart Project » (catégorie logic, behaviour duration). Redémarre le projet flowgraph : appelle graph.mgr:queueForRestart() quand l'entrée flow a du flux.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Met le gestionnaire en file pour redémarrage. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/restartManager.lua`.*
