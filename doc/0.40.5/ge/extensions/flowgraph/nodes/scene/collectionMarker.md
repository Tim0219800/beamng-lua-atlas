# `flowgraph_nodes_scene_collectionMarker`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/collectionMarker")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Collection Marker » (repeat_instant, auteur BeamNG). Affiche un jeton colorable aux couleurs BeamNG (TSStatic art/shapes/collectible/s_collect_BNG.dae) avec une PointLight, qui flotte et tourne a la position du pin pos. Entrees : flow, reset (impulsion qui supprime le marqueur), pos (vec3), color (number 0-1 de orange a vert, ou couleur). Sortie : flow.

## Remarques

- Bug : le pin reset appelle self:clearMarkers(), methode qui n'existe pas dans ce fichier (seule hideMarker existe) : declencher reset provoque une erreur Lua.
- Les noms d'objets enregistres sont self.id..'marker' et self.id..'lighgt' (faute de frappe dans le nom de la lumiere, sans consequence).
- Le pin de sortie flow n'est jamais ecrit par ce noeud.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appele a l'arret du graphe : supprime le marqueur. | 42 |
| `C:destroy()` | Appele a la destruction du noeud : supprime le marqueur. | 94 |
| `C:hideMarker()` | Supprime l'objet marqueur et la lumiere et remet les references a nil. | 30 |
| `C:init(mgr, ...)` | Rien a initialiser. | 25 |
| `C:onClientEndMission()` | Hook de fin de mission : supprime le marqueur. | 89 |
| `C:work()` | Sur reset, appelle self:clearMarkers(). Sur flow, cree si besoin le TSStatic et la PointLight, puis met a jour position (avec oscillation verticale sinusoidale), rotation, couleur d'instance et lumiere (rayon 3). | 47 |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua`.*
