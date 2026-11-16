# `flowgraph_nodes_scene_camera_cameraAngle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAngle.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/cameraAngle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Camera Transform' (categorie repeat_instant, fichier cameraAngle). Donne la position (vec3), la rotation (quat) et le champ de vision (degres) de la camera courante via core_camera. pos et rot ne sont calcules que si leur pin de sortie est utilise.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 22 |
| `C:work()` | fov = core_camera.getFovDeg() ; pos = getPosition():toTable() et rot = getQuat():toTable() si les pins sont utilises. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAngle.lua`.*
