# `flowgraph_nodes_scene_camera_setCameraFOV`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/setCameraFOV")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Set Camera FOV » (categorie repeat_instant, couleur/icone camera). Pin d'entree : value (number), le champ de vision en degres. A chaque execution (work), passe en camera libre si ce n'est pas deja le cas puis appelle core_camera.setFOV(0, value). Au demarrage du graphe il memorise le FOV courant (core_camera.getFovDeg) et le restaure a l'arret.

## Remarques

- Si le pin value n'a pas de valeur, core_camera.setFOV est quand meme appele avec nil (pas de garde dans le code).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appele au demarrage du graphe : memorise le FOV actuel dans self._storedFov. | 30 |
| `C:_executionStopped()` | Appele a l'arret du graphe : restaure le FOV memorise puis l'oublie. | 33 |
| `C:drawMiddle(builder, style)` | Dessine la valeur du FOV (2 decimales) au milieu du noeud dans l'editeur. | 39 |
| `C:work()` | Force la camera libre (commands.setFreeCamera) si besoin, puis applique le FOV du pin value via core_camera.setFOV(0, ...). | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua`.*
