# `flowgraph_nodes_scene_raycast`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/raycast.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/raycast")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Raycast » (repeat_instant, tags util/draw). Lance un rayon depuis pos dans la direction dir et touche le premier objet de collision statique (TSStatic, terrain) via castRayStatic. Entrées : pos, dir (vec3), dist (cachée, 1000 par défaut ; sinon longueur de dir). Sorties : hit/miss (flow), pos (point d'impact) et dist (distance parcourue). data.debug dessine sphères, ligne et texte.

## Remarques

- En cas d'absence d'impact, castRayStatic renvoie une distance >= dist et pos vaut alors le bout du rayon.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Désactive le debug (self.data.debug = false). | 28 |
| `C:work()` | Appelle castRayStatic(pos, dir, dist), calcule le point d'impact et écrit hit, miss, pos et dist. | 32 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/raycast.lua`.*
