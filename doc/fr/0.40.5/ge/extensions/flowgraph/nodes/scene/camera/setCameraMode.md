# `flowgraph_nodes_scene_camera_setCameraMode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraMode.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/setCameraMode")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Set Camera Mode » (repeat_instant, dependance core_camera). Pin d'entree : mode (string), nom du mode camera. A chaque execution, si le nom n'est pas vide, appelle core_camera.setByName(0, mode).

**Dépendances (chargées avant) :** `core_camera`

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Change le mode camera du joueur 0 via core_camera.setByName si le pin mode est non vide. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraMode.lua`.*
