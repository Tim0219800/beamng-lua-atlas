# `flowgraph_nodes_util_getMapObjectsDynField`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/getMapObjectsDynField")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Map Objects IDs by DynField » (repeat_instant). Renvoie la liste des ids des objets de la carte (map.objects, donc les véhicules suivis) qui possèdent un champ dynamique donné. Entrée : dynamicFieldName. Sortie : objects (table d'ids).

## Remarques

- Seul le nom du champ est testé, pas sa valeur.
- Recalcule à chaque frame : coût proportionnel au nombre d'objets.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Met oldPos à nil (champ inutilisé ensuite). | 24 |
| `C:findObjectsWithDynField(dynamicFieldName)` | Parcourt map.objects, lit object:getDynamicFields() et renvoie les ids dont un nom correspond. | 28 |
| `C:init(mgr)` | Ne fait rien. | 20 |
| `C:work()` | Si le nom est fourni, recalcule la liste à chaque frame et l'écrit dans objects. | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua`.*
