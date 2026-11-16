# `flowgraph_nodes_scene_camera_returnToVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/returnToVehicle.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/returnToVehicle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Return camera to vehicle' (categorie once_instant). Ramene la camera au vehicule actif depuis un autre mode (camera libre, etc.) avec commands.setGameCamera(). Aucun pin.

## Remarques

- Dans la branche d'avertissement, 'logTag' n'est pas defini dans le fichier (variable globale nil), le tag de log est donc nil.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Si un vehicule joueur existe, appelle commands.setGameCamera() ; sinon journalise un avertissement. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/returnToVehicle.lua`.*
