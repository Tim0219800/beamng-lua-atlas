# `flowgraph_nodes_scene_storeStatics`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua` · VM : Game Engine (GE) · 329 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/storeStatics")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Store Statics » (auteur BeamNG). Mémorise la position, rotation, échelle et shape des TSStatic sélectionnés dans l'éditeur (stockage dans le noeud, sauvegardé avec le graphe) puis les fait apparaître au flow. Dans l'éditeur, le panneau permet de stocker la sélection, tout faire apparaître/disparaître, sélectionner ou vider. Entrées : flow, reset ; sortie : flow.

## Remarques

- La description du noeud (« Creates and manages spawning TSStatic objects ») est copiée de Spawn TSStatic.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Détecte si des objets stockés existent déjà dans la scène. | 224 |
| `C:_executionStopped()` | Supprime les objets sauf s'ils existaient avant le démarrage. | 233 |
| `C:_onDeserialized(nodeData)` | Restaure storedObjects et oublie les ids courants. | 321 |
| `C:_onSerialize(res)` | Sauvegarde storedObjects. | 317 |
| `C:clearObjects()` | Supprime tous les objets créés et oublie leurs ids. | 239 |
| `C:createObject(pos, rot, scl, shape)` | Crée un TSStatic depuis les données stockées et renvoie son id. | 194 |
| `C:destroy()` | Supprime les objets sauf s'ils existaient avant le démarrage. | 309 |
| `C:drawCustomProperties()` | Panneau de l'éditeur : liste des objets stockés, boutons Store Selected, Spawn All, Despawn All, Select All, Clear Storage. | 33 |
| `C:init(mgr, ...)` | Initialise objets et storedObjects. | 28 |
| `C:onClientEndMission()` | Hook de fin de mission : nettoie les objets créés par le noeud. | 305 |
| `C:spawnObjects(force)` | Crée tous les objets stockés (si aucun n'existe ou si force). | 265 |
| `C:updateStoredObjects(ids)` | Remplace le stockage par les TSStatic donnés (relève leur transformation), supprime les originaux puis les recrée. | 145 |
| `C:work()` | Sur reset, supprime ; sur flow, fait apparaître les objets stockés et active flow en sortie. | 292 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`, `getPosition`, `getRotation`, `getScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua`.*
