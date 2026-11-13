# `flowgraph_nodes_scene_pointOnDecalroad`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/pointOnDecalroad")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Point on Decalroad » (repeat_instant). Teste si un point (vec3) est sur une DecalRoad (roadId) via roadObj:containsPoint, en forcant z a l'altitude du premier noeud de la route. Sorties : inside / outside (flow), onRoad (bool), closestIdx (index du point de controle le plus proche, -1 si hors route), maxIdx (nombre de points - 1).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Reinitialise le cache de la route et vide les sorties. | 33 |
| `C:init()` | Initialise point a (0,0,0) et pz a 0. | 28 |
| `C:work()` | Recharge la route si roadId change, puis calcule closestIdx, onRoad, inside et outside. | 41 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua`.*
