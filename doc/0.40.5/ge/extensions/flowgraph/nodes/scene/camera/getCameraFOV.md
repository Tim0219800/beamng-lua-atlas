# `flowgraph_nodes_scene_camera_getCameraFOV`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/getCameraFOV.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/getCameraFOV")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Get Camera FOV' (categorie repeat_instant). Donne le champ de vision courant de la camera en degres (core_camera.getFovDeg) sur la sortie 'curFOV'.

## Remarques

- Effet de bord : le simple fait de lire le FOV force la camera libre (commands.setFreeCamera).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche 'Current FOV'. | 30 |
| `C:work()` | Passe en camera libre si ce n'est pas deja le cas, puis lit le FOV. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/getCameraFOV.lua`.*
