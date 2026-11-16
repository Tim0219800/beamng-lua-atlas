# `flowgraph_nodes_gameplay_traffic_pursuitRoadblock`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Pursuit Roadblock » (once_instant). Place jusqu'à 3 véhicules (vehId1..3) en barrage routier avec gameplay_police.placeRoadblock. Entrées : pos, rot, width, angle, centerAngle, checkWidth (déclaré mais non transmis dans le code).

## Remarques

- Le pin checkWidth est déclaré mais jamais lu par workOnce.
- pos et rot sont convertis sans test de nil.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Rassemble les ids de véhicules, construit les paramètres {angle, centerAngle, width} et appelle gameplay_police.placeRoadblock. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock.lua`.*
