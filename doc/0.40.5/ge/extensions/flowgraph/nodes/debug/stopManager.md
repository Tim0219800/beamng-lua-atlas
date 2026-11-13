# `flowgraph_nodes_debug_stopManager`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/stopManager.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/stopManager")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Stop Project » (catégorie logic). Arrête l'exécution du projet flowgraph (graph.mgr:setRunning(false)) quand l'entrée flow a du flux.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle graph.mgr:setRunning(false). | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/stopManager.lua`.*
