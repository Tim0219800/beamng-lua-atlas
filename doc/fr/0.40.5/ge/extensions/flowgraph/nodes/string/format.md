# `flowgraph_nodes_string_format`

*Fichier : `lua/ge/extensions/flowgraph/nodes/string/format.lua` · VM : Game Engine (GE) · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/string/format")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Format String » (repeat_instant). Applique string.format(data.pattern, valeurs...) avec jusqu'à 16 valeurs (pins d'entrée dynamiques value_1..value_N, N réglé par « Count » dans l'éditeur). Sortie : value (string). Pattern par défaut « %d ».

## Remarques

- Maximum 16 valeurs : au-delà de 16, work ne produit rien.
- Une valeur nil ou d'un type incompatible avec le format (ex. %d avec une chaîne) fait échouer string.format.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure count et recrée les pins. | 71 |
| `C:_onSerialize(res)` | Sauvegarde l'état du noeud dans la table donnée. | 67 |
| `C:drawCustomProperties()` | Champ « Count » (min 1) qui ajoute/retire des pins. | 31 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 145 |
| `C:init()` | data.pattern = '%d' et count = 1. | 22 |
| `C:postInit()` | Crée les pins value_i initiaux. | 27 |
| `C:updatePins(old, new)` | Crée ou supprime les pins value_i (et les liens associés) pour passer de old à new valeurs. | 49 |
| `C:work()` | Formate le pattern avec les valeurs value_1..value_count. | 77 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/string/format.lua`.*
