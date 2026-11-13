# `flowgraph_nodes_gameplay_dragRace_setDragVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua` · VM : Game Engine (GE) · 136 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Drag Vehicles » (catégorie once_instant). Enregistre les véhicules de la course dans gameplay_drag_dragBridge.setVehicles. Les pins d'entrée par voie (vehId_i, isPlayable_i, dial_i, lane_i) sont créés dynamiquement selon le nombre choisi dans l'éditeur (count, sauvegardé). Sortie : flow (impulsion).

## Remarques

- Les voies sans vehId valide (> 0) sont ignorées ; si la liste est vide, le nœud ne donne pas de flux.
- Valeurs par défaut : isPlayable faux, dial -1, lane 1.
- À la suppression de pins, seuls les liens dont sourcePin correspond sont effacés (comparaison faite sur sourcePin alors que ce sont des pins d'entrée).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 35 |
| `C:_onDeserialized(res)` | Restaure mode et count et recrée les pins. | 130 |
| `C:_onSerialize(res)` | Sauvegarde mode et count. | 125 |
| `C:drawCustomProperties()` | Éditeur : champ count et choix de la fonction de fusion. | 39 |
| `C:drawMiddle(builder, style)` | Affiche le mode de fusion. | 30 |
| `C:init()` | count = 1, mode = 'first'. | 25 |
| `C:updatePins(old, new)` | Ajoute ou supprime les pins par voie pour passer de old à new. | 71 |
| `C:workOnce()` | Construit la liste {id, isPlayable, dial, lane} et appelle dragBridge.setVehicles. | 107 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua`.*
