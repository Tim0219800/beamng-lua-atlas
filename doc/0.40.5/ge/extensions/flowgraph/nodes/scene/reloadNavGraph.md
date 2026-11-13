# `flowgraph_nodes_scene_reloadNavGraph`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/reloadNavGraph.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/reloadNavGraph")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Reload Nav Graph » (once_instant). Recharge le graphe de navigation (la map) une seule fois via map.reset(). Aucun pin.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle map.reset(). | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/reloadNavGraph.lua`.*
