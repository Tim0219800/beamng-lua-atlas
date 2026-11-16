# `flowgraph_nodes_debug_pauseManager`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/pauseManager.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/pauseManager")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Pause Execution » (catégorie logic). Met en pause l'exécution du projet flowgraph (graph.mgr:setPaused(true)) tant qu'il reçoit du flux sur son entrée flow. Ne met pas le jeu en pause.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle graph.mgr:setPaused(true). | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/pauseManager.lua`.*
