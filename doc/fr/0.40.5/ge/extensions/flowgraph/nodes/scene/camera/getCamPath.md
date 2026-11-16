# `flowgraph_nodes_scene_camera_getCamPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua` · VM : Game Engine (GE) · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/getCamPath")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Get Cam Path' (categorie once_f_duration). Renseigne sur l'etat d'une trajectoire de camera (par 'id', sinon celle qui est active) : sorties inactive, complete, completed (impulsion une fois), incomplete et duration. Utile avec Simple Cam Path ou les noeuds de trajectoire procedurale.

## Remarques

- La description du code ('Lets the camera follow the path...') est copiee de Simple Cam Path ; ce noeud ne fait que lire l'etat.
- Si 'id' est fourni mais ne correspond pas a la trajectoire active, le noeud est considere inactif.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet done et completedFlag a zero. | 35 |
| `C:_executionStopped()` | Vide. | 40 |
| `C:drawMiddle(builder, style)` | Dessine le milieu du noeud (vide). | 79 |
| `C:init()` | Vide. | 32 |
| `C:work()` | Sur reset, repart de zero. flow suit l'entree. Avec du flux, determine si la trajectoire est active, puis calcule inactive/complete/completed/incomplete/duration via camera:isPathComplete et getPathDuration. | 43 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua`.*
