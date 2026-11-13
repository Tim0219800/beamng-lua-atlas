# `flowgraph_nodes_ui_endStats`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/endStats.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/endStats")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « End Stats » (catégorie repeat_instant) : rassemble les statistiques à afficher dans l'écran de fin. Pour chaque statistique i : entrées « label_i » (string ou table translationObject), « points_i », « maxPoints_i ». Entrée cachée « statData » (liste précédente) et sortie « statData » (table endStats) à brancher sur End Screen, éventuellement en chaînant plusieurs nœuds.

## Remarques

- Chaque statistique ajoute aussi relativePoints = points*100/maxPoints quand points et maxPoints existent (division par zéro si maxPoints = 0).
- Le compteur minimum dans l'éditeur est 1 (ptr < 1 -> 1), alors que count vaut 0 à l'initialisation.
- work() ajoute des éléments à la table d'entrée statData (modifiée en place) à chaque frame.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 37 |
| `C:_onDeserialized(res)` | Restaure count. | 105 |
| `C:_onSerialize(res)` | Sauvegarde count. | 101 |
| `C:drawCustomProperties()` | Champ « Count » pour le nombre de statistiques. | 41 |
| `C:drawMiddle(builder, style)` | Zone centrale vide. | 32 |
| `C:init()` | count = 0. | 28 |
| `C:updatePins(old, new)` | Ajuste le nombre de groupes de 3 pins d'entrée (label, points, maxPoints). | 58 |
| `C:work()` | Reprend la liste en entrée, ajoute une entrée {label, points, maxPoints, relativePoints} par statistique et l'écrit sur « statData ». | 86 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/endStats.lua`.*
