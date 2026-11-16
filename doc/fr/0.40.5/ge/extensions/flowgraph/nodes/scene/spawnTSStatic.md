# `flowgraph_nodes_scene_spawnTSStatic`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua` · VM : Game Engine (GE) · 142 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/spawnTSStatic")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Spawn TSStatic » (once_instant, auteur BeamNG). Crée un objet TSStatic avec shapeName, position, rotation et scale. Entrées : flow, reset, shapeName, position, rotation, scale. Sorties : flow, created (impulsion d'une frame), lastId. L'objet est supprimé à l'arrêt, à la fin de mission ou à la destruction.

## Remarques

- Le code d'un décalage (pin offset) est commenté dans createObject et n'a aucun effet.
- maxObjectCount n'est pas utilisé.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 100 |
| `C:createObject(objectName)` | Crée le TSStatic (canSave = false), l'enregistre sous spawnedObj_<time>_<id>_<n>, écrit lastId et notifie l'éditeur. | 41 |
| `C:destroy()` | Appelé à la destruction du noeud : nettoie les objets créés. | 136 |
| `C:init(mgr, ...)` | Initialise la liste d'objets et data.maxObjectCount = 1. | 35 |
| `C:onClientEndMission()` | Hook de fin de mission : nettoie les objets créés par le noeud. | 132 |
| `C:onNodeReset()` | Supprime tous les objets créés. | 104 |
| `C:work()` | Retombe created à false à la frame suivante. | 121 |
| `C:workOnce()` | Crée l'objet et lève created. | 116 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua`.*
