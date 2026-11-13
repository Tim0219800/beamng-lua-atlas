# `flowgraph_nodes_scene_spawnLight`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/spawnLight")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « SpotLight » (repeat_instant, auteur BeamNG). Crée un objet SpotLight (worldEditorCppApi.createObject) et le met à jour. Entrées : update (flow), clear (impulsion), position, rotation, range (20), innerAngle (15), outerAngle (45), color, brightness (1). Sorties : created (impulsion), lastId. data.maxObjectCount (1) limite le nombre d'objets.

## Remarques

- Le nom construit dans createObject n'est jamais utilisé (pas de registerObject).
- Le pin de couleur doit contenir 4 composantes, sinon la concaténation échoue.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Supprime les lumières à l'arrêt. | 76 |
| `C:clearObjects()` | Supprime toutes les lumières créées. | 79 |
| `C:createObject(objectName)` | Crée la lumière avec les valeurs des pins (canSave = false), l'ajoute à la liste, écrit lastId et notifie l'éditeur. | 38 |
| `C:destroy()` | Appelé à la destruction du noeud : nettoie les objets créés. | 134 |
| `C:init(mgr, ...)` | Initialise la liste d'objets et data.maxObjectCount = 1. | 33 |
| `C:onClientEndMission()` | Hook de fin de mission : nettoie les objets créés par le noeud. | 129 |
| `C:work()` | Sur clear, supprime ; sinon crée la lumière si le maximum n'est pas atteint (created = true) et, avec update, la met à jour (position, rotation, angles, luminosité, portée, couleur). | 92 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua`.*
