# `flowgraph_nodes_scene_camera_cameraAutoRotate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAutoRotate.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/cameraAutoRotate")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Camera Look at Position' (categorie repeat_instant, fichier cameraAutoRotate). Passe en camera libre et oriente la camera pour regarder en permanence la position cible 'position', sans la deplacer (vecteur haut (0,0,1)).

## Remarques

- Plante si le pin 'position' est nil (vec3(nil)).
- L'appel setPosRot utilise l'index de joueur 0.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Active la camera libre si besoin puis applique core_camera.setPosRot avec la rotation quatFromDir(position - camPos, up). | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAutoRotate.lua`.*
