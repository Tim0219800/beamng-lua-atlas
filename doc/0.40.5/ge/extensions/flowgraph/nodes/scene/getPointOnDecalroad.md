# `flowgraph_nodes_scene_getPointOnDecalroad`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua` · VM : Game Engine (GE) · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/getPointOnDecalroad")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Get Point on Decalroad » (repeat_instant). Donne la position d'un point de controle d'une DecalRoad (roadId, idx) et une approximation de sa direction (quat). Si la route est en boucle ('looped'), les voisins du premier/dernier point bouclent ; sinon ils sont clampes. Le calcul n'est refait que si roadId ou idx change.

## Remarques

- idx est base 0, borne a [0, getNodeCount()-1] ; hors bornes le noeud ne fait rien.
- La direction est calculee comme position(precedent) - position(suivant) : verifier le sens si la rotation semble inversee. Le code la dit approximative.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Reinitialise le cache (oldRoadId, oldIdx, roadObj) et vide les pins de sortie. | 28 |
| `C:init()` | Rien a initialiser. | 24 |
| `C:work()` | Cherche la route, calcule pos ({x,y,z} du noeud idx) et rot (quatFromDir de la direction suivant->precedent, vecteur haut Z). | 37 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua`.*
