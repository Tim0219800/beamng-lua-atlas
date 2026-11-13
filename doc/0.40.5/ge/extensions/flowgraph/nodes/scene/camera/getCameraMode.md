# `flowgraph_nodes_scene_camera_getCameraMode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/getCameraMode.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/getCameraMode")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Get Camera Mode' (categorie repeat_instant). Donne le nom du mode de camera actif (core_camera.getActiveCamName(0)) sur la sortie 'mode'. Depend de core_camera.

**Dépendances (chargées avant) :** `core_camera`

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Ecrit le nom du mode de camera actif sur la sortie. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/getCameraMode.lua`.*
