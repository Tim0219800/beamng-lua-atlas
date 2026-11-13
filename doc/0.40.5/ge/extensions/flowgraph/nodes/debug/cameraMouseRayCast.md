# `flowgraph_nodes_debug_cameraMouseRayCast`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/cameraMouseRayCast.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/cameraMouseRayCast")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Camera Mouse Raycast » (catégorie repeat_instant, tags util/click). Tire un rayon depuis la caméra vers la position de la souris (cameraMouseRayCast) et sort le résultat. Sorties : clicking (impulsion au clic gauche), hold (maintenu), objID, objName, et pins cachés distance, pos (vec3), normal (vec3), face. Les clics sont ignorés si l'interface ImGui capture la souris. Le jeu note qu'il n'est peut-être plus nécessaire (nœud « mouse tool »).

## Remarques

- C.todo du jeu : « Might not be needed anymore, since we have mouse tool node. »
- Sans impact, toutes les sorties sont mises à nil/faux.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame : lance le rayon et remplit les pins (position, normale en tables {x,y,z}, objet touché) ; remet tout à nil/faux s'il n'y a pas de collision. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/cameraMouseRayCast.lua`.*
