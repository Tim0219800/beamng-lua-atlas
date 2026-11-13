# `flowgraph_nodes_scene_camera_procedural_procCamPathPosRot`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Procedural Static CamPath' (categorie once_p_duration). Cree une trajectoire de camera a deux cles identiques (position pos, rotation rot, FOV 60) pour afficher un point de vue fixe, l'enregistre via camera:addCustomPath et sort son nom unique sur 'pathName'.

## Remarques

- Le commentaire du code indique que la categorie devrait etre f_duration mais qu'il n'existe pas de callback de fin.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Construit les deux marqueurs (duree 1000), genere un nom unique (id du noeud + 'pcp') et ajoute le chemin au module camera. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot.lua`.*
