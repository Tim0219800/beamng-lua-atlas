# `flowgraph_nodes_gameplay_removeOtherVehicles`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua` · VM : Game Engine (GE) · 141 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/removeOtherVehicles")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Remove Other Vehicles » (catégorie once_instant). Supprime tous les véhicules sauf ceux dont l'id est donné sur les pins idToIgnore_1..N (le nombre N se règle dans les propriétés). Options : onlyDrivableVehs (n'utilise que getAllVehiclesByType) et onlyFlowgraphVehs (limite aux véhicules créés par le module vehicle du flowgraph). Appelle editor.onRemoveSceneTreeObjects si l'éditeur est présent, puis obj:delete().

## Remarques

- Les trois réglages (count, onlyDrivableVehs, onlyFlowgraphVehs) sont sauvegardés avec le graphe.
- Lorsque le nombre de pins diminue, les liens vers les pins retirés sont supprimés.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 133 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 127 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 27 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 21 |
| `C:updatePins(old, new)` | Ajoute ou retire des pins d'entrée idToIgnore_i pour passer de old à new ; supprime les liens des pins retirés. | 62 |
| `C:workOnce()` | Exécuté une seule fois (catégorie once_*) lorsque le nœud est déclenché : lit les pins d'entrée et applique l'effet. | 81 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua`.*
