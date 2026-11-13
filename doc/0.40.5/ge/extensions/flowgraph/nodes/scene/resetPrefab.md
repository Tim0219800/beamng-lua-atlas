# `flowgraph_nodes_scene_resetPrefab`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/resetPrefab.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/resetPrefab")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Reset Prefab » (once_instant, auteur BeamNG). Restaure les transformations des objets/véhicules d'un prefab via self.mgr.modules.prefab:restoreVehiclePositions(id). Entrée : id (number).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle restoreVehiclePositions(id) du module prefab. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/resetPrefab.lua`.*
