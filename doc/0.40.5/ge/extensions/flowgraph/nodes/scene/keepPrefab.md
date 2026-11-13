# `flowgraph_nodes_scene_keepPrefab`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/keepPrefab.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/keepPrefab")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Keep Prefab » (once_instant). Marque un prefab pour qu'il soit conserve apres l'arret du flowgraph ; par defaut un prefab cree pendant l'execution est supprime a la fin. Entrees : id (number), keep (bool). Utilise self.mgr.modules.prefab:setKeepPrefab.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Rien a initialiser. | 24 |
| `C:workOnce()` | Appelle setKeepPrefab(id, keep) et recopie l'entree flow vers la sortie flow. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/keepPrefab.lua`.*
