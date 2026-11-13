# `flowgraph_nodes_states_stateNode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/states/stateNode.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/states/stateNode")` (fichier sous extensions/ mais pas une extension classique)

Noeud d'état « State Node » du stategraph (créé par _flowgraph_createStateNode). Représente un graphe cible (targetGraph) dans le graphe d'états ; pins : flow (entrée), success et fail (sorties de type state), plus des sorties personnalisées (transitions). Peut exporter son état en fichier .state.flow.json. Double-clic : ouvre le graphe cible.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:EndPin()` | Vide. | 146 |
| `C:_onDeserialized(data)` | Mémorise targetGraphId pour _postDeserialize. | 159 |
| `C:_onSerialize(res)` | Sauvegarde l'id du graphe cible (res.targetGraphId). | 151 |
| `C:_onSerializeState()` | Sérialise noeud + graphe cible pour l'export d'état (res.type = 'state'). | 185 |
| `C:_postDeserialize()` | Après chargement de tous les graphes, retrouve le graphe cible (id + décalage getGraphNodeOffset) et l'associe. | 163 |
| `C:doubleClicked()` | Sélectionne le graphe cible dans l'éditeur. | 113 |
| `C:drawCustomProperties()` | Liste déroulante « Target Graph » (graphes racine hors graphe d'états) et bouton « Export State » (sauvegarde JSON via editor_fileDialog). | 64 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 121 |
| `C:getTransitionNames()` | Renvoie la liste triée des noms de pins de sortie (transitions possibles). | 104 |
| `C:init(mgr)` | allowCustomOutPins = true, savePins = true. | 37 |
| `C:onCustomNameChanged(name)` | Renomme le graphe cible et renvoie un message d'historique. | 176 |
| `C:representsGraph()` | Renvoie le graphe cible représenté par ce noeud. | 31 |
| `C:setAutoStart(val)` | Vide (non utilisé). | 57 |
| `C:setTargetGraph(graph)` | Associe un graphe cible, reprend son nom et prend la couleur « groupstate » s'il s'agit d'un graphe d'états ; sinon nom « No Target! ». | 43 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/states/stateNode.lua`.*
