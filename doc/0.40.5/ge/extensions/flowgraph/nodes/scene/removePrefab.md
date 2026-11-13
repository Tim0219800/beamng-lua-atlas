# `flowgraph_nodes_scene_removePrefab`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/removePrefab")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Remove Prefab » (repeat_instant). Supprime un prefab par son id via self.mgr.modules.prefab:deletePrefab(id, true). Entrées : flow, id (number, 0 par défaut).

## Remarques

- L'icône référence ui_flowgraph_editor.nodeIcons.svene (faute de frappe pour scene) : icône nil.
- La description du pin id est tronquée (« If not present »).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Ne fait rien. | 24 |
| `C:work()` | Appelle deletePrefab(id, true) du module prefab à chaque exécution avec flow. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua`.*
