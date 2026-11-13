# `flowgraph_nodes_scene_spawnPrefab`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/spawnPrefab")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Spawn Prefab » (auteur BeamNG, behaviour once). Charge un prefab (.prefab.json ou ancien .prefab) à une position via spawnPrefab, l'ajoute au MissionGroup et l'enregistre dans le module prefab du flowgraph. Entrées : flow, reset, resetVeh, path, name, pos, useGlobalTranslation, silent. Sorties : flow, created (impulsion), id, origVehId (véhicule joueur avant spawn), success.

## Remarques

- Les objets du prefab ne sont pas supprimés par ce noeud : le module prefab s'en charge à la fin (sauf Keep Prefab).
- Charger un prefab avec véhicules change le véhicule du joueur ; origVehId permet de le retrouver.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Oublie les objets à l'arrêt. | 81 |
| `C:clearObjects()` | Vide la liste d'objets (sans supprimer le prefab de la scène). | 85 |
| `C:createObject()` | Résout le chemin (avec extensions possibles), crée le prefab (canSave = false), le met dans MissionGroup et dans modules.prefab ; en cas d'échec, objects = {'failed'}. | 45 |
| `C:destroy()` | Appelé à la destruction du noeud : oublie les objets. | 116 |
| `C:init(mgr, ...)` | Initialise la liste d'objets et origPositions. | 33 |
| `C:onClientEndMission()` | Hook de fin de mission : oublie les objets. | 112 |
| `C:postInit()` | Restreint le pin path aux fichiers .prefab.json et .prefab. | 38 |
| `C:work()` | Gère reset (oublie le prefab), resetVeh (restaure les positions des véhicules) et crée le prefab une seule fois par flow ; écrit created, flow et success. | 89 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua`.*
