# `flowgraph_nodes_scene_camera_stopCamPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/stopCamPath.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/stopCamPath")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Stop Cam Path » (once_instant). Arrete un chemin camera : le chemin actif n'est pas considere comme termine mais devient inactif. Entree optionnelle (cachee) id : sans id, tente d'utiliser le chemin actif.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Zone centrale du noeud (rien d'affiche). | 26 |
| `C:workOnce()` | Appelle self.mgr.modules.camera:endActivePath(id). | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/stopCamPath.lua`.*
