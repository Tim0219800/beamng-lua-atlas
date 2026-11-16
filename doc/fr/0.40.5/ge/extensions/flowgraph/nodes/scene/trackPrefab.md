# `flowgraph_nodes_scene_trackPrefab`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/trackPrefab.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/trackPrefab")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Track Prefab » (once_instant). Permet au flowgraph de suivre un prefab créé hors flowgraph, via modules.prefab:addPrefab(id, options). Entrées : flow, id (0 = prefab du joueur d'après la description), dontDelete, skipNavgraphReload, skipCollisionReload (tous true par défaut, cachés).

## Remarques

- L'icône référence nodeIcons.svene (faute de frappe) : icône nil.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Ne fait rien. | 29 |
| `C:workOnce()` | Appelle addPrefab(id, {dontDelete, skipNavgraphReload, skipCollisionReload}). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/trackPrefab.lua`.*
