# `flowgraph_nodes_scene_reloadCollision`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/reloadCollision.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/reloadCollision")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Reload Collision » (once_instant). Recharge les données de collision du niveau une seule fois via be:reloadCollision(). Aucun pin.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle be:reloadCollision(). | 19 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/reloadCollision.lua`.*
