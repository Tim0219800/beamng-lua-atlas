# `flowgraph_nodes_scene_camera_restartCamPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/restartCamPath.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/restartCamPath")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Restart Cam Path' (categorie once_instant, behaviour once). Redemarre la trajectoire de camera active (ou celle d'id 'id', pin cache) via camera:restartActivePath.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le milieu du noeud (vide). | 26 |
| `C:workOnce()` | Appelle self.mgr.modules.camera:restartActivePath(id). | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/restartCamPath.lua`.*
